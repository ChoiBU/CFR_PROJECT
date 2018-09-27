package com.cfr.web.member.dao;

import java.util.List;
import java.util.Map;

public interface MemberDao {
	
	public int regist(Map map);
	public Map select(Map map);
	public int update(Map map);
	public int delete(Map map);
	public Map findcf(Map map);
	public Map findpw(Map map);
}
