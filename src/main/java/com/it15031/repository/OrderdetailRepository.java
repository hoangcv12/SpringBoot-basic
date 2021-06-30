package com.it15031.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.it15031.entity.Order;
import com.it15031.entity.Order_detail;
import com.it15031.entity.Product;
import com.it15031.entity.User;

public interface OrderdetailRepository extends JpaRepository<Order_detail, Integer> {
	@Query("SELECT entity FROM Order_detail entity WHERE product=:product")
	public Order_detail findByProduct (@Param("product") Product product) ;
}
