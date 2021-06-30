package com.it15031.mapper;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it15031.dto.Order_detaildto;
import com.it15031.entity.Order_detail;

@Service
public class OrderDetailMapper {
	@Autowired
	private ModelMapper mapper;
	
	public Order_detail convertToEntity(Order_detaildto dto)
	{
		Order_detail entity = mapper.map(dto, Order_detail.class);
		return entity;
	}
	
	public Order_detaildto convertToDTO(Order_detail entity)
	{
		Order_detaildto orderdetailDTO = mapper.map(entity, Order_detaildto.class);
		return orderdetailDTO;
	}
}
