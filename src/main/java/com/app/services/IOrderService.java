package com.app.services;

import com.app.dtos.OrderDTO;
import com.app.responses.OrderResponse;

import java.util.List;

public interface IOrderService {
    OrderResponse createOrder(OrderDTO orderDto);

    OrderResponse getOrder(Long id);

    OrderResponse updateOrder(Long id, OrderDTO orderDto);

    OrderResponse deleteOrder(Long id);

    List<OrderResponse> getAllOrders(Long userId);
}
