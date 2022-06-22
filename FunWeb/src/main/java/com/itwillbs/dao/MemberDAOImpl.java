package com.itwillbs.dao;

import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

import com.itwillbs.domain.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO{
	//객체생성
	@Inject
	private SqlSession sqlSession;
	
	private static final String namespace="com.itwillbs.member.MemberMapper";

	@Override
	public void insertMember(MemberDTO memberDTO) {
		// 메서드호출
		sqlSession.insert(namespace+".insertMember", memberDTO);
		
	}

}
