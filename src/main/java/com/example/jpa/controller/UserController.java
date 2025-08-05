package com.example.jpa.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.jpa.dao.UserDao;
import com.example.jpa.entity.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class UserController {
	@Autowired
	UserDao ud;
	
	@PostMapping("/regproc")
	public String addUser(
			@RequestParam("name") String name,
			@RequestParam("email") String email,
			@RequestParam("phone") String phno,
			@RequestParam("password") String pass,
			ModelMap model) {
		User user = new User();
		user.setName(name);
		user.setEmail(email);
		user.setPhno(phno);
		user.setPassword(pass);
		user.setRole("customer");
		ud.save(user);
		model.put("msg", "Registered Succesfully!");
		return "signup";
	}
	
	@PostMapping("/logproc")
	public String loginprocess(
			@RequestParam("email") String email,
			@RequestParam("password") String pass,
			ModelMap model,
			HttpSession session) {
		User user = null;
		user = ud.findByEmailAndPassword(email, pass);
		if(user != null)
		{
			String role = user.getRole();
			if(role.equals("customer"))
			{
				session.setAttribute("udata", email);
				session.setAttribute("name", user.getName());

				return "index";
			}
			else
			{
				return "redirect:/viewitem";
			}
		}
		else
		{
			model.put("msg", "Wrong Credential!");
			return "login";
		}
	}
	
	@RequestMapping("/logout")
	public String destroy(HttpServletRequest request) {
		request.getSession().invalidate();
		return "index";
	}
	
	@RequestMapping("/viewuser")
	public String getAllUser(Model model) {
		List<User> user = ud.findAll();
		model.addAttribute("udata", user);
		return "allUser";
	}
}
