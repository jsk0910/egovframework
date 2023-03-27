package egovframework.example.dca.service;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Service;

@Service
public interface SessionManagerService {
	public void createSession(Object value, HttpServletResponse response);
	
	public Object getSession(HttpServletRequest request);
	
	public void expire(HttpServletRequest request);
	
	public Cookie findCookie(HttpServletRequest request, String cookieName);
}
