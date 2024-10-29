package com.app.services;

import com.app.dtos.OrderDTO;
import com.app.repositories.OrderRepository;
import com.app.responses.OrderResponse;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@RequiredArgsConstructor
public class OrderService implements IOrderService {
    private final OrderRepository orderRepository;

    @Override
    public OrderResponse createOrder(OrderDTO orderDto) {
        return null;
    }

    @Override
    public OrderResponse getOrder(Long id) {
        return null;
    }

    @Override
    public OrderResponse updateOrder(Long id, OrderDTO orderDto) {
        return null;
    }

    @Override
    public OrderResponse deleteOrder(Long id) {
        return null;
    }

    @Override
    public List<OrderResponse> getAllOrders(Long userId) {
        return List.of();
    }
}
