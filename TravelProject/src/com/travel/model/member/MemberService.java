package com.travel.model.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.travel.domain.Member;
import com.travel.exception.DMLException;
import com.travel.exception.DataNotFoundException;

@Service
public class MemberService {
	@Autowired
	private MemberDAO memberDAO;

	public void insert(Member member) throws DMLException {
		memberDAO.insert(member);
	}

	public Member loginCheck(Member member){
		return memberDAO.loginCheck(member);
	}

	public String idCheck(Member member) throws DataNotFoundException {
		String result = memberDAO.idCheck(member);
		return result;
	}

	public List selectAll() {
		return memberDAO.selectAll();
	}

	public Member select(int member_id) {
		return memberDAO.select(member_id);
	}

	public void update(Member member) throws DMLException {
		memberDAO.update(member);
	}

	public void delete(int member_id) throws DMLException {
		memberDAO.delete(member_id);
	}
}
