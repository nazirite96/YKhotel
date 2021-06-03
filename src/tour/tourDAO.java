package tour;
import java.sql.*;
import java.util.ArrayList;
public class tourDAO {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;
	
	public tourDAO() {
		// TODO Auto-generated constructor stub
	}
	/**관광지 정보 출력 메서드*/
	public ArrayList<tourDTO> getTourList(int tour){
		ArrayList<tourDTO> arr=new ArrayList<tourDTO>();
		try {
			conn=semidb.DB.getConn();
			String sql="select * from yk_tour where tour_ref=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, tour);
			rs=ps.executeQuery();
			tourDTO td=null;
			if(rs.next()) {
				do {
					int tour_idx=rs.getInt("tour_idx"); 
					String tour_name=rs.getString("tour_name"); 
					String tour_add=rs.getString("tour_add"); 
					String tour_movetime=rs.getString("tour_movetime"); 
					String tour_runtime=rs.getString("tour_runtime"); 
					String tour_info=rs.getString("tour_info");
					int tour_staravg=rs.getInt("tour_staravg");
					int tour_ref=rs.getInt("tour_ref");
					td=new tourDTO(tour_idx, tour_name, tour_add, tour_movetime, tour_runtime, tour_info, tour_staravg, tour_ref);
					
					arr.add(td);
					
				}while(rs.next());
				
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		System.out.println(arr.size());
		return arr;
	}
	/**관광지 최대 고유값 출력 메서드*/
	public int maxTourRef() {
			try {
				conn=semidb.DB.getConn();
				String sql="select max(tour_ref) from yk_tour";
				ps=conn.prepareStatement(sql);
				rs=ps.executeQuery(); //파라미터는 무조건 데이터가 나오기에 
				int max=0;
				if(rs.next()) {
					max=rs.getInt(1);
				}
				return max;
				
			} catch (Exception e) {
				e.printStackTrace();
				return 1;
			}finally {
				try {
					if(rs!=null)rs.close();
					if(ps!=null)ps.close();
					if(conn!=null)conn.close();
				} catch (Exception e2) {
					// TODO: handle exception
				}
			}
		}
	/**관광지 최소 고유값 출력 메서드*/
	public int minTourRef() {
		try {
			conn=semidb.DB.getConn();
			String sql="select min(tour_ref) from yk_tour";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery(); //파라미터는 무조건 데이터가 나오기에 
			int min=0;
			if(rs.next()) {
				min=rs.getInt(1);
			}
			return min;
			
		} catch (Exception e) {
			e.printStackTrace();
			return 1;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	/**관광지 고유값을 이용한 이름 출력 메서드*/
	public String getTourName(int ref) {
		try {
			conn=semidb.DB.getConn();
			String sql="select tour_name from yk_tour where tour_ref=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, ref);
			rs=ps.executeQuery();
			String name="";
			if(rs.next()) {
				name=rs.getString(1);
			}
			return name;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
	}
	/**관광지 링크 테이블 박스를 만드는 메서드*/
	public ArrayList<tourDTO> tourbox(){
		try {
			ArrayList<tourDTO> arr= new ArrayList<tourDTO>();
			conn=semidb.DB.getConn();
			String sql="select tour_ref, tour_name from yk_tour order by tour_ref";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			
			if(rs.next()) {
				do{
					tourDTO td=new tourDTO();
					td.setTour_ref(rs.getInt("tour_ref"));
					td.setTour_name(rs.getString("tour_name"));
					arr.add(td);
				}while(rs.next());
			}
			return arr;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	public String tourname(int tour) {
		 try {
			 conn=semidb.DB.getConn();
			 String sql="select tour_name from yk_tour where tour_ref=?";
			 ps=conn.prepareStatement(sql);
			 ps.setInt(1, tour);
			 rs=ps.executeQuery();
			 String name="";
			 if(rs.next()) {
				 name=rs.getString("tour_name");
			 }
			 return name;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
}
