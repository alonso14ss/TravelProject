package com.travel.model.admin;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.travel.domain.Admin;

@Repository
public class AdminDAO {
	@Autowired
	private SqlSessionTemplate sessionTemplate;
	
	public Admin loginCheck(Admin admin) {
		Admin obj=null;
		obj=sessionTemplate.selectOne("Admin.loginCheck", admin);
		return obj;
	}
	
}






