package com.travel.model.cs;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.travel.domain.Cs;
import com.travel.domain.Product;
import com.travel.exception.DMLException;

@Repository
public class CsDAO {
	
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	
	public List selectAll() {
		return sessionTemplate.selectList("Cs.selectAll");
	}
	
	public Cs detail(int cs_id) {
		return sessionTemplate.selectOne("Cs.select", cs_id);
	}
	
	public void insert(Cs cs) throws DMLException{
		int result=sessionTemplate.insert("Cs.insert", cs);
		sessionTemplate.update("Cs.update_team",sessionTemplate.selectOne("Cs.select_id",cs));
		if(result==0) {
			throw new DMLException("게시글이 등록되지 않았습니다");
		}
	}
	
	public void delete(int cs_id) throws DMLException{
		int result=sessionTemplate.delete("Cs.delete",cs_id);
		if(result==0) {
			throw new DMLException("게시글이 삭제처리 되지 않았습니다");
		}
	}
	public void update(Cs cs) throws DMLException{
		int result=sessionTemplate.update("Cs.update", cs);
		if(result==0) {
			throw new DMLException("수정에 실패하였습니다.");
		}
	}
	
	/*
	 * public void updateRank(Cs cs) throws DMLException{ int
	 * result=sessionTemplate.update("Cs.updateRank", cs); if(result==0) { throw new
	 * DMLException("랭크 수정에 실패하였습니다."); } }
	 */
	
	public void reply(Cs cs) throws DMLException{
		int result=sessionTemplate.insert("Cs.reply", cs);
		if(result==0) {
			throw new DMLException("게시글이 등록되지 않았습니다");
		}
	}
	
}
