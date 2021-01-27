package board;

import java.io.Serializable;
import java.util.ArrayList;

import board.BoardDTO;

public class PageTo implements Serializable{
	// 이미 있는 데이터를 가져오는 역할만 하므로 객체직렬화 하지 않는다.
	private ArrayList<BoardDTO> list;
	private int curPage;
	private int perPage=20; // 한번에 표시되는 페이지 수
	private int totalCount;
	public PageTo() {
	}

	public PageTo(ArrayList<BoardDTO> list, int curPage, int totalCount) {
	super();
	this.list = list;
	this.curPage = curPage;
	this.totalCount = totalCount;
	}

	public ArrayList<BoardDTO> getList() {
	return list;
	}

	public void setList(ArrayList<BoardDTO> list) {
	this.list = list;
	}

	public int getCurPage() {
	return curPage;
	}

	public void setCurPage(int curPage) {
	this.curPage = curPage;
	}

	public int getPerPage() {
	return perPage;
	}

	public void setPerPage(int perPage) {
	this.perPage = perPage;
	}

	public int getTotalCount() {
	return totalCount;
	}

	public void setTotalCount(int totalCount) {
	this.totalCount = totalCount;
	}
	}
