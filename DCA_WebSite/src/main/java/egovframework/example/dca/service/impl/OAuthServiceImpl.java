package egovframework.example.dca.service.impl;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.Repository;
import org.springframework.stereotype.Service;

import com.google.gson.JsonElement;
import com.google.gson.JsonObject;
import com.google.gson.JsonParser;

import egovframework.example.dca.service.OAuthService;
import egovframework.example.dca.service.OAuthMapper;
import egovframework.example.dca.vo.MemberVO;

@Repository
@Service
public class OAuthServiceImpl implements OAuthService {
	
	@Autowired//(required=false)
	private OAuthMapper kakaoOauthMapper;
	
	@Override
	public String getKakaoAccessToken(String code) throws Exception {
		String access_Token = "";
		String refresh_Token = "";
		String reqURL = "https://kauth.kakao.com/oauth/token";
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
			conn.setRequestMethod("POST");
			conn.setDoOutput(true);
			
			BufferedWriter bw = new BufferedWriter(new OutputStreamWriter(conn.getOutputStream()));
			StringBuilder sb = new StringBuilder();
			sb.append("grant_type=authorization_code");
			sb.append("&client_id=6353802339beb4e42b4ad87318fad4dc");
			sb.append("&redirect_uri=http://localhost:8080/oauth/kakaoRe.do");
			sb.append("&code=" + code);
			bw.write(sb.toString());
			bw.flush();
			
			int responseCode = conn.getResponseCode();
			//System.out.println(responseCode);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			
			while((line = br.readLine()) != null) {
				result += line;
			}
			//System.out.println(result);
			
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			
			access_Token = element.getAsJsonObject().get("access_token").getAsString();
			refresh_Token = element.getAsJsonObject().get("refresh_token").getAsString();
			
			//System.out.println(access_Token);
			//System.out.println(refresh_Token);
			
			br.close();
			bw.close();
		} catch(IOException e) {
			e.printStackTrace();
		}
		
		return access_Token;
	}

	@Override
	public HashMap<String, Object> getKakaoUserInfo(String code) throws Exception {
		HashMap<String, Object> userInfo = new HashMap<String, Object>();
		
		String reqURL = "https://kapi.kakao.com/v2/user/me";
		
		try {
			URL url = new URL(reqURL);
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			
			conn.setRequestMethod("POST");
			conn.setRequestProperty("Authorization", "Bearer " + code);
			
			int responseCode = conn.getResponseCode();
			System.out.println(responseCode);
			
			BufferedReader br = new BufferedReader(new InputStreamReader(conn.getInputStream()));
			String line = "";
			String result = "";
			
			while((line = br.readLine()) != null) {
				result += line;
			}
			
			JsonParser parser = new JsonParser();
			JsonElement element = parser.parse(result);
			JsonObject properties = element.getAsJsonObject().get("properties").getAsJsonObject();
			JsonObject kakao_account = element.getAsJsonObject().get("kakao_account").getAsJsonObject();
			
			String nickname = properties.getAsJsonObject().get("nickname").getAsString();
			String email = kakao_account.getAsJsonObject().get("email").getAsString();
			
			userInfo.put("nickname", nickname);
			userInfo.put("email", email);
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		MemberVO result = kakaoOauthMapper.findInKakao(userInfo);
		//System.out.println(result.toString());
		
		HashMap<String, Object> res = new HashMap<String, Object>();
		if(result == null) {
			//System.out.println(result);
			res.put("isExist", false);
			res.put("MemberObject", userInfo);
		} else {
			res.put("isExist", true);
			res.put("MemberObject", result);
		}
		return res;
	}
}
