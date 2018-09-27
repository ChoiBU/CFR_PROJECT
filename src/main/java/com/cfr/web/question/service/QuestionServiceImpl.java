package com.cfr.web.question.service;

import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cfr.web.question.dao.QuestionDao;

@Service
public class QuestionServiceImpl implements QuestionService {

	@Autowired QuestionDao questionDao;
		
	@Override
	public int regist(Map map) {
		return questionDao.regist(map);
	}

}
