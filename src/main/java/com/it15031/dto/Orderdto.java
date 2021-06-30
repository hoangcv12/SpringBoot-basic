package com.it15031.dto;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Orderdto {
	private Integer id;
	private String createDate;
	private String address;
	private Integer user;
}
