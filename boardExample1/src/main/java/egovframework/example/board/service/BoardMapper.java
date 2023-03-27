package egovframework.example.board.service;

import java.util.List;

import egovframework.example.board.vo.*;
import egovframework.rte.psl.dataaccess.mapper.Mapper;

@Mapper("BoardMapper")
public interface BoardMapper {

	List<contentVO> selectList(Search search) throws Exception;

	contentVO selectDetail(contentVO content) throws Exception;

	void insertNew(contentVO content) throws Exception;

	void updateContent(contentVO content) throws Exception;

	void deleteContent(contentVO content) throws Exception;

	int getBoardListCount(Search search) throws Exception;
	
}
