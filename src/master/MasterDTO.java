package master;

import java.sql.*;

public class MasterDTO {

	private int master_idx;
	private String master_id;
	private String master_content;
	private Date master_writedate;
	private int master_ref;
	private int master_lev;
	private int master_sunbun;
	
	public MasterDTO() {
		// TODO Auto-generated constructor stub
	}
	
	public MasterDTO(int master_idx, String master_id, String master_content, Date master_writedate, int master_ref,
			int master_lev, int master_sunbun) {
		super();
		this.master_idx = master_idx;
		this.master_id = master_id;
		this.master_content = master_content;
		this.master_writedate = master_writedate;
		this.master_ref = master_ref;
		this.master_lev = master_lev;
		this.master_sunbun = master_sunbun;
	}


	public int getMaster_idx() {
		return master_idx;
	}


	public void setMaster_idx(int master_idx) {
		this.master_idx = master_idx;
	}


	public String getMaster_id() {
		return master_id;
	}


	public void setMaster_id(String master_id) {
		this.master_id = master_id;
	}


	public String getMaster_content() {
		return master_content;
	}


	public void setMaster_content(String master_content) {
		this.master_content = master_content;
	}


	public Date getMaster_writedate() {
		return master_writedate;
	}


	public void setMaster_writedate(Date master_writedate) {
		this.master_writedate = master_writedate;
	}


	public int getMaster_ref() {
		return master_ref;
	}


	public void setMaster_ref(int master_ref) {
		this.master_ref = master_ref;
	}


	public int getMaster_lev() {
		return master_lev;
	}


	public void setMaster_lev(int master_lev) {
		this.master_lev = master_lev;
	}


	public int getMaster_sunbun() {
		return master_sunbun;
	}


	public void setMaster_sunbun(int master_sunbun) {
		this.master_sunbun = master_sunbun;
	}
	
	
	
}
