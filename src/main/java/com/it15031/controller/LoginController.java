package com.it15031.controller;

import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it15031.entity.Product;
import com.it15031.entity.User;
import com.it15031.repository.ProductRepository;
import com.it15031.repository.UserRepository;
import com.it15031.utils.HashUtils;

@Controller
public class LoginController {
	@Autowired
	HttpServletRequest request;
	@Autowired
	private UserRepository userRepo;
	@Autowired
	ProductRepository productrepo;	
	@GetMapping("login")
	public String getlogin() {
		return "auth/login";
	}
	
	@PostMapping("login")
	public String login(
			Model model,
			@RequestParam ("email") String email,
			@RequestParam ("password") String password
			) {
		HttpSession session=request.getSession();
		User entity =userRepo.findByEmail(email);
		if(entity == null) {
			session.setAttribute("error", "Sai email hoặc mật khẩu");
			return "redirect:/login";
		}
		boolean checkpass=HashUtils.verify(password, entity.getPassword());
		
		if(!checkpass) {
			session.setAttribute("error", "Sai email hoặc mật khẩu");
			return "redirect:/login";
		}
		
	session.setAttribute("user", entity);
	
	model.addAttribute("view","home.jsp");
		return "redirect:/home";
	}
	
	@GetMapping("home")
	public String home(Model model) {
		model.addAttribute("view","home.jsp");
		return "layout";
	}
	@GetMapping("products")
	public String sanpham(Model model,@RequestParam("p") Optional<Integer> p) {
		Pageable pageable=PageRequest.of(p.orElse(0),10 );
		Page<Product> pro= productrepo.findAll(pageable );
		model.addAttribute("listProduct",pro);
		model.addAttribute("view","sanpham.jsp");
		return "layout";
	}
}
