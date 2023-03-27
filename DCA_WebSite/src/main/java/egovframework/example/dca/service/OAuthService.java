package egovframework.example.dca.service;

import java.util.HashMap;

import org.springframework.stereotype.*;

import egovframework.example.dca.vo.*;

@Service
public interface OAuthService {
	
	public String getKakaoAccessToken(String code) throws Exception;
	
	public HashMap<String, Object> getKakaoUserInfo(String code) throws Exception;
}
