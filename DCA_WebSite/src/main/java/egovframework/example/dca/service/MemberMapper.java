package egovframework.example.dca.service;

import egovframework.example.dca.vo.MemberVO;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("MemberMapper")
public interface MemberMapper {
	int selectIdCheck(String userid) throws Exception;
	
	void insertNewMember(MemberVO member) throws Exception;
}
