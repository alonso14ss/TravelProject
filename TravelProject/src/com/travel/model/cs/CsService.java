package com.travel.model.cs;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.travel.domain.Cs;
import com.travel.exception.DMLException;

@Service
public class CsService {
	@Autowired
	private CsDAO csDAO;
	
	public List selectAll() {
		return csDAO.selectAll();
	}
	
	public Cs detail(int cs_id) {
		Cs cs = csDAO.detail(cs_id);
		return cs;
	}
	
	public void delete(int cs_id) throws DMLException {
		csDAO.delete(cs_id);
	}
	
	public void update(Cs cs) throws DMLException {
		csDAO.update(cs);
	}
	
	public void insert(Cs cs) throws DMLException {
		csDAO.insert(cs);
	}
	
	/*
	 * public void updateRank(Cs cs) throws DMLException { csDAO.update(cs); }
	 */
	
	public void reply(Cs cs) throws DMLException {
		csDAO.reply(cs);
	}

}
