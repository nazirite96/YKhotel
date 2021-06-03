package qna;

import java.sql.*;

public class QnaDTO {
	
	private int qna_idx; //Q&A관련 게시글번호
	private String qna_id; //Q&A관련 아이디
	private String qna_subject; //Q&A관련 제목
	private String qna_content; //Q&A관련 글내용
	private Date qna_writedate; //Q&A관련 등록일(작성날짜)
	private int qna_readnum; //Q&A관련 조회수
	private int qna_ref; //Q&A관련 글쓰기 했을때 카운트하는 ref 변수
	private int qna_lev; //Q&A관련 게시글 순서
	private int qna_sunbun; //Q&A관련  게시글 계층
	
	
	public QnaDTO() {
		super();
	}


	public int getQna_idx() {
		return qna_idx;
	}


	public void setQna_idx(int qna_idx) {
		this.qna_idx = qna_idx;
	}


	public String getQna_id() {
		return qna_id;
	}


	public void setQna_id(String qna_id) {
		this.qna_id = qna_id;
	}


	public String getQna_subject() {
		return qna_subject;
	}


	public void setQna_subject(String qna_subject) {
		this.qna_subject = qna_subject;
	}


	public String getQna_content() {
		return qna_content;
	}


	public void setQna_content(String qna_content) {
		this.qna_content = qna_content;
	}


	public Date getQna_writedate() {
		return qna_writedate;
	}


	public void setQna_writedate(Date qna_writedate) {
		this.qna_writedate = qna_writedate;
	}


	public int getQna_readnum() {
		return qna_readnum;
	}


	public void setQna_readnum(int qna_readnum) {
		this.qna_readnum = qna_readnum;
	}


	public int getQna_ref() {
		return qna_ref;
	}


	public void setQna_ref(int qna_ref) {
		this.qna_ref = qna_ref;
	}


	public int getQna_lev() {
		return qna_lev;
	}


	public void setQna_lev(int qna_lev) {
		this.qna_lev = qna_lev;
	}


	public int getQna_sunbun() {
		return qna_sunbun;
	}


	public void setQna_sunbun(int qna_sunbun) {
		this.qna_sunbun = qna_sunbun;
	}


	public QnaDTO(int qna_idx, String qna_id, String qna_subject, String qna_content, Date qna_writedate,
			int qna_readnum, int qna_ref, int qna_lev, int qna_sunbun) {
		super();
		this.qna_idx = qna_idx;
		this.qna_id = qna_id;
		this.qna_subject = qna_subject;
		this.qna_content = qna_content;
		this.qna_writedate = qna_writedate;
		this.qna_readnum = qna_readnum;
		this.qna_ref = qna_ref;
		this.qna_lev = qna_lev;
		this.qna_sunbun = qna_sunbun;
	}
	
	
	
	
	
}
