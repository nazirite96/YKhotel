package room;

public class RoomDTO {
	
	private int room_idx;
	private String room_name;
	private String room_size;
	private int room_minperson;
	private int room_maxperson;
	private int room_price;
	private int room_weekendprice;
	private String room_img;
	public RoomDTO() {
		super();
		// TODO Auto-generated constructor stub
	}

	public RoomDTO(int room_idx, String room_name, String room_size, int room_minperson, int room_maxperson,
			int room_price, int room_weekendprice ,String room_img) {
		super();
		this.room_idx = room_idx;
		this.room_name = room_name;
		this.room_size = room_size;
		this.room_minperson = room_minperson;
		this.room_maxperson = room_maxperson;
		this.room_price = room_price;
		this.room_weekendprice = room_weekendprice;
		this.room_img = room_img;
	}

	public int getRoom_idx() {
		return room_idx;
	}

	public void setRoom_idx(int room_idx) {
		this.room_idx = room_idx;
	}

	public String getRoom_name() {
		return room_name;
	}

	public void setRoom_name(String room_name) {
		this.room_name = room_name;
	}

	public String getRoom_size() {
		return room_size;
	}

	public void setRoom_size(String room_size) {
		this.room_size = room_size;
	}

	public int getRoom_minperson() {
		return room_minperson;
	}

	public void setRoom_minperson(int room_minperson) {
		this.room_minperson = room_minperson;
	}

	public int getRoom_maxperson() {
		return room_maxperson;
	}

	public void setRoom_maxperson(int room_maxperson) {
		this.room_maxperson = room_maxperson;
	}

	public int getRoom_price() {
		return room_price;
	}

	public void setRoom_price(int room_price) {
		this.room_price = room_price;
	}

	public int getRoom_weekendprice() {
		return room_weekendprice;
	}

	public void setRoom_weekendprice(int room_weekendprice) {
		this.room_weekendprice = room_weekendprice;
	}
	
	public String getRoom_img() {
		return room_img;
	}
	
	public void setRoom_img(String room_img) {
		this.room_img = room_img;
	}
	
	
	
}
