package com.project.shopapp.service.order;

import com.project.shopapp.dto.OrderDetailDTO;
import com.project.shopapp.exception.DataNotFoundException;
import com.project.shopapp.model.Order;
import com.project.shopapp.model.OrderDetail;
import com.project.shopapp.model.Product;
import com.project.shopapp.model.ProductVariant;
import com.project.shopapp.repository.OrderDetailRepository;
import com.project.shopapp.repository.OrderRepository;
import com.project.shopapp.repository.ProductRepository;
import com.project.shopapp.repository.ProductVariantRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class OrderDetailService {
    private final OrderDetailRepository orderDetailRepository;
    private final OrderRepository orderRepository;
    private final ProductRepository productRepository;
    private final ProductVariantRepository productVariantRepository;

    public OrderDetail createOrderDetail(OrderDetailDTO orderDetailDTO) throws DataNotFoundException {
        Order order = orderRepository.findById(orderDetailDTO.getOrderId()).orElseThrow(() -> new DataNotFoundException("Order not found"));
        Product product = productRepository.findById(orderDetailDTO.getProductId()).orElseThrow(() -> new DataNotFoundException("Product not found"));
        ProductVariant productVariant = productVariantRepository.findById(orderDetailDTO.getVariantId()).orElseThrow(() -> new DataNotFoundException("Product variant not found"));

        OrderDetail orderDetail = OrderDetail
                .builder()
                .order(order)
                .product(product)
                .numberOfProducts(orderDetailDTO.getNumberOfProducts())
                .productVariant(productVariant)
                .build();
        return orderDetailRepository.save(orderDetail);
    }

    public OrderDetail updateOrderDetail(Long id, OrderDetailDTO orderDetailDTO) throws DataNotFoundException {
        OrderDetail orderDetail = orderDetailRepository.findById(id).orElseThrow(() -> new DataNotFoundException("OrderDetail not found"));
        Order order = orderRepository.findById(orderDetailDTO.getOrderId()).orElseThrow(() -> new DataNotFoundException("Order not found"));
        Product product = productRepository.findById(orderDetailDTO.getProductId()).orElseThrow(() -> new DataNotFoundException("Product not found"));
        ProductVariant productVariant = productVariantRepository.findById(orderDetailDTO.getVariantId()).orElseThrow(() -> new DataNotFoundException("Product variant not found"));

        orderDetail.setProduct(product);
        orderDetail.setProductVariant(productVariant);
        orderDetail.setNumberOfProducts(orderDetailDTO.getNumberOfProducts());
        orderDetail.setOrder(order);

        return orderDetailRepository.save(orderDetail);
    }

    public OrderDetail getOrderDetail(Long id) throws DataNotFoundException {
        return orderDetailRepository.findById(id).orElseThrow(() -> new DataNotFoundException("OrderDetail not found"));
    }

    public void deleteOrderDetail(Long id) throws DataNotFoundException {
        OrderDetail orderDetail = orderDetailRepository.findById(id).orElseThrow(() -> new DataNotFoundException("OrderDetail not found"));
        orderDetailRepository.deleteById(id);
    }

    public List<OrderDetail> getOrderDetails() {
        return orderDetailRepository.findAll();
    }

    public List<OrderDetail> findByOrderId(Long orderId) throws DataNotFoundException {
        Order order = orderRepository.findById(orderId).orElseThrow(() -> new DataNotFoundException("Order not found"));
        return orderDetailRepository.findByOrderId(orderId);
    }
}
