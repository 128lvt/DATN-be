package com.app.services;

import com.app.dtos.OrderDetailDTO;
import com.app.exceptions.DataNotFoundException;
import com.app.models.OrderDetail;

import java.util.List;

public interface IOrderDetailService {
    OrderDetail createOrderDetail(OrderDetailDTO orderDetailDTO) throws DataNotFoundException;

    OrderDetail updateOrderDetail(Long id, OrderDetailDTO orderDetailDTO) throws DataNotFoundException;

    OrderDetail getOrderDetail(Long id) throws DataNotFoundException;

    void deleteOrderDetail(Long id) throws DataNotFoundException;

    List<OrderDetail> getOrderDetails();

    List<OrderDetail> findByOrderId(Long orderId) throws DataNotFoundException;
}