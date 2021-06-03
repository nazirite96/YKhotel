package tour;

public class tourDTO {
	private int tour_idx;
	private String tour_name;
	private String tour_add;
	private String tour_movetime;
	private String tour_runtime;
	private String tour_info;
	private int tour_staravg;
	private int tour_ref;
	
	public tourDTO() {
		// TODO Auto-generated constructor stub
	}

	public tourDTO(int tour_idx, String tour_name, String tour_add, String tour_movetime, String tour_runtime,
			String tour_info, int tour_staravg, int tour_ref) {
		super();
		this.tour_idx = tour_idx;
		this.tour_name = tour_name;
		this.tour_add = tour_add;
		this.tour_movetime = tour_movetime;
		this.tour_runtime = tour_runtime;
		this.tour_info = tour_info;
		this.tour_staravg = tour_staravg;
		this.tour_ref = tour_ref;
	}

	public int getTour_idx() {
		return tour_idx;
	}

	public void setTour_idx(int tour_idx) {
		this.tour_idx = tour_idx;
	}

	public String getTour_name() {
		return tour_name;
	}

	public void setTour_name(String tour_name) {
		this.tour_name = tour_name;
	}

	public String getTour_add() {
		return tour_add;
	}

	public void setTour_add(String tour_add) {
		this.tour_add = tour_add;
	}

	public String getTour_movetime() {
		return tour_movetime;
	}

	public void setTour_movetime(String tour_movetime) {
		this.tour_movetime = tour_movetime;
	}

	public String getTour_runtime() {
		return tour_runtime;
	}

	public void setTour_runtime(String tour_runtime) {
		this.tour_runtime = tour_runtime;
	}

	public String getTour_info() {
		return tour_info;
	}

	public void setTour_info(String tour_info) {
		this.tour_info = tour_info;
	}

	public int getTour_staravg() {
		return tour_staravg;
	}

	public void setTour_staravg(int tour_staravg) {
		this.tour_staravg = tour_staravg;
	}

	public int getTour_ref() {
		return tour_ref;
	}

	public void setTour_ref(int tour_ref) {
		this.tour_ref = tour_ref;
	}
	
}
