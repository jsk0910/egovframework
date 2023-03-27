package egovframework.example.dca.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import egovframework.example.dca.service.MemberService;
import egovframework.example.dca.vo.MemberVO;
import egovframework.example.dca.service.*;

@Service
public class MemberServiceImpl implements MemberService {

	@Autowired
	private MemberMapper memberMapper;
	
	@Override
	public int selectIdCheck(String userid) throws Exception {
		return memberMapper.selectIdCheck(userid);
	}

	@Override
	public void insertNewMember(MemberVO member) throws Exception {
		// TODO Auto-generated method stub
		memberMapper.insertNewMember(member);
	}
}
