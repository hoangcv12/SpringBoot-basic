package com.it15031.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.it15031.entity.Order;
import com.it15031.entity.User;

public interface OrderRepository extends JpaRepository<Order, Integer> {
	@Query("SELECT entity FROM Order entity WHERE user=:user")
	public Order findByUser(@Param("user") User user) ;
}
