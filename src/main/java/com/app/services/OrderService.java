package com.app.services;

import com.app.dtos.OrderDTO;
import com.app.exceptions.DataNotFoundException;
import com.app.models.Order;
import com.app.models.User;
import com.app.repositories.OrderRepository;
import com.app.repositories.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.stereotype.Service;

import java.time.LocalDate;
import java.util.List;

@Service
@RequiredArgsConstructor
public class OrderService implements IOrderService {
    private final OrderRepository orderRepository;
    private final UserRepository userRepository;

    /*ModelMapper áp dụng cho đối tượng có nhiều trường giống nhau*/
    @Override
    public Order createOrder(OrderDTO orderDTO) throws Exception {
        /*Kiểm tra user_id có tồn tại hay chưa*/
        User user = userRepository.findById(orderDTO.getUserId()).orElseThrow(() -> new DataNotFoundException("User Not Found"));
        Order order = new Order();
        /*Kiểm tra shipping date phải >= ngày đặt hàng*/
        LocalDate shippingDate = orderDTO.getShippingDate() == null ? LocalDate.now() : order.getShippingDate();
        if (shippingDate.isBefore(LocalDate.now())) {
            throw new DataNotFoundException("Date must be at least today");
        }
        order.setShippingDate(shippingDate);
        order.setActive(true);
        orderRepository.save(order);
        return order;
    }

    @Override
    public Order getOrder(Long id) throws DataNotFoundException {
        return orderRepository.findById(id).orElseThrow(() -> new DataNotFoundException("Order Not Found"));
    }

    @Override
    public Order updateOrder(Long id, OrderDTO orderDto) throws DataNotFoundException {
        Order order = orderRepository.findById(id).orElseThrow(() -> new DataNotFoundException("Order not found"));
        User existingUser = userRepository.findById(orderDto.getUserId()).orElseThrow(() -> new DataNotFoundException("User not found"));

        order.setUser(existingUser);

        return orderRepository.save(order);
    }

    @Override
    public void deleteOrder(Long id) {
        Order order = orderRepository.findById(id).orElseThrow(() -> new RuntimeException("Order not found"));
        order.setActive(false);
        orderRepository.save(order);
    }

    public void hardDelete(Long id) {
        orderRepository.deleteById(id);
    }

    public List<Order> getAllOrders() {
        return (List<Order>) orderRepository.findAll();
    }

    @Override
    public List<Order> findByUserId(Long id) {
        return orderRepository.findByUserId(id);
    }
}
