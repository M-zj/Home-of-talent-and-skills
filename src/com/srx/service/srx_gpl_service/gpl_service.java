package com.srx.service.srx_gpl_service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.srx.dao.srx_gpl_dao.PoliciesandregulationsMapper;
import com.srx.model.srx_gpl_model.Policiesandregulations;
@Service("gpl_service")
public class gpl_service {
	@Resource
	private PoliciesandregulationsMapper pm;
	
	public List select(){
		
		List<Policiesandregulations> list=pm.lt();
		return list;
	}
	
	public List select_content(Policiesandregulations p){
		/* System.out.println(p.getId()); */
		List<Policiesandregulations> list=pm.lt_content(p.getId());
		return list;
		
	}
}