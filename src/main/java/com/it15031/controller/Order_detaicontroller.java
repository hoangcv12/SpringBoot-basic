package com.it15031.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.it15031.dto.Order_detaildto;
import com.it15031.dto.Orderdto;
import com.it15031.entity.Order;
import com.it15031.entity.Order_detail;
import com.it15031.entity.Product;
import com.it15031.entity.User;
import com.it15031.mapper.Usermapper;
import com.it15031.repository.OrderRepository;
import com.it15031.repository.OrderdetailRepository;
import com.it15031.repository.ProductRepository;

@Controller
@RequestMapping("user/category_detail")
public class Order_detaicontroller {
	@Autowired
	ProductRepository productrepo;
	@Autowired
	OrderdetailRepository ordetailrepo;
	@Autowired
	OrderRepository orrepo;
	@Autowired
	HttpServletRequest request;
	@Autowired
	private Usermapper mapper;

	@GetMapping("views")
	public String viewCart(Model model) {
	
		List<Order_detail> order = ordetailrepo.findAll();
		int tong = order.stream().mapToInt(or -> or.getQuantity() * or.getPrice()).sum();
		model.addAttribute("PRO_ITEMS", order);
		model.addAttribute("TONG", tong);
		model.addAttribute("view", "admin/orderdetail/views.jsp");
		return "layout";
	}

	@GetMapping("add/{id}")
	public String add(@PathVariable("id") Integer id, @Valid Order_detail orderdetail) {
		HttpSession session = request.getSession();
		Product entity = productrepo.getById(id);
		if (entity != null) {
			Order_detail entityid = ordetailrepo.findByProduct(entity);
			if (entityid != null) {
				entityid.setQuantity(entityid.getQuantity() + 1);
				ordetailrepo.save(entityid);
			} else {
				orderdetail.setPrice(entity.getPrice());
				orderdetail.setQuantity(1);
				session.getAttribute("user");
				User user = (User) session.getAttribute("user");
				Order or = orrepo.findByUser(user);
				orderdetail.setOrder(or);
				orderdetail.setProduct(entity);
				ordetailrepo.save(orderdetail);

			}
		}
		return "redirect:/user/category_detail/views";
	}

	@PostMapping("update/{id}")
	public String update(@PathVariable("id") Integer id,@RequestParam("qty") Integer qty
			) {
		Optional<Order_detail> detai =ordetailrepo.findById(id);
		if(detai.isPresent()) {
			detai.get().setQuantity(qty);
			ordetailrepo.save(detai.get());
		}
		
		
		return "redirect:/user/category_detail/views";
	}

	@GetMapping("/delete/{id}")
	public String delete(@PathVariable("id") Integer id) {
		ordetailrepo.deleteById(id);
		return "redirect:/user/category_detail/views";
	}

	@GetMapping("clear")
	public String clear() {
		ordetailrepo.deleteAll();
		return "redirect:/user/category_detail/views";
	}
}
