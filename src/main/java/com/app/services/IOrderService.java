package com.app.services;

import com.app.dtos.OrderDTO;
import com.app.exceptions.DataNotFoundException;
import com.app.models.Order;
import com.app.responses.OrderResponse;

import java.util.List;

public interface IOrderService {
    Order createOrder(OrderDTO orderDto) throws Exception;

    Order getOrder(Long id) throws DataNotFoundException;

    Order updateOrder(Long id, OrderDTO orderDto) throws DataNotFoundException;

    void deleteOrder(Long id);

    List<Order> findByUserId(Long Id);
}
