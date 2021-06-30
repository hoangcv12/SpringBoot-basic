package com.it15031.mapper;

import org.modelmapper.ModelMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.it15031.dto.Userdto;
import com.it15031.entity.User;

@Service
public class Usermapper {
	@Autowired
	private  ModelMapper mapper;
	
	public User convertToEntity(Userdto userDTO) {
		 User entity=mapper.map(userDTO, User.class);
		//mapper.validate();
		 return entity;
	}
	
public  Userdto convertToDTO (User entity){
	 Userdto userdto=mapper.map(entity, Userdto.class);
	 return userdto;
	}
}
