package com.example.jpa.entity;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;

@Entity
@Table(name="orders")
public class Order {
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
private int orderId;
private String custId;
private String name;
private String address;
private String phno;
private String prodId;
private String prodName;
private double price;
private String transDetails;

public int getOrderId() {
	return orderId;
}
public void setOrderId(int orderId) {
	this.orderId = orderId;
}
public String getCustId() {
	return custId;
}
public void setCustId(String custId) {
	this.custId = custId;
}
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getAddress() {
	return address;
}
public void setAddress(String address) {
	this.address = address;
}
public String getPhno() {
	return phno;
}
public void setPhno(String phno) {
	this.phno = phno;
}
public String getProdId() {
	return prodId;
}
public void setProdId(String prodId) {
	this.prodId = prodId;
}
public String getProdName() {
	return prodName;
}
public void setProdName(String prodName) {
	this.prodName = prodName;
}
public double getPrice() {
	return price;
}
public void setPrice(double price) {
	this.price = price;
}
public String getTransDetails() {
	return transDetails;
}
public void setTransDetails(String transDetails) {
	this.transDetails = transDetails;
}
}
