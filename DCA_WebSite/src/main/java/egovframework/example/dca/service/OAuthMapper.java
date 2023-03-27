package egovframework.example.dca.service;

import egovframework.rte.psl.dataaccess.mapper.Mapper;

import java.util.HashMap;

import egovframework.example.dca.vo.*;

@Mapper("OAuthMapper")
public interface OAuthMapper {
	
	String getKakaoAccessToken(String code) throws Exception;
	
	MemberVO findInKakao(HashMap<String, Object> userInfo) throws Exception;
}
