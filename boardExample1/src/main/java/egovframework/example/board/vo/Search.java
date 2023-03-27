package egovframework.example.board.vo;

public class Search extends Pagination{
	private String searchType;
	private String keyword;
	
	//initialize
	public Search() {
		
	}
	
	//getter and setter
	public String getSearchType() {
		return searchType;
	}
	
	public void setSearchType(String _searchType) {
		this.searchType = _searchType;
	}
	
	public String getKeyword() {
		return keyword;
	}
	
	public void setKeyword(String _keyword) {
		this.keyword = _keyword;
	}
}
