package com.travel.model.event;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.travel.domain.Event;
import com.travel.exception.DMLException;

@Repository
public class EventDAO {
	@Autowired 
	private SqlSessionTemplate sessionTemplate;
	
	//이벤트상품 등록
	public void insert(Event event) throws DMLException {
		int result = sessionTemplate.insert("Event.insert", event);
		if(result==0) {
			throw new DMLException("이벤트 등록에 실패하였습니다");
		}
	}
	
	//이벤트상품 목록 가져오기
	public List selectAll() {
		List list=sessionTemplate.selectList("Event.selectAll");
		return list;
	}
	
	
	public boolean eventProductSelect(int product_id){
		Event obj = sessionTemplate.selectOne("Event.eventProductSelect",product_id);
		System.out.println(obj);
		if(obj == null) {
			return false;
		}
		return true;
	}
	
	public Event select(int event_id) {
		return sessionTemplate.selectOne("Event.select",event_id);
	}
	
	public void update(Event event) throws DMLException{
		System.out.println("테스트"+event.getProduct().getProduct_name());
		int result = sessionTemplate.update("Event.update",event);
		if(result==0) {
			throw new DMLException("이벤트 등록에 실패하였습니다");
		}
	}
	
	public void delete(int event_id) throws DMLException{
		int result = sessionTemplate.delete("Event.delete",event_id);
		if(result==0) {
			throw new DMLException("이벤트 삭제에 실패하였습니다");
		}
	}
	
}












