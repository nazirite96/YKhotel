package reviewComment;

public class recomDTO {

	private int recom_idx;
	private int recom_review_idx;
	private String recom_id;
	private String recom_content;
	private String recom_writedate;
	private int recom_ref;
	private int recom_lev;
	private int recom_sunbun;
		
	public recomDTO() {
		// TODO Auto-generated constructor stub
	}

	public recomDTO(int recom_idx, int recom_review_idx, String recom_id, String recom_content, String recom_writedate,
			int recom_ref, int recom_lev, int recom_sunbun) {
		super();
		this.recom_idx = recom_idx;
		this.recom_review_idx = recom_review_idx;
		this.recom_id = recom_id;
		this.recom_content = recom_content;
		this.recom_writedate = recom_writedate;
		this.recom_ref = recom_ref;
		this.recom_lev = recom_lev;
		this.recom_sunbun = recom_sunbun;
	}

	public int getRecom_idx() {
		return recom_idx;
	}

	public void setRecom_idx(int recom_idx) {
		this.recom_idx = recom_idx;
	}

	public int getRecom_review_idx() {
		return recom_review_idx;
	}

	public void setRecom_review_idx(int recom_review_idx) {
		this.recom_review_idx = recom_review_idx;
	}

	public String getRecom_id() {
		return recom_id;
	}

	public void setRecom_id(String recom_id) {
		this.recom_id = recom_id;
	}

	public String getRecom_content() {
		return recom_content;
	}

	public void setRecom_content(String recom_content) {
		this.recom_content = recom_content;
	}

	public String getRecom_writedate() {
		return recom_writedate;
	}

	public void setRecom_writedate(String recom_writedate) {
		this.recom_writedate = recom_writedate;
	}

	public int getRecom_ref() {
		return recom_ref;
	}

	public void setRecom_ref(int recom_ref) {
		this.recom_ref = recom_ref;
	}

	public int getRecom_lev() {
		return recom_lev;
	}

	public void setRecom_lev(int recom_lev) {
		this.recom_lev = recom_lev;
	}

	public int getRecom_sunbun() {
		return recom_sunbun;
	}

	public void setRecom_sunbun(int recom_sunbun) {
		this.recom_sunbun = recom_sunbun;
	}
	
}
