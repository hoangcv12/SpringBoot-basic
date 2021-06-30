package com.it15031.dto;

import javax.validation.constraints.Email;
import javax.validation.constraints.NotBlank;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Null;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Userdto {
	
	private Integer id;
	
	@NotNull
	@NotBlank
	private String username;
	
	
	@NotNull
	@NotBlank
	@Email
	private String email;
	
	
	@NotNull
	@NotBlank
	private String password;
	
//	@NotNull
//	@NotBlank
//	private String password_confirm;
	
	
//	@NotNull
//	@NotBlank
	private String photo;
	
	
	@NotNull
	private Integer activated;
	
	@NotNull
	private String admin;
}
