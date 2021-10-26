package com.travel.domain;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class Product {
	private int product_id;
	private String product_name;
	private int departuredate;
	private int arrivaldate;
	private String departuredateOri;
	private String arrivaldateOri;
	private String departureplace;
	private String arrivalplace;
	private String filename;
	private int personal;
	private int price;
	private int price_ori;
	private int minPrice;
	private int maxPrice;
	private String searchPrice;
	private MultipartFile myFile;
		
}
