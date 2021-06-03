package member;
import java.sql.*;
public class YkMemberDTO {
	private int idx;
	private String id;
	private String password;
	private String name;
	private String sex;
	private String email;
	private String addr;
	private String tel;
	private Date joindate;
	private int master;
	
	public YkMemberDTO() {
		System.out.println("YkMemberDTO 생성자 호출스");
	}

	public YkMemberDTO(int idx, String id, String password, String name, String sex, String email, String addr,
			String tel, Date joindate, int master) {
		super();
		this.idx = idx;
		this.id = id;
		this.password = password;
		this.name = name;
		this.sex = sex;
		this.email = email;
		this.addr = addr;
		this.tel = tel;
		this.joindate = joindate;
		this.master = master;
	}

	public int getIdx() {
		return idx;
	}

	public void setIdx(int idx) {
		this.idx = idx;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getSex() {
		return sex;
	}

	public void setSex(String sex) {
		this.sex = sex;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getAddr() {
		return addr;
	}

	public void setAddr(String addr) {
		this.addr = addr;
	}

	public String getTel() {
		return tel;
	}

	public void setTel(String tel) {
		this.tel = tel;
	}

	public Date getJoindate() {
		return joindate;
	}

	public void setJoindate(Date joindate) {
		this.joindate = joindate;
	}

	public int getMaster() {
		return master;
	}

	public void setMaster(int master) {
		this.master = master;
	}
	
	
}
