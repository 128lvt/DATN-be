package com.app.services;

import com.app.dtos.OrderDetailDTO;
import com.app.exceptions.DataNotFoundException;
import com.app.models.Order;
import com.app.models.OrderDetail;
import com.app.models.Product;
import com.app.models.ProductVariant;
import com.app.repositories.OrderDetailRepository;
import com.app.repositories.OrderRepository;
import com.app.repositories.ProductRepository;
import com.app.repositories.ProductVariantRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class OrderDetailService implements IOrderDetailService {
    private final OrderDetailRepository orderDetailRepository;
    private final OrderRepository orderRepository;
    private final ProductRepository productRepository;
    private final ProductVariantRepository productVariantRepository;

    @Override
    public OrderDetail createOrderDetail(OrderDetailDTO orderDetailDTO) throws DataNotFoundException {
        Order order = orderRepository.findById(orderDetailDTO.getOrderId())
                .orElseThrow(() -> new DataNotFoundException("Order not found"));
        Product product = productRepository.findById(orderDetailDTO.getProductId())
                .orElseThrow(() -> new DataNotFoundException("Product not found"));
        ProductVariant productVariant = productVariantRepository.findById(orderDetailDTO.getVariantId())
                .orElseThrow(() -> new DataNotFoundException("Product variant not found"));

        OrderDetail orderDetail = OrderDetail.builder()
                .order(order)
                .product(product)
                .numberOfProducts(orderDetailDTO.getNumberOfProducts())
                .totalMoney(OrderDetailDTO.gettotalMoney())
                .productVariant(productVariant)
                .build();

        return orderDetailRepository.save(orderDetail);
    }

    @Override
    public OrderDetail updateOrderDetail(Long id, OrderDetailDTO orderDetailDTO) throws DataNotFoundException {
        OrderDetail orderDetail = orderDetailRepository.findById(id)
                .orElseThrow(() -> new DataNotFoundException("OrderDetail not found"));
        Order order = orderRepository.findById(orderDetailDTO.getOrderId())
                .orElseThrow(() -> new DataNotFoundException("Order not found"));
        Product product = productRepository.findById(orderDetailDTO.getProductId())
                .orElseThrow(() -> new DataNotFoundException("Product not found"));
        ProductVariant productVariant =     productVariantRepository.findById(orderDetailDTO.getVariantId())
                .orElseThrow(() -> new DataNotFoundException("Product variant not found"));

        orderDetail.setProduct(product);
        orderDetail.setProduct(ProductVariant);
        orderDetail.setNumberOfProducts(orderDetailDTO.getNumberOfProducts());
        orderDetail.setTotalMoney(OrderDetailDTO.getTotalMoney());
        orderDetail.setOrder(order);

        return orderDetailRepository.save(orderDetail);
    }

    @Override
    public OrderDetail getOrderDetail(Long id) throws DataNotFoundException {
        return orderDetailRepository.findById(id)
                .orElseThrow(() -> new DataNotFoundException("OrderDetail not found"));
    }

    @Override
    public void deleteOrderDetail(Long id) throws DataNotFoundException {
        OrderDetail orderDetail = orderDetailRepository.findById(id)
                .orElseThrow(() -> new DataNotFoundException("OrderDetail not found"));
        orderDetailRepository.deleteById(id);
    }

    @Override
    public List<OrderDetail> getOrderDetails() {
        return orderDetailRepository.findAll();
    }

    @Override
    public List<OrderDetail> findByOrderId(Long orderId) throws DataNotFoundException {
        Order order = orderRepository.findById(orderId)
                .orElseThrow(() -> new DataNotFoundException("Order not found"));
        return orderDetailRepository.findByOrderId(orderId);
    }
}
