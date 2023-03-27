package egovframework.example.dca.vo;

public class MemberVO {
	private int seq;
	private String id;
	private String pw;
	private String name;
	private String codeNumber;
	private String email;
	private String phone;
	private String role;
	private String snsid;
	
	// initialize
	public MemberVO() {
		
	}
	
	public MemberVO(int seq, String userid, String userpw, String username, String usercodeNumber, String useremail, String userphone, String role) {
		super();
		this.seq = seq;
		this.id = userid;
		this.pw = userpw;
		this.name = username;
		this.codeNumber = usercodeNumber;
		this.email = useremail;
		this.phone = userphone;
		this.role = role;
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
	
	public void setId(String _userid) {
		this.id = _userid;
	}
	
	public String getPw() {
		return pw;
	}
	
	public void setPw(String _userpw) {
		this.pw = _userpw;
	}
	
	public String getName() {
		return name;
	}
	
	public void setName(String _username) {
		this.name = _username;
	}
	
	public String getCodeNumber() {
		return codeNumber;
	}
	
	public void setCodeNumber(String _usercodeNumber) {
		this.codeNumber = _usercodeNumber;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String _useremail) {
		this.email = _useremail;
	}
	
	public String getPhone() {
		return phone;
	}
	
	public void setPhone(String _userphone) {
		this.phone = _userphone;
	}
	
	public String getRole() {
		return role;
	}
	
	public void setRole(String _role) {
		this.role = _role;
	}
	
	public String getSnsid() {
		return snsid;
	}
	
	public void setSnsid(String _snsid) {
		this.snsid = _snsid;
	}
	
	public String toString() {
		return id + " " + name + " " + codeNumber + " " + email + " " + phone + " " + role;
	}
	
}

