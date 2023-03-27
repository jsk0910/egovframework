package egovframework.example.dca.vo;

public class FreeBoardVO {
	private int seq;
	private String id;
	private String title;
	private String content;
	private String name;
	private String reg_date;
	private String update_date;
	private String fileName;
	private int viewcount;
	
	// initialize
	public FreeBoardVO() {
		
	}
	
	public FreeBoardVO(int seq, String id, String title, String content, String name, String reg_date, String update_date, String fileName, int viewcount) {
		super();
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.content = content;
		this.name = name;
		this.reg_date = reg_date;
		this.update_date = update_date;
		this.fileName = fileName;
		this.viewcount = viewcount;
	}
	
	// getter and setter
	public int getSEQ() {
		return seq;
	}
	
	public void setSEQ(int _seq) {
		this.seq = _seq;
	}
	
	public String getId() {
		return id;
	}
	
	public void setId(String _id) {
		this.id = _id;
	}
	
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String _title) {
		this.title = _title;
	}
	
	public String getContent() {
		return content;
	}
	
	public void setContent(String _content) {
		this.content = _content;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String _name) {
		this.name = _name;
	}
	
	public String getRegDate() {
		return reg_date;
	}
	
	public void setRegDate(String _reg_date) {
		this.reg_date = _reg_date;
	}
	
	public String getUpdateDate() {
		return update_date;
	}
	
	public void setUpdateDate(String _update_date) {
		this.update_date = _update_date;
	}
	
	public String getFileName() {
		return fileName;
	}
	
	public void setFileName(String _fileName) {
		this.fileName = _fileName;
	}
	
	public int getViewCount() {
		return viewcount;
	}
	
	public void setViewCount(int _viewcount) {
		this.viewcount = _viewcount;
	}
}
