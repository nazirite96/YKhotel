package reser;

import java.sql.*;
import java.util.ArrayList;

public class ReserDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	//예약 현황
	
	public ReserDAO() {
		
	}
	
	//리뷰가능한지
	public boolean reserCanReview(String id ,String roomidx,String today) {
		try {
			conn = semidb.DB.getConn();
			String sql = "select reser_idx from yk_reser where reser_room = "+roomidx+" and " + 
					"reser_id = '"+id+"' and reser_checkout < '2020-11-27'";//나중에 추가할today
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			return rs.next();
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		} finally {
			try {
				if(rs!=null) {rs.close();}
				if(ps!=null) {ps.close();}
				if(conn!=null) {conn.close();}
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
	}
	//예약 가능?
	public boolean reserStatus(String today ,int idx) {
		try {
			conn = semidb.DB.getConn();
			String sql = "select reser_idx from"
					+ " yk_reser where reser_checkin<='"+today+"' and reser_checkout>'"+today+"' and reser_room = "+idx;
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			return rs.next();
		
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return false;
		} finally {
			try {
				if(rs!=null) {rs.close();}
				if(ps!=null) {ps.close();}
				if(conn!=null) {conn.close();}
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
		
	}
	//예약 범위
	public boolean reserRange(String checkin,String checkout,int room_idx) {
		try {
			conn = semidb.DB.getConn();
			String sql = "select reser_idx from"
					+ " yk_reser where reser_checkin<'"+checkout+"' and reser_checkout>'"
					+checkin+"' and reser_room = "+room_idx;
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			return !(rs.next());
		} catch (Exception e) {
			// TODO Auto-generated catch block
			
			e.printStackTrace();
			return false;
		} finally {
			try {
				if(rs!=null) {rs.close();}
				if(ps!=null) {ps.close();}
				if(conn!=null) {conn.close();}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	
	//insert
	public int reserInsert(int reser_room,
			java.sql.Date reser_checkin,java.sql.Date reser_checkout,
			int person,int totalprice,String id,int reser_bbc) {
		try {
			conn = semidb.DB.getConn();
			System.out.println(reser_bbc);
			String sql = "insert into yk_reser values(yk_reser_idx.nextval,?,?,?,?,?,?,sysdate,?)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, reser_room);
			ps.setDate(2, reser_checkin);
			ps.setDate(3, reser_checkout);
			ps.setInt(4, person);
			ps.setInt(5,totalprice);
			ps.setString(6,id);
			ps.setInt(7,reser_bbc);
			int result = ps.executeUpdate();
			return result;
			
		} catch (Exception e) {
			// TODO: handle exception
			return -1;
		} finally {
			try {
				if(ps!=null) {ps.close();}
				if(conn!=null) {conn.close();}
				
			} catch (Exception e) {
				// TODO: handle exception
			}
		}
	}
	
	//id로 예약 조회
	public ArrayList<ReserDTO> reserCheck(String today , String id){
		try {
			conn= semidb.DB.getConn();
			String sql = "select * from	yk_reser where reser_checkout>'"+today+"' and reser_id = ?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, id);
			rs = ps.executeQuery();
			ArrayList<ReserDTO> list = new ArrayList<ReserDTO>();
			if(rs.next()) {
				do {
					int reser_idx = rs.getInt("reser_idx");
					int reser_room = rs.getInt("reser_room");
					java.sql.Date reser_checkin = rs.getDate("reser_checkin");
					java.sql.Date reser_checkout = rs.getDate("reser_checkout");
					int reser_person = rs.getInt("reser_person");
					int reser_price = rs.getInt("reser_totalprice");
					String reser_id = rs.getString("reser_id");
					java.sql.Date reser_date = rs.getDate("reser_date");
					int reser_bbc = rs.getInt("reser_bbc");
					ReserDTO dto = new ReserDTO(reser_idx, reser_room, reser_checkin,
							reser_checkout, reser_person, reser_price, reser_id, reser_date,reser_bbc);
					list.add(dto);
				}while(rs.next());
			}
			return list;	
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return null;
		} finally {
			try {
				if(rs!=null) {rs.close();}
				if(ps!=null) {ps.close();}
				if(conn!=null) {conn.close();}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	//예약 취소
	public int reserCancel(int reser_idx) {
		try {
			conn = semidb.DB.getConn();
			String sql = "delete from yk_reser where reser_idx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, reser_idx);
			int result = ps.executeUpdate();
			return result;
			
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null) {ps.close();}
				if(conn!=null) {conn.close();}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	

}
