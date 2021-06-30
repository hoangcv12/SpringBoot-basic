package com.it15031.controller;

import java.io.File;
import java.util.List;
import java.util.Optional;

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
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.it15031.dto.Userdto;
import com.it15031.entity.User;
import com.it15031.mapper.Usermapper;
import com.it15031.repository.UserRepository;
import com.it15031.utils.HashUtils;
import com.it15031.utils.UploadFileUtils;



@Controller
@RequestMapping("admin/users")
public class UserController {
	@Autowired
	private Usermapper mapper;
	
	@Autowired
	UserRepository userRepo;
	
	@Autowired
	private UploadFileUtils uploadUtil;
	
	@Autowired
	private HttpServletRequest request;
	
	@GetMapping("views")
	public String views(Model model) {
		String sortBy = request.getParameter("sort_by");
		String sortDirection = request.getParameter("sort_direction");
		String pageParam = request.getParameter("page");
		String limitParam = request.getParameter("limit");

		String sortField = sortBy == null ? "id" : sortBy;
		Sort sort = ( sortDirection == null || sortDirection.equals("asc") ) ?
			Sort.by(Direction.ASC, sortField):
			Sort.by(Direction.DESC, sortField);

		int page = pageParam == null ? 0 : Integer.parseInt(pageParam);
		int limit = limitParam == null ? 10 : Integer.parseInt(limitParam);
		Pageable pageable = PageRequest.of(page, limit, sort);
		
		Page pageData = this.userRepo.findAll(pageable);

		model.addAttribute("pageData", pageData);
		model.addAttribute("view","admin/user/views.jsp");
		return "layout";
	}
	
	@GetMapping("create")
	public String create(Model model) {
		model.addAttribute("view","admin/user/create.jsp");
		return "layout" ; 
	}
	
	@PostMapping("save")
	public String save(Model model,@Valid Userdto user,
			BindingResult result,@RequestParam("imageFile") MultipartFile uploadedFile) {
		if (result.hasErrors()) {
			System.out.println("co loi");
			System.out.println(result.getAllErrors());
			return "redirect:/admin/users/create";
		}else {
			
			User entity = mapper.convertToEntity(user);
			String hashpassword=HashUtils.hash(entity.getPassword());
			entity.setPassword(hashpassword);
			File fileimg=uploadUtil.handleUploadFile(uploadedFile);
			entity.setPhoto(fileimg.getName());
			userRepo.save(entity);
			return "redirect:/admin/users/create";
		}
	}
	
	@GetMapping("/delete/{id}")
	public String delete(@PathVariable("id") Integer id) {
		userRepo.deleteById(id);
		return "redirect:/admin/users/views";
	}
	
	@GetMapping("edit/{id}")
	public String edit(@PathVariable("id") Integer id,Model model) {
		Optional< User> user=userRepo.findById(id);
		if(user.isPresent()) {
			Userdto userdao = mapper.convertToDTO(user.get());
			model.addAttribute("user", userdao);
			model.addAttribute("view","admin/user/edit.jsp");
			return "layout" ; 
			
		}else {
			return "redirect:/admin/users/views";
		}
	}
	@PostMapping("update/{id}")
	public String update(Model model,@Valid Userdto user,
			BindingResult result) {
		System.out.println(user);
		if (result.hasErrors()) {
			System.out.println("co loi");
			System.out.println(result.getAllErrors().get(0));
			model.addAttribute("errors",result.getAllErrors());
			model.addAttribute("user", user);
			model.addAttribute("view", "admin/user/edit.jsp");
			return "layout";
		}else {
			User entity = mapper.convertToEntity(user);
			userRepo.save(entity);
			System.out.println("them thanh cong");
			return "redirect:/admin/users/views";
		}
	}
	
}
