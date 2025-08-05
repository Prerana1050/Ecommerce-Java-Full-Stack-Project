package com.example.jpa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import org.springframework.web.bind.annotation.RequestParam;

import com.example.jpa.dao.ProductDao;
import com.example.jpa.dao.UserDao;
import com.example.jpa.entity.Product;
import com.example.jpa.entity.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;


@Controller
public class PaymentController {
@Autowired
UserDao ud;
@Autowired
ProductDao pd;
@GetMapping("/pdetails")
public String setPaymentDetails(@RequestParam("price")String price,@RequestParam("email")String email,
		@RequestParam("prodid")String pid,Model model,Model model1,HttpServletRequest request,HttpSession session)
{
	User user=ud.findByEmail(email);
	Product prod=pd.findById(pid).get();
	model.addAttribute("user",user);
	model1.addAttribute("product",prod);
	request.setAttribute("price", price);
	
	session.setAttribute("email", email);
	session.setAttribute("pid", pid);
	return "paymentPage";
	
}
}