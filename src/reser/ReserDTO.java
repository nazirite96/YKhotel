package reser;

import java.sql.*;

public class ReserDTO {
	private int reser_idx;
	private int reser_room;
	private Date reser_checkin;
	private Date reser_checkout;
	private int reser_person;
	private int reser_price;
	private String reser_id;
	private Date reser_date;
	private int reser_bbc;
	
	public ReserDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public ReserDTO(int reser_idx, int reser_room, Date reser_checkin, Date reser_checkout, int reser_person,
			int reser_price, String reser_id, Date reser_date,int reser_bbc) {
		super();
		this.reser_idx = reser_idx;
		this.reser_room = reser_room;
		this.reser_checkin = reser_checkin;
		this.reser_checkout = reser_checkout;
		this.reser_person = reser_person;
		this.reser_price = reser_price;
		this.reser_id = reser_id;
		this.reser_date = reser_date;
		this.reser_bbc = reser_bbc;
	}

	public int getReser_idx() {
		return reser_idx;
	}

	public void setReser_idx(int reser_idx) {
		this.reser_idx = reser_idx;
	}

	public int getReser_room() {
		return reser_room;
	}

	public void setReser_room(int reser_room) {
		this.reser_room = reser_room;
	}

	public Date getReser_checkin() {
		return reser_checkin;
	}

	public void setReser_checkin(Date reser_checkin) {
		this.reser_checkin = reser_checkin;
	}

	public Date getReser_checkout() {
		return reser_checkout;
	}

	public void setReser_checkout(Date reser_checkout) {
		this.reser_checkout = reser_checkout;
	}

	public int getReser_person() {
		return reser_person;
	}

	public void setReser_person(int reser_person) {
		this.reser_person = reser_person;
	}

	public int getReser_price() {
		return reser_price;
	}

	public void setReser_price(int reser_price) {
		this.reser_price = reser_price;
	}

	public String getReser_id() {
		return reser_id;
	}

	public void setReser_id(String reser_id) {
		this.reser_id = reser_id;
	}

	public Date getReser_date() {
		return reser_date;
	}

	public void setReser_date(Date reser_date) {
		this.reser_date = reser_date;
	}

	public int getReser_bbc() {
		return reser_bbc;
	}

	public void setReser_bbc(int reser_bbc) {
		this.reser_bbc = reser_bbc;
	}
	
	
	
	
	
}
