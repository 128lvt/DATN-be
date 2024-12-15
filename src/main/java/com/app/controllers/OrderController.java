package com.project.shopapp.controller;

import com.project.shopapp.dto.OrderDTO;
import com.project.shopapp.model.Order;
import com.project.shopapp.response.Response;
import com.project.shopapp.service.order.OrderService;
import com.project.shopapp.service.variant.VariantService;
import jakarta.validation.Valid;
import lombok.RequiredArgsConstructor;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@RestController
@RequestMapping("${api.prefix}/orders")
@RequiredArgsConstructor
public class OrderController {
    private final OrderService orderService;
    private final VariantService variantService;

    @PostMapping
    public ResponseEntity<?> createOrder(@RequestBody @Valid OrderDTO orderDTO) {
        try {
            Order order = orderService.createOrder(orderDTO);
            return ResponseEntity.ok().body(Response.builder()
                    .message("getOrders successful")
                    .data(order)
                    .build());
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @GetMapping("/user/{user_id}")
    public ResponseEntity<?> getOrders(@Valid @PathVariable("user_id") Long userId) {
        try {
            List<Order> orders = orderService.findByUserId(userId);
            return ResponseEntity.ok().body(Response.builder()
                    .message("getOrders successful")
                    .data(orders)
                    .build());
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<?> getOrder(@Valid @PathVariable("id") Long orderId) {
        try {
            Order order = orderService.getOrder(orderId);
            return ResponseEntity.ok().body(Response.builder()
                    .message("getOrder successful")
                    .data(order)
                    .build());
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PutMapping("/{id}")
    public ResponseEntity<?> updateOrder(@Valid @PathVariable Long id, @RequestBody @Valid OrderDTO orderDTO) {
        try {
            Order order = orderService.updateOrder(id, orderDTO);
            return ResponseEntity.ok().body(Response
                    .builder()
                    .message("Update order successfully")
                    .data(order)
                    .build());
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }

    @PutMapping("/status/{id}")
    public ResponseEntity<?> updateOrderStatus(@Valid @PathVariable("id") Long id, @RequestParam(value = "status") String status) {
        try {
            orderService.updateStatus(id, status);
            return ResponseEntity.ok().body(Response.success("Chỉnh sửa trạng thái thành công"));
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(Response.error(e.getMessage()));
        }
    }

    @GetMapping
    public ResponseEntity<?> getAllOrders() {
        return ResponseEntity.ok().body(Response.success(orderService.getAllOrders()));
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteOrder(@Valid @PathVariable Long id) {
        // cap nhat truong active
        try {
            orderService.deleteOrder(id);
            return ResponseEntity.ok().body(Response
                    .builder()
                    .message("Delete order successfully")
                    .build());
        } catch (Exception e) {
            return ResponseEntity.badRequest().body(e.getMessage());
        }
    }
}
