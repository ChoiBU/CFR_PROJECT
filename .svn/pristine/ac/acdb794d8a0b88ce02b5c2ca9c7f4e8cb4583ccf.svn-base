package com.cfr.web.member.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.cfr.web.member.dao.MemberDao;

@Service
public class MemberServiceImpl implements MemberService {
@Autowired MemberDao memberDao;
	
	@Override
	public int regist(Map map) {
		return memberDao.regist(map);
	}
	@Override
	public Map select(Map map) {
		return memberDao.select(map);
	}
	@Override
	public int login(Map map) {
		if(memberDao.select(map) != null) {
			return 1;
		} else if(map.get("f_id") != null) {
			memberDao.regist(map);
			return 1;
		} else {
			return 0;
		}
	}
	@Override
	public int update(Map map) {
		if(map.get("m_pw").equals(map.get("pw_check"))) {
			return memberDao.update(map);
		}
		return 0;
	}
	@Override
	public int delete(Map map) {
		System.out.println("삭제할 아이디의 회원번호 : "+map.get("m_no"));
		return memberDao.delete(map);
	}
	@Override
	public Map findcf(Map map) {
		return memberDao.findcf(map);
	}
	@Override
	public Map findpw(Map map) {
		return memberDao.findpw(map);
	}
}
