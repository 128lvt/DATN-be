package com.project.shopapp.controller;

import com.project.shopapp.dto.OrderDTO;
import com.project.shopapp.exception.DataNotFoundException;
import com.project.shopapp.model.Order;
import com.project.shopapp.momo.config.Environment;
import com.project.shopapp.momo.enums.RequestType;
import com.project.shopapp.momo.models.PaymentResponse;
import com.project.shopapp.momo.processor.CreateOrderMoMo;
import com.project.shopapp.momo.shared.utils.Encoder;
import com.project.shopapp.momo.shared.utils.LogUtils;
import com.project.shopapp.response.Response;
import com.project.shopapp.service.order.OrderService;
import lombok.RequiredArgsConstructor;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.Map;
import java.util.TreeMap;

@RestController
@RequestMapping("${api.prefix}/payments/momo")
@RequiredArgsConstructor
public class PaymentController {
    private final OrderService orderService;
    private final org.springframework.core.env.Environment environment;
    private final ModelMapper modelMapper;

    @Value("${returnUrl}")
    String returnUrl;

    @Value("${notifyUrl}")
    String notifyUrl;

    @PostMapping
    public ResponseEntity<?> createOrder(@RequestBody OrderDTO orderDTO) {
        LogUtils.init();
        try {
            Order order = orderService.createOrder(orderDTO);

            String requestId = String.valueOf(System.currentTimeMillis());
            Long orderId = order.getId();
            Long transId = 2L;
            Long amount = (long) order.getTotalMoney().floatValue();

            String partnerClientId = "partnerClientId";
            String orderInfo = "Pay With MoMo";
            String returnURL = returnUrl;
            String notifyURL = notifyUrl;
            String callbackToken = "callbackToken";
            String token = "";
            Environment environment = Environment.selectEnv("dev");


            PaymentResponse captureATMMoMoResponse = CreateOrderMoMo.process(environment, orderId.toString(), requestId, String.valueOf(amount), orderInfo, returnURL, notifyURL, "", RequestType.PAY_WITH_ATM, null);


            assert captureATMMoMoResponse != null;
            return ResponseEntity.ok().body(Response.builder()
                    .message("Tạo đơn hàng thành công")
                    .data(Map.of(
                            "order", order,
                            "payment", captureATMMoMoResponse
                    ))
                    .build());
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @GetMapping("/callback")
    public ResponseEntity<String> handleMoMoCallback(
            @RequestParam("partnerCode") String partnerCode,
            @RequestParam("orderId") String orderId,
            @RequestParam("requestId") String requestId,
            @RequestParam("amount") String amount,
            @RequestParam("orderInfo") String orderInfo,
            @RequestParam("orderType") String orderType,
            @RequestParam("transId") String transId,
            @RequestParam("resultCode") String resultCode,
            @RequestParam("message") String message,
            @RequestParam("payType") String payType,
            @RequestParam("responseTime") String responseTime,
            @RequestParam(value = "extraData", required = false) String extraData,
            @RequestParam("signature") String signature
    ) throws DataNotFoundException {
        // Log thông tin nhận được
        System.out.println("MoMo Callback received:");
        System.out.println("Partner Code: " + partnerCode);
        System.out.println("Order ID: " + orderId);
        System.out.println("Request ID: " + requestId);
        System.out.println("Amount: " + amount);
        System.out.println("Order Info: " + orderInfo);
        System.out.println("Order Type: " + orderType);
        System.out.println("Transaction ID: " + transId);
        System.out.println("Result Code: " + resultCode);
        System.out.println("Message: " + message);
        System.out.println("Pay Type: " + payType);
        System.out.println("Response Time: " + responseTime);
        System.out.println("Extra Data: " + extraData);
        System.out.println("Signature: " + signature);

        // Xử lý logic kiểm tra chữ ký (signature)
        boolean isValid = validateSignature(partnerCode, orderId, requestId, amount, orderInfo, orderType, transId, resultCode, message, payType, responseTime, extraData, signature);

        if (!isValid) {
            return ResponseEntity.status(HttpStatus.BAD_REQUEST).body("Invalid signature");
        }

        // Xử lý logic dựa trên resultCode (0 = thành công, khác 0 = thất bại)
        if ("0".equals(resultCode)) {
            orderService.updatePaymentStatus(Long.parseLong(orderId), "Đã thanh toán");
            System.out.println("Transaction successful!");
        } else {
            // Giao dịch thất bại
            System.out.println("Transaction failed: " + message);
        }

        // Trả về phản hồi cho MoMo
        return ResponseEntity.noContent().build();
    }

    private boolean validateSignature(String partnerCode, String orderId, String requestId, String amount,
                                      String orderInfo, String orderType, String transId, String resultCode,
                                      String message, String payType, String responseTime, String extraData,
                                      String signature) {
        try {
            String requestType = "";

            // Kiểm tra loại giao dịch
            if (payType.equalsIgnoreCase("napas")) {
                requestType = RequestType.PAY_WITH_ATM.getRequestType();
            }

            // Lấy thông tin môi trường và khóa bí mật
            Environment environment = Environment.selectEnv("dev");
            String secretKey = environment.getPartnerInfo().getSecretKey();

            // Sắp xếp các tham số và tạo chuỗi raw data theo thứ tự a-z
            Map<String, String> params = new TreeMap<>();
            params.put("accessKey", environment.getPartnerInfo().getAccessKey());
            params.put("amount", amount);
            params.put("extraData", extraData);
            params.put("message", message);
            params.put("orderId", orderId);
            params.put("orderInfo", orderInfo);
            params.put("orderType", orderType);
            params.put("partnerCode", partnerCode);
            params.put("payType", payType);
            params.put("requestId", requestId);
            params.put("responseTime", responseTime);
            params.put("resultCode", resultCode);
            params.put("transId", transId);

            // Tạo chuỗi raw data từ các tham số đã sắp xếp
            StringBuilder rawData = new StringBuilder();
            for (Map.Entry<String, String> entry : params.entrySet()) {
                rawData.append(entry.getKey()).append("=").append(entry.getValue()).append("&");
            }

            // Loại bỏ dấu '&' thừa ở cuối chuỗi
            rawData.deleteCharAt(rawData.length() - 1);

            // Tính toán chữ ký HMAC-SHA256
            String signRequest = Encoder.signHmacSHA256(rawData.toString(), secretKey);

            // So sánh chữ ký tính toán với chữ ký nhận được
            return signRequest.equals(signature);
        } catch (Exception e) {
            e.printStackTrace();
            return false;
        }
    }

}
