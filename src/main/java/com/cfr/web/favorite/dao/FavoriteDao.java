package com.cfr.web.favorite.dao;

import java.util.List;
import java.util.Map;

public interface FavoriteDao {
	public void regist(Map map);
	public int select(Map map);
	public List favorite(Map map);
	public List recentReg(Map map);	
	public List rankReg(Map map);	
	public int delete(Map map);
	public int deleteAll(Map map);
}
