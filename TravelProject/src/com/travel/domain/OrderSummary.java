package com.travel.domain;
import lombok.Data;

@Data
public class OrderSummary {
	private int order_summary_id;
	private Member member;
	private int total_pay;
	private String order_date;
	private String pay_method;
	
}
