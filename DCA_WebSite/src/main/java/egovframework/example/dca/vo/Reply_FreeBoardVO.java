package egovframework.example.dca.vo;

public class Reply_FreeBoardVO {
	private int reply_no;
	private String article_id;
	private String reply_text;
	private String reply_writer;
	private String reg_date;
	private String update_date;
	
	// initialize
	public Reply_FreeBoardVO() {
		
	}
	
	public Reply_FreeBoardVO(int reply_no, String article_id, String text, String writer, String reg_date, String update_date) {
		super();
		this.reply_no = reply_no;
		this.article_id = article_id;
		this.reply_text = text;
		this.reply_writer = writer;
		this.reg_date = reg_date;
		this.update_date = update_date;
	}
	
	// getter and setter
	public int getReplyNo() {
		return reply_no;
	}
	
	public void setReplyNo(int _reply_no) {
		this.reply_no = _reply_no;
	}
	
	public String getArticleId() {
		return article_id;
	}
	
	public void setArticleId(String _article_id) {
		this.article_id = _article_id;
	}
	
	public String getText() {
		return reply_text;
	}
	
	public void setText(String _reply_text) {
		this.reply_text = _reply_text;
	}
	
	public String getWriter() {
		return reply_writer;
	}
	
	public void setWriter(String _reply_writer) {
		this.reply_writer = _reply_writer;
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
	
}
