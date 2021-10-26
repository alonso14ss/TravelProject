package com.travel.domain;
import lombok.Data;

@Data
public class Event {
	private int event_id;
	private float discount;
	private String starttimeOri;
	private String endtimeOri;
	private int start_time;
	private int end_time;
	private Product product;
}
