package com.cfr.web.question.dao;

import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.cfr.web.favorite.sql.FavoriteMapper;
import com.cfr.web.question.sql.QuestionMapper;

@Repository
public class QuestionDaoImpl implements QuestionDao {
	
	@Autowired
	private SqlSession sqlSession;
	
	@Override
	public int regist(Map map) {
		QuestionMapper mapper = sqlSession.getMapper(QuestionMapper.class);
		return mapper.regist(map);
	}


	
}
