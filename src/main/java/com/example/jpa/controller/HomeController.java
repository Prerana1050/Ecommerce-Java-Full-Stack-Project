package com.example.jpa.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class HomeController {
	
	@RequestMapping("/")
	public String home() {
		return "index";
	}
	
	@RequestMapping("nav")
	public String navBar() {
		return "navbar";
	}
	
	@RequestMapping("reg")
	public String signUp() {
		return "signup";
	}
	
	@RequestMapping("log")
	public String login() {
		return "login";
	}
}
