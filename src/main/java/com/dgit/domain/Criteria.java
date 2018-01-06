package com.dgit.domain;

public class Criteria {
	private int page;
	private int perPageNum;
	
	
	public Criteria() {		
		this.page = 1;
		this.perPageNum = 10;
	}
	
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		if(page<=0){
			this.page=1;
			return;
		}
		this.page = page;
	}
	public int getPerPageNum() {
		return this.perPageNum;
	}
	public void setPerPageNum(int perPageNum) {
		if(perPageNum <=0 || perPageNum >100){
			this.perPageNum = 10;
			return;
		}
		this.perPageNum = perPageNum;
	}
	
	public int getPageStart(){//해당 page 번호의 첫번째 게시물 인덱스 번호
		return (this.page - 1)* perPageNum;
	}
	@Override
	public String toString() {
		return "Criteria [page=" + page + ", perPageNum=" + perPageNum + "]";
	}
	
	
	
	
	
}
