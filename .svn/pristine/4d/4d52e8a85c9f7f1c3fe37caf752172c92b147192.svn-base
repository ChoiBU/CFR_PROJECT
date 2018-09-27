package com.cfr.web.corporation.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cfr.web.corporation.dao.CorporationDao;

@Service
public class CorporationServiceImpl implements CorporationService {
@Autowired CorporationDao corporationDao;
	
	@Override
	public List select(Map map) {
		return corporationDao.select(map);
	}
	@Override
	public List selectD(Map map) {
		return corporationDao.selectD(map);
	}
	@Override
	public List selectF(Map map) {
		return corporationDao.selectF(map);
	}
}
