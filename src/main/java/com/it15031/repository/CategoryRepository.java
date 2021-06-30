package com.it15031.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import com.it15031.entity.Category;
import com.it15031.entity.User;

public interface CategoryRepository extends JpaRepository<Category, Integer>{
	
}
