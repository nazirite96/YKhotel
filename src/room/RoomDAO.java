package room;

import java.sql.*;
import java.util.*;

public class RoomDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public RoomDAO() {
		
	}
	
	//모든 방정보 얻어오기
	public ArrayList<RoomDTO> getRoom(){
		try {
			
			conn = semidb.DB.getConn();
			String sql = "select * from yk_room";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			ArrayList<RoomDTO> list = new ArrayList<RoomDTO>();
			RoomDTO dto = null;
			while(rs.next()) {
				int room_idx = rs.getInt("room_idx");
				String room_name = rs.getString("room_name");
				String room_size = rs.getString("room_size");
				int room_minperson = rs.getInt("room_minperson");
				int room_maxperson = rs.getInt("room_maxperson");
				int room_price = rs.getInt("room_price");
				int room_weekendprice = rs.getInt("room_weekendprice");
				String room_img = rs.getString("room_img");
				dto = new RoomDTO(room_idx, room_name, room_size, room_minperson,
						room_maxperson, room_price, room_weekendprice , room_img);
				list.add(dto);
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
				e2.printStackTrace();
			}
		}
		
	}
	//방번호로 방 정보 얻어오기
	public RoomDTO getSelectRoom(int room_idx) {
		try {
			conn = semidb.DB.getConn();
			String sql = "select * from yk_room where room_idx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, room_idx);
			rs = ps.executeQuery();
			rs.next();
			String room_name = rs.getString("room_name");
			String room_size = rs.getString("room_size");
			int room_minperson = rs.getInt("room_minperson");
			int room_maxperson = rs.getInt("room_maxperson");
			int room_price = rs.getInt("room_price");
			int room_weekendprice = rs.getInt("room_weekendprice");
			String room_img = rs.getString("room_img");
			RoomDTO dto = new RoomDTO(room_idx, room_name, room_size,
					room_minperson, room_maxperson, room_price, room_weekendprice,room_img);
			return dto;
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
	
}
