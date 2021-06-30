package com.it15031.controller;

import java.io.File;
import java.io.IOException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;
import java.util.Optional;
import java.util.TimeZone;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.data.domain.Sort.Direction;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.StringUtils;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.it15031.dto.Categorydto;
import com.it15031.dto.Productdto;
import com.it15031.dto.Userdto;
import com.it15031.entity.Category;
import com.it15031.entity.Product;
import com.it15031.entity.User;
import com.it15031.mapper.Categorymapper;
import com.it15031.mapper.Productmapper;
import com.it15031.mapper.Usermapper;
import com.it15031.repository.CategoryRepository;
import com.it15031.repository.ProductRepository;
import com.it15031.repository.UserRepository;
import com.it15031.utils.HashUtils;
import com.it15031.utils.UploadFileUtils;

@Controller
@RequestMapping("admin/products")
public class ProductController {
	@Autowired
	private Productmapper mapper;
	@Autowired
	private Categorymapper mappercate;
	
	@Autowired
	ProductRepository productrepo;	
	@Autowired
	CategoryRepository caterepo;	
	
	@Autowired
	private UploadFileUtils uploadUtil;
	
	@Autowired
	private HttpServletRequest request;
	@GetMapping("views")
	public String view(Model model) {
		
		model.addAttribute("Product",productrepo.findAll());
		model.addAttribute("view","admin/product/views.jsp");
		return "layout";	
	}
	
	
	@GetMapping("create")
	public String create(Model model,Product entity) {
		List<Category> cate=caterepo.findAll();
		model.addAttribute("category",cate);
		model.addAttribute("PRODUCT",entity);
		model.addAttribute("view","admin/product/create.jsp");
		return "layout";
	}
	@PostMapping("SaveOrUpdate")
	public String saveorupdate(
			@Validated @ModelAttribute("PRODUCT") Productdto dto,BindingResult result, Model model,
			@RequestParam("imageFile") MultipartFile uploadedFile
			) throws IOException, ParseException{
		if(result.hasErrors() ) {
			System.out.println(result.getAllErrors());
			return "redirect:/admin/products/create";
		}
		Product entity = mapper.convertToEntity(dto);
	Date date = new SimpleDateFormat("yyyy-MM-dd").parse(dto.getCreate_date());
	entity.setCreateDate(date);
		String String = request.getParameter("category");
		int id=Integer.parseInt(String);
		Category caentity=caterepo.getOne(id);
		entity.setCategory(caentity);
		File fileimg=uploadUtil.handleUploadFile(uploadedFile);
		entity.setImage(fileimg.getName());
		productrepo.save(entity);
		model.addAttribute("PRODUCT",dto );
		return "redirect:/admin/products/create";
	}
	
	@GetMapping("edit/{id}")
	public String edit(@PathVariable("id") Integer id,Model model) {
		Optional< Product> pro=productrepo.findById(id);
		if(pro.isPresent()) {
			Productdto prodto = mapper.convertToDTO(pro.get());
			prodto.setCategory(pro.get().getCategory().getId());
			System.out.println("hello");
			model.addAttribute("PRODUCT", prodto);
			model.addAttribute("view","admin/product/edit.jsp");
			return "layout" ; 
		}else {
			return "redirect:/admin/products/views";
		}
	}
	
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable("id") Integer id) {
		productrepo.deleteById(id);
		return "redirect:/admin/products/views";
	}

}
