package com;
import java.sql.*;
public class ComDTO {
 
	private int com_idx;
	private int com_bbs_idx;
	private String com_id;
	private String com_content;
	private Date com_writedate;
	private int com_likenum;
	private int com_ref;
	private int com_lev;
	private int com_sunbun;
	
	public ComDTO() {
		// TODO Auto-generated constructor stub
	}

	public ComDTO(int com_idx, int com_bbs_idx, String com_id, String com_content, Date com_writedate, int com_likenum,
			int com_ref, int com_lev, int com_sunbun) {
		super();
		this.com_idx = com_idx;
		this.com_bbs_idx = com_bbs_idx;
		this.com_id = com_id;
		this.com_content = com_content;
		this.com_writedate = com_writedate;
		this.com_likenum = com_likenum;
		this.com_ref = com_ref;
		this.com_lev = com_lev;
		this.com_sunbun = com_sunbun;
	}

	public int getCom_idx() {
		return com_idx;
	}

	public void setCom_idx(int com_idx) {
		this.com_idx = com_idx;
	}

	public int getCom_bbs_idx() {
		return com_bbs_idx;
	}

	public void setCom_bbs_idx(int com_bbs_idx) {
		this.com_bbs_idx = com_bbs_idx;
	}

	public String getCom_id() {
		return com_id;
	}

	public void setCom_id(String com_id) {
		this.com_id = com_id;
	}

	public String getCom_content() {
		return com_content;
	}

	public void setCom_content(String com_content) {
		this.com_content = com_content;
	}

	public Date getCom_writedate() {
		return com_writedate;
	}

	public void setCom_writedate(Date com_writedate) {
		this.com_writedate = com_writedate;
	}

	public int getCom_likenum() {
		return com_likenum;
	}

	public void setCom_likenum(int com_likenum) {
		this.com_likenum = com_likenum;
	}

	public int getCom_ref() {
		return com_ref;
	}

	public void setCom_ref(int com_ref) {
		this.com_ref = com_ref;
	}

	public int getCom_lev() {
		return com_lev;
	}

	public void setCom_lev(int com_lev) {
		this.com_lev = com_lev;
	}

	public int getCom_sunbun() {
		return com_sunbun;
	}

	public void setCom_sunbun(int com_sunbun) {
		this.com_sunbun = com_sunbun;
	}


	
	
}
