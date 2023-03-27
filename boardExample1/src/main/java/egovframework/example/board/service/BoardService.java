package egovframework.example.board.service;

import java.util.List;

import org.springframework.stereotype.Service;

import egovframework.example.board.vo.*;

@Service
public interface BoardService {

	List<contentVO> selectList(Search search) throws Exception;

	contentVO selectDetail(contentVO content) throws Exception;

	void insertNew(contentVO content) throws Exception;

	void updateContent(contentVO content) throws Exception;

	void delete(contentVO content) throws Exception;

	int getBoardListCount(Search search) throws Exception;
	
}
