package com.it15031.mapper;

import org.apache.catalina.mapper.Mapper;
import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it15031.dto.Productdto;
import com.it15031.dto.Userdto;
import com.it15031.entity.Product;
import com.it15031.entity.User;

@Service
public class Productmapper {
	@Autowired
	private  ModelMapper mapper;
	
	
	
	public Product convertToEntity(Productdto prDTO) {
		
		Product entity=mapper.map(prDTO, Product.class);
		//mapper.validate();
		 return entity;
	}
	
public  Productdto convertToDTO (Product entity){
	Productdto prdto=mapper.map(entity, Productdto.class);
	 return prdto;
	}
}
