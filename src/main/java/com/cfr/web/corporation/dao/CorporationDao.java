package com.cfr.web.corporation.dao;

import java.util.List;
import java.util.Map;

public interface CorporationDao {
	
	public List select(Map map);
	public List selectD(Map map);
	public List selectF(Map map);
}
