package com.it15031.mapper;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it15031.dto.Categorydto;
import com.it15031.dto.Productdto;
import com.it15031.entity.Category;
import com.it15031.entity.Product;

@Service
public class Categorymapper {
	@Autowired
	private  ModelMapper mapper;
	
	
	
	public Category convertToEntity(Categorydto catedto) {
		
		Category entity=mapper.map(catedto, Category.class);
		//mapper.validate();
		 return entity;
	}
	
public  Categorydto convertToDTO (Category entity){
	Categorydto catedto=mapper.map(entity, Categorydto.class);
	 return catedto;
	}
}
