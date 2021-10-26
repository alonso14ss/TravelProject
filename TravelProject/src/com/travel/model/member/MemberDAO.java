package com.travel.model.member;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.travel.domain.Member;
import com.travel.exception.DMLException;
import com.travel.exception.DataNotFoundException;

@Repository
public class MemberDAO {
	@Autowired
	private SqlSessionTemplate sessionTemplate;

	public void insert(Member member) throws DMLException {
		int result = sessionTemplate.insert("Member.insert", member);
		if (result == 0) {
			throw new DMLException("회원가입에 실패하였습니다\n관리자에 문의하여 주세요");
		}
	}

	public Member loginCheck(Member member) {
		Member obj = null;
		obj = sessionTemplate.selectOne("Member.loginCheck", member);
		return obj;
	}

	public String idCheck(Member member) {
		Member obj = sessionTemplate.selectOne("Member.idCheck", member);
		System.out.println(obj);
		if (obj == null) {// 회원이 없을 경우, 비즈니스적 에러상황으로 보자!!
			return "0";
		}
		return "1";
	}

	public List selectAll() {
		return sessionTemplate.selectList("Member.selectAll");
	}

	public Member select(int member_id) {
		return sessionTemplate.selectOne("Member.select", member_id);
	}


	public void update(Member member) throws DMLException {
		int result = sessionTemplate.update("Member.update", member);
		if (result == 0) {
			throw new DMLException("수정에 실패하였습니다.");
		}
	}

	public void delete(int member_id) throws DMLException {
		sessionTemplate.delete("Member.delete", member_id);
	}
}
