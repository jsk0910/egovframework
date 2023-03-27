package egovframework.example.board.vo;

public class Pagination {
	private int listSize = 10;
	private int rangeSize = 5;
	private int page;
	private int range;
	private int listCount;
	private int pageCount;
	private int startPage;
	private int startList;
	private int endPage;
	private boolean prev;
	private boolean next;
	
	//initialize
	public Pagination() {
		
	}
	
	//function
	public void pageInfo(int page, int range, int listCount) {
		this.page = page;
		this.range = range;
		this.listCount = listCount;
		
		this.pageCount = (int) Math.ceil((double)listCount / listSize);
		this.startPage = (range - 1) * rangeSize + 1;
		this.endPage = range * rangeSize;
		this.startList = (page - 1) * listSize;
		this.prev = range == 1 ? false : true;
		this.next = endPage > pageCount ? false : true;
		
		if(this.endPage > this.pageCount) {
			this.endPage = this.pageCount;
			this.next = false;
		}
	}
	
	//getter and setter
	
	public int getListSize() {
		return listSize;
	}
	
	public void setListSize(int _listSize) {
		this.listSize = _listSize;
	}
	
	public int getRangeSize() {
		return rangeSize;
	}
	
	public void setRangeSize(int _rangeSize) {
		this.rangeSize = _rangeSize;
	}
	
	public int getPage() {
		return page;
	}
	
	public void setPage(int _page) {
		this.page = _page;
	}
	
	public int getRange() {
		return range;
	}
	
	public void setRange(int _range) {
		this.range = _range;
	}
	
	public int getListCount() {
		return listCount;
	}
	
	public void setListCount(int _listCount) {
		this.listCount = _listCount;
	}
	
	public int getPageCount() {
		return pageCount;
	}
	
	public void setPageCount(int _pageCount) {
		this.pageCount = _pageCount;
	}
	
	public int getStartPage() {
		return startPage;
	}
	
	public void setStartPage(int _startPage) {
		this.startPage = _startPage;
	}
	
	public int getStartList() {
		return startList;
	}
	
	public void setStartList(int _startList) {
		this.startList = _startList;
	}
	
	public int getEndPage() {
		return endPage;
	}
	
	public void setEndPage(int _endPage) {
		this.endPage = _endPage;
	}
	
	public boolean isPrev() {
		return prev;
	}
	
	public void setPrev(boolean _prev) {
		this.prev = _prev;
	}
	
	public boolean isNext() {
		return next;
	}
	
	public void setNext(boolean _next) {
		this.next = _next;
	}
}
