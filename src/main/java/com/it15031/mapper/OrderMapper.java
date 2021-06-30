package com.it15031.mapper;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it15031.dto.Orderdto;
import com.it15031.entity.Order;




@Service
public class OrderMapper {
	@Autowired
	private ModelMapper mapper;
	
	public Order convertToEntity(Orderdto orderDTO)
	{
		Order entity = mapper.map(orderDTO, Order.class);
		return entity;
	}
	
	public Orderdto convertToDTO(Order entity)
	{
		Orderdto orderDTO = mapper.map(entity, Orderdto.class);
		return orderDTO;
	}
}
