package com.app.repositories;

import com.app.models.Order;
import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface OrderRepository  extends JpaRepository<Order, Long> {
    //Tim don hang cua 1 user

    List<Order> findByUserId(Long userID);
}
