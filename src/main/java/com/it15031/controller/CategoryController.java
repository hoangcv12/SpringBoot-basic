package com.it15031.controller;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.it15031.ModelMapperConfig;
import com.it15031.dto.Categorydto;
import com.it15031.entity.Category;
import com.it15031.mapper.Categorymapper;
import com.it15031.mapper.Usermapper;
import com.it15031.repository.CategoryRepository;


@Controller
@RequestMapping("admin/category")
public class CategoryController {
	@Autowired
	CategoryRepository caterepo;
	
	@Autowired
	private Categorymapper mapper;
	
	@GetMapping("views")
	public String views(Model model ) {
		model.addAttribute("CATEGORY", caterepo.findAll());
		model.addAttribute("view", "admin/category/views.jsp");
		return "layout";
	}
	
	@GetMapping("create")
	public String create(Model model ) {
		model.addAttribute("CATEGORY", "admin/category/create.jsp");
		return "layout";
	}
	
	@PostMapping("save")
	public String save(Categorydto cate) {
		
			Category entity=mapper.convertToEntity(cate);
			caterepo.save(entity);
			System.out.println("them thanh cong");
			return "redirect:/admin/category/create";
		
	}
}
