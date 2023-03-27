package egovframework.example.board.controller;

import java.io.File;
import java.io.FileInputStream;
import java.io.OutputStream;
import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
public class FileDownloadController {
	@RequestMapping(value="fileDownload.do")
	public void fileDownload(HttpServletRequest request, HttpServletResponse response) {
		String fileName = request.getParameter("fileName");
		String realFileName = "";
		
		try {
			String browser = request.getHeader("User-Agent");
			
			if(browser.contains("MSIE") || browser.contains("Trident") || browser.contains("Chrome")) {
				fileName = URLEncoder.encode(fileName, "UTF-8").replaceAll("\\+", "%20");
			} else {
				fileName = new String(fileName.getBytes("UTF-8"), "ISO-8859-1");
			}
		} catch(UnsupportedEncodingException e) {
			System.out.println("Unsupported Encoding Exception");
		}
		
		realFileName = "C:\\upload\\" + fileName;
		File file1 = new File(realFileName);
		
		if(!file1.exists()) {
			return ;
		}
		
		response.setContentType("application/octer-stream");
		response.setHeader("Content-Transfer-Encoding", "binary;");
		response.setHeader("Content-Disposition", "attachment; filename=\"" + fileName + "\"");
		
		try {
			OutputStream os = response.getOutputStream();
			FileInputStream fis = new FileInputStream(realFileName);
			
			int ncount = 0;
			byte[] bytes = new byte[512];
			
			while((ncount = fis.read(bytes)) != -1) {
				os.write(bytes, 0, ncount);
			}
			
			fis.close();
			os.close();
		} catch(Exception e) {
			System.out.println("FileNotFound");
		}
	}
}
