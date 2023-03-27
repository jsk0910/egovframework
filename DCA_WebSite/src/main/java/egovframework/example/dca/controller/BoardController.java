package egovframework.example.dca.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class BoardController {
	
	@RequestMapping(value="/board")
	public String boardPage() {
		return "/board/main.jsp";
	}
}
