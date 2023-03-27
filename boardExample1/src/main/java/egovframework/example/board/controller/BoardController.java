package egovframework.example.board.controller;

import java.util.List;
import java.util.Map;
import java.io.File;
import java.util.UUID;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.*;
import org.springframework.stereotype.*;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartHttpServletRequest;
import org.apache.commons.io.FilenameUtils;

import egovframework.example.board.service.*;
import egovframework.example.board.vo.*;

@Controller
public class BoardController {
	
	@Autowired
	private BoardService boardService;
	
	@RequestMapping(value="/main.do")
	public String mainPage() {
		return "main";
	}
	
	// 메인, 글 리스트
	@RequestMapping(value="/list.do")
	public ModelAndView boardList(Model model,
			@RequestParam(required = false, defaultValue="1") int page,
			@RequestParam(required = false, defaultValue="1") int range,
			@RequestParam(required = false, defaultValue="Title") String searchType,
			@RequestParam(required = false) String keyword,
			@ModelAttribute("search") Search search,
			//@ModelAttribute("contentVO") contentVO content,
			HttpServletRequest request,
			HttpServletResponse response
			) throws Exception {
		//search
		model.addAttribute("search", search);
		search.setSearchType(searchType);
		search.setKeyword(keyword);
		
		//Count
		int listCount = boardService.getBoardListCount(search);
		
		search.pageInfo(page, range, listCount);
		model.addAttribute("pagination", search);
		
		ModelAndView mav = null;
		mav = new ModelAndView("main");
		List<contentVO> list = boardService.selectList(search);
		
		//System.out.println(list.get(0).getTitle());
		//model.addAttribute("list", list);
		
		mav.addObject("list", list);
		
		return mav;
	}
	
	// 글 상세페이지
	@RequestMapping(value="/detail.do")
	public String viewForm(Model model, @ModelAttribute("contentVO") contentVO content, HttpServletRequest request, HttpServletResponse response) throws Exception {
		int id = Integer.parseInt(request.getParameter("ID"));
		content.setID(id);
		
		contentVO result = boardService.selectDetail(content);
		model.addAttribute("result", result);
		
		return "detail";
	}
	
	// 글쓰기 페이지
	@RequestMapping(value="/registerContext.do")
	public String registerContext() {
		return "registerContext";
	}
	
	// 글쓰기 등록
	@RequestMapping(value="/insertNew.do")
	public String insertNew(Model model, @ModelAttribute("contentVO") contentVO content, HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr) throws Exception {
		System.out.println(content.getTitle());
		
		boardService.insertNew(content);
		//System.out.println(content.toString());
		return "redirect:list.do";
	}
	
	// 글 수정
	@RequestMapping(value="/updatePage.do")
	public String updatePage(Model model, @ModelAttribute("contentVO") contentVO content, HttpServletRequest request, HttpServletResponse response) throws Exception {
		int id = Integer.parseInt(request.getParameter("ID"));
		content.setID(id);
		
		contentVO result = boardService.selectDetail(content);
		model.addAttribute("result", result);
		
		return "updatePage";
	}
	
	@RequestMapping(value="update.do")
	public String update(Model model, @ModelAttribute("contentVO") contentVO content, HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr) throws Exception {
		int id = Integer.parseInt(request.getParameter("ID"));
		content.setID(id);

		/*
		//file upload
		String fileName = null;
		MultipartFile uploadFile = content.getUploadFile();
		if(!uploadFile.isEmpty()) {
			String originalFileName = uploadFile.getOriginalFilename();
			String ext = FilenameUtils.getExtension(originalFileName);
			UUID uuid = UUID.randomUUID();
			fileName = uuid + "." + ext;
			uploadFile.transferTo(new File("C:\\upload\\" + fileName));
			content.setFileName(fileName);
		} else {
			boardService.updateContent(content);
			return "redirect:list.do";
		}
		*/
		
		boardService.updateContent(content);
		
		//System.out.println(content.getID());
		
		return "redirect:list.do";
	}
	
	// 글 삭제
	@RequestMapping(value="/delete.do")
	public String delete(Model model, @ModelAttribute("contentVO") contentVO content, HttpServletRequest request, HttpServletResponse response, RedirectAttributes rttr) throws Exception {
		int id = Integer.parseInt(request.getParameter("ID"));
		content.setID(id);
		
		boardService.delete(content);
		return "redirect:list.do";
	}
}
