package egovframework.example.board.vo;

import org.springframework.web.multipart.MultipartFile;

public class contentVO {
	private int ID;
	private String Title;
	private String Content;
	private String Name;
	private String Date;
	private String fileName;
	private MultipartFile uploadFile;
	
	public contentVO() {
		
	}
	
	public contentVO(int id, String title, String content, String name, String date, String fileName) {
		super();
		this.ID = id;
		this.Title = title;
		this.Content = content;
		this.Name = name;
		this.Date = date;
		this.fileName = fileName;
	}
	
	//getter & setter
	public int getID() {
		return ID;
	}
	
	public void setID(int id) {
		this.ID = id;
	}
	
	public String getTitle() {
		return Title;
	}
	
	public void setTitle(String title) {
		this.Title = title;
	}
	
	public String getContent() {
		return Content;
	}
	
	public void setContent(String content) {
		this.Content = content;
	}
	
	public String getName() {
		return Name;
	}
	
	public void setName(String name) {
		this.Name = name;
	}
	
	public String getDate() {
		return Date;
	}
	
	public void setDate(String date) {
		this.Date = date;
	}
	
	public String getFileName() {
		return fileName;
	}
	
	public void setFileName(String fileName) {
		this.fileName = fileName;
	}

	public MultipartFile getUploadFile() {
		// TODO Auto-generated method stub
		return uploadFile;
	}
	
	public void setUploadFile(MultipartFile _uploadFile) {
		this.uploadFile = _uploadFile;
	}
}
