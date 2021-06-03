package review;

public class reviewDTO {
private int review_idx;
private int review_star;
private String review_id;
private String review_subject;
private String review_content;
private int review_like;
private int review_ref;
private int review_write_ref;
private String review_imgname;
private String review_writedate;
public reviewDTO() {
	// TODO Auto-generated constructor stub
}




public reviewDTO(int review_idx, int review_star, String review_id, String review_subject, String review_content,
		int review_like, int review_ref, int review_write_ref, String review_imgname, String review_writedate) {
	super();
	this.review_idx = review_idx;
	this.review_star = review_star;
	this.review_id = review_id;
	this.review_subject = review_subject;
	this.review_content = review_content;
	this.review_like = review_like;
	this.review_ref = review_ref;
	this.review_write_ref = review_write_ref;
	this.review_imgname = review_imgname;
	this.review_writedate = review_writedate;
}




public int getReview_idx() {
	return review_idx;
}

public void setReview_idx(int review_idx) {
	this.review_idx = review_idx;
}

public int getReview_star() {
	return review_star;
}

public void setReview_star(int review_star) {
	this.review_star = review_star;
}

public String getReview_id() {
	return review_id;
}

public void setReview_id(String review_id) {
	this.review_id = review_id;
}

public String getReview_subject() {
	return review_subject;
}

public void setReview_subject(String review_subject) {
	this.review_subject = review_subject;
}

public String getReview_content() {
	return review_content;
}

public void setReview_content(String review_content) {
	this.review_content = review_content;
}

public int getReview_like() {
	return review_like;
}

public void setReview_like(int review_like) {
	this.review_like = review_like;
}

public int getReview_ref() {
	return review_ref;
}

public void setReview_ref(int review_ref) {
	this.review_ref = review_ref;
}

public int getReview_write_ref() {
	return review_write_ref;
}


public void setReview_write_ref(int review_write_ref) {
	this.review_write_ref = review_write_ref;
}




public String getReview_imgname() {
	return review_imgname;
}




public void setReview_imgname(String review_imgname) {
	this.review_imgname = review_imgname;
}




public String getReview_writedate() {
	return review_writedate;
}

public void setReview_writedate(String review_writedate) {
	this.review_writedate = review_writedate;
}

}
