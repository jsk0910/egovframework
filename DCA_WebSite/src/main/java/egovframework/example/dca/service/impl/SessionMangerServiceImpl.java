package egovframework.example.dca.service.impl;

import java.util.Arrays;
import java.util.Map;
import java.util.UUID;
import java.util.concurrent.ConcurrentHashMap;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

import egovframework.example.dca.service.SessionManagerService;

@Service
public class SessionMangerServiceImpl implements SessionManagerService {
	public static final String SESSION_COOKKIE_NAME = "sessionId";
	private Map<String, Object> sessionStore = new ConcurrentHashMap<>();
	
	public void createSession(Object value, HttpServletResponse response) {
		String sessionId = UUID.randomUUID().toString();
		sessionStore.put(sessionId, value);
		
		Cookie cookie = new Cookie(SESSION_COOKKIE_NAME, sessionId);
		response.addCookie(cookie);
	}
	
	public Object getSession(HttpServletRequest request) {
		Cookie cookie = findCookie(request, SESSION_COOKKIE_NAME);
		
		if(cookie == null) {
			return null;
		}
		
		return sessionStore.get(cookie.getValue());
	}
	
	public void expire(HttpServletRequest request) {
		Cookie cookie = findCookie(request, SESSION_COOKKIE_NAME);
		if(cookie != null) {
			sessionStore.remove(cookie.getValue());
		}
	}
	
	public Cookie findCookie(HttpServletRequest request, String cookieName) {
		if(request.getCookies() == null) {
			return null;
		}
		
		return Arrays.stream(request.getCookies()).filter(c-> c.getName().equals(cookieName)).findAny().orElse(null);
	}
}
