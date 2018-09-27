package com.cfr.web.corporation.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cfr.web.corporation.sql.CorporationMapper;
import com.cfr.web.member.sql.MemberMapper;

@Repository
public class CorporationDaoImpl implements CorporationDao {
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public List select(Map map) {
		CorporationMapper mapper = sqlSession.getMapper(CorporationMapper.class);
		return mapper.select(map);
	}
	@Override
	public List selectD(Map map) {
		CorporationMapper mapper = sqlSession.getMapper(CorporationMapper.class);
		return mapper.selectD(map);
	}
	@Override
	public List selectF(Map map) {
		CorporationMapper mapper = sqlSession.getMapper(CorporationMapper.class);
		return mapper.selectF(map);
	}
}

