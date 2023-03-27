package egovframework.example.dca.service;

import java.util.List;
import java.io.*;
import java.net.*;

import org.springframework.stereotype.*;

import egovframework.example.dca.vo.*;

@Service
public interface MemberService {
	
	int selectIdCheck(String userid) throws Exception;
	
	void insertNewMember(MemberVO member) throws Exception;
}
