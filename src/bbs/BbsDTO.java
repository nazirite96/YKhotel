package bbs;

import java.sql.*;

public class BbsDTO {

	private int bbs_idx;
	private String bbs_id;
	private String bbs_subject;
	private String bbs_content;
	private Date bbs_writedate;
	private int bbs_readnum;
	private int bbs_likenum;
	private int bbs_ref;
	private int bbs_lev;
	private int bbs_sunbun;
	private String bbs_imgname;
	
	
	public BbsDTO() {
		
	}


	public BbsDTO(int bbs_idx, String bbs_id, String bbs_subject, String bbs_content, Date bbs_writedate,
			int bbs_readnum, int bbs_likenum, int bbs_ref, int bbs_lev, int bbs_sunbun, String bbs_imgname) {
		super();
		this.bbs_idx = bbs_idx;
		this.bbs_id = bbs_id;
		this.bbs_subject = bbs_subject;
		this.bbs_content = bbs_content;
		this.bbs_writedate = bbs_writedate;
		this.bbs_readnum = bbs_readnum;
		this.bbs_likenum = bbs_likenum;
		this.bbs_ref = bbs_ref;
		this.bbs_lev = bbs_lev;
		this.bbs_sunbun = bbs_sunbun;
		this.bbs_imgname = bbs_imgname;
	}


	public int getBbs_idx() {
		return bbs_idx;
	}


	public void setBbs_idx(int bbs_idx) {
		this.bbs_idx = bbs_idx;
	}


	public String getBbs_id() {
		return bbs_id;
	}


	public void setBbs_id(String bbs_id) {
		this.bbs_id = bbs_id;
	}


	public String getBbs_subject() {
		return bbs_subject;
	}


	public void setBbs_subject(String bbs_subject) {
		this.bbs_subject = bbs_subject;
	}


	public String getBbs_content() {
		return bbs_content;
	}


	public void setBbs_content(String bbs_content) {
		this.bbs_content = bbs_content;
	}


	public Date getBbs_writedate() {
		return bbs_writedate;
	}


	public void setBbs_writedate(Date bbs_writedate) {
		this.bbs_writedate = bbs_writedate;
	}


	public int getBbs_readnum() {
		return bbs_readnum;
	}


	public void setBbs_readnum(int bbs_readnum) {
		this.bbs_readnum = bbs_readnum;
	}


	public int getBbs_likenum() {
		return bbs_likenum;
	}


	public void setBbs_likenum(int bbs_likenum) {
		this.bbs_likenum = bbs_likenum;
	}


	public int getBbs_ref() {
		return bbs_ref;
	}


	public void setBbs_ref(int bbs_ref) {
		this.bbs_ref = bbs_ref;
	}


	public int getBbs_lev() {
		return bbs_lev;
	}


	public void setBbs_lev(int bbs_lev) {
		this.bbs_lev = bbs_lev;
	}


	public int getBbs_sunbun() {
		return bbs_sunbun;
	}


	public void setBbs_sunbun(int bbs_sunbun) {
		this.bbs_sunbun = bbs_sunbun;
	}


	public String getBbs_imgname() {
		return bbs_imgname;
	}


	public void setBbs_imgname(String bbs_imgname) {
		this.bbs_imgname = bbs_imgname;
	}

	
	

}
