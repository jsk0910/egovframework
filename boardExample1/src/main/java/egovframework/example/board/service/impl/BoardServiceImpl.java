package egovframework.example.board.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;

import egovframework.example.board.service.BoardMapper;
import egovframework.example.board.service.BoardService;
import egovframework.example.board.vo.*;

@Service
public class BoardServiceImpl implements BoardService {
	@Autowired
	private BoardMapper boardMapper;

	@Override
	public List<contentVO> selectList(Search search) throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.selectList(search);
	}

	@Override
	public contentVO selectDetail(contentVO content) throws Exception {
		
		return boardMapper.selectDetail(content);
	}

	@Override
	public void insertNew(contentVO content) throws Exception {
		// TODO Auto-generated method stub
		
		boardMapper.insertNew(content);
	}

	@Override
	public void updateContent(contentVO content) throws Exception {
		// TODO Auto-generated method stub
		boardMapper.updateContent(content);
	}

	@Override
	public void delete(contentVO content) throws Exception {
		// TODO Auto-generated method stub
		boardMapper.deleteContent(content);
	}

	@Override
	public int getBoardListCount(Search search) throws Exception {
		// TODO Auto-generated method stub
		return boardMapper.getBoardListCount(search);
	}
	
	
}
