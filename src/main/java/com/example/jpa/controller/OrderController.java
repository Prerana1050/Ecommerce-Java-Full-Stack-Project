package com.example.jpa.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.mail.SimpleMailMessage;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.example.jpa.dao.OrderDao;
import com.example.jpa.dao.ProductDao;
import com.example.jpa.dao.UserDao;
import com.example.jpa.entity.Order;
import com.example.jpa.entity.Product;
import com.example.jpa.entity.User;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class OrderController {
	
@Autowired
UserDao ud;
@Autowired
ProductDao pd;
@Autowired
OrderDao od;
@Value("${razorpay.key.id}")
private String razorpayKeyId;
@Autowired
private JavaMailSender mailSender;



@GetMapping("/paymentpage")
public String homePage() {
    return "paymentPage";
}

@PostMapping("/createOrder")
public String createOrder(
        @RequestParam String amount,
        @RequestParam String name,
        @RequestParam String email,
        @RequestParam String contact,
        Model model) {

    model.addAttribute("key", razorpayKeyId);
    model.addAttribute("amount", amount);
    model.addAttribute("custName", name);
    model.addAttribute("custEmail", email);
    model.addAttribute("custContact", contact);

    return "checkout";
}

@RequestMapping("/orderdetails")
public String orderDetails()
{
	return "orderDetails";
}

@RequestMapping("/orderdsuccess")
public String orderSuccess()
{
	return "orderSuccess";
}

@PostMapping("/order")
public String setOrderDetails(@RequestParam("address")String address,
		@RequestParam("tdetails")String transactionId,
		HttpServletRequest request,HttpSession session)
{
	
	String email=(String)session.getAttribute("email");
	String pid=(String)session.getAttribute("pid");
	User user=ud.findByEmail(email);
	Product prod=pd.findById(pid).get();
	Order order=new Order();
	order.setCustId(user.getEmail());
	order.setName(user.getName());
	order.setPhno(user.getPhno());
	order.setAddress(address);
	order.setProdId(prod.getId());
	order.setProdName(prod.getBrand());
	order.setPrice(prod.getPrice());
	order.setTransDetails(transactionId);
	od.save(order);
	sendOrderEmail(user.getEmail(), user.getName(), prod);
	return "orderSuccess";
}

private void sendOrderEmail(String toEmail, String custName, Product product) {
    SimpleMailMessage message = new SimpleMailMessage();
    message.setTo(toEmail);
    message.setSubject("Order Confirmation");
    message.setText("Dear " + custName + ",\n\nYour order for " +
            product.getBrand() + " has been placed successfully.\nPrice: " +
            product.getPrice() + "\n\nThank you for shopping with us!");
    mailSender.send(message);
}
}