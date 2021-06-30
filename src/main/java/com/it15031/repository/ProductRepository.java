package com.it15031.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.it15031.entity.Product;

public interface ProductRepository extends JpaRepository<Product, Integer>{

}
