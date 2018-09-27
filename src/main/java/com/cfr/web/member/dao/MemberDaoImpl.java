package com.cfr.web.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import com.cfr.web.member.sql.MemberMapper;

@Component
public class MemberDaoImpl implements MemberDao {
	@Autowired
	private SqlSession sqlSession;
	@Override
	public int regist(Map map) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		System.out.println("디아이오시작전");
		System.out.println(map.get("id"));
		System.out.println("디아이오시작후");
		return mapper.regist(map);
	}
	@Override
	public Map select(Map map) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.select(map);
	}
	@Override
	public int update(Map map) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.update(map);
	}
	@Override
	public int delete(Map map) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.delete(map);
	}
	@Override
	public Map findcf(Map map) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.findcf(map);
	}
	@Override
	public Map findpw(Map map) {
		MemberMapper mapper = sqlSession.getMapper(MemberMapper.class);
		return mapper.findpw(map);
	}
}
