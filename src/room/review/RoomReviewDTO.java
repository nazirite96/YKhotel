package room.review;

import java.sql.*;


public class RoomReviewDTO {
	private int room_review_idx;
	private int room_review_roomIdx;
	private String room_review_id;
	private int room_review_starScore;
	private String room_review_content;
	private String room_review_img;
	private java.sql.Date room_review_writeDate;
	private int room_review_readnum;
	private int room_review_ref;
	private int room_review_lev;
	private int room_review_step;
	
	public RoomReviewDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	
	


	public RoomReviewDTO(int room_review_idx, int room_review_roomIdx, String room_review_id, int room_review_starScore,
			String room_review_content, String room_review_img, Date room_review_writeDate, int room_review_readnum,
			int room_review_ref, int room_review_lev, int room_review_step) {
		super();
		this.room_review_idx = room_review_idx;
		this.room_review_roomIdx = room_review_roomIdx;
		this.room_review_id = room_review_id;
		this.room_review_starScore = room_review_starScore;
		this.room_review_content = room_review_content;
		this.room_review_img = room_review_img;
		this.room_review_writeDate = room_review_writeDate;
		this.room_review_readnum = room_review_readnum;
		this.room_review_ref = room_review_ref;
		this.room_review_lev = room_review_lev;
		this.room_review_step = room_review_step;
	}




	public int getRoom_review_idx() {
		return room_review_idx;
	}

	public void setRoom_review_idx(int room_review_idx) {
		this.room_review_idx = room_review_idx;
	}

	public int getRoom_review_roomIdx() {
		return room_review_roomIdx;
	}

	public void setRoom_review_roomIdx(int room_review_roomIdx) {
		this.room_review_roomIdx = room_review_roomIdx;
	}

	public String getRoom_review_id() {
		return room_review_id;
	}

	public void setRoom_review_id(String room_review_id) {
		this.room_review_id = room_review_id;
	}

	public int getRoom_review_starScore() {
		return room_review_starScore;
	}

	public void setRoom_review_starScore(int room_review_starScore) {
		this.room_review_starScore = room_review_starScore;
	}

	public String getRoom_review_img() {
		return room_review_img;
	}

	public void setRoom_review_img(String room_review_img) {
		this.room_review_img = room_review_img;
	}

	public java.sql.Date getRoom_review_writeDate() {
		return room_review_writeDate;
	}

	public void setRoom_review_writeDate(java.sql.Date room_review_writeDate) {
		this.room_review_writeDate = room_review_writeDate;
	}

	public int getRoom_review_readnum() {
		return room_review_readnum;
	}

	public void setRoom_review_readnum(int room_review_readnum) {
		this.room_review_readnum = room_review_readnum;
	}

	public int getRoom_review_ref() {
		return room_review_ref;
	}

	public void setRoom_review_ref(int room_review_ref) {
		this.room_review_ref = room_review_ref;
	}

	public int getRoom_review_lev() {
		return room_review_lev;
	}

	public void setRoom_review_lev(int room_review_lev) {
		this.room_review_lev = room_review_lev;
	}

	public int getRoom_review_step() {
		return room_review_step;
	}

	public void setRoom_review_step(int room_review_step) {
		this.room_review_step = room_review_step;
	}
	
	public String getRoom_review_content() {
		return room_review_content;
	}


	public void setRoom_review_content(String room_review_content) {
		this.room_review_content = room_review_content;
	}

	
}
