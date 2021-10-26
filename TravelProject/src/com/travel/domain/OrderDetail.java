package com.travel.domain;
import lombok.Data;

@Data
public class OrderDetail {
	private int order_detail_id;
	private OrderSummary orderSummary;//has a 
	private Product product;//has a 
	private int ea;

	
}
