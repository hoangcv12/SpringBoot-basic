package com.it15031.dto;

import java.util.Date;

import javax.persistence.Temporal;
import javax.persistence.TemporalType;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class Productdto {
	
private Integer id;

private String name;

private String image;

private Integer price;

private String create_date;

private Integer avilable;

private Integer category;
}
