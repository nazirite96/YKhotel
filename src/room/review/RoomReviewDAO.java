package room.review;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.*;
public class RoomReviewDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	public RoomReviewDAO() {
		
	}
	//별점 총합 구하기
	public int getStartscore(int roomidx) {
		try {
			String sql = "select sum(room_review_starscore)"
					+ " from yk_room_review where room_review_roomidx =?"; 
			ps = conn.prepareStatement(sql);
			ps.setInt(1, roomidx);
			rs = ps.executeQuery();
			rs.next();
			return rs.getInt(1);
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(ps!=null) {ps.close();}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	
	
	
	/**현재 갯수 가져오기*/
	public int[] getCntAndstarscore(int roomidx) {
		try {
			conn = semidb.DB.getConn();
			int sumStar = getStartscore(roomidx);
			String sql = "select count(*) from yk_room_review where"
					+ " room_review_roomidx=? and room_review_lev=0";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, roomidx);
			rs=ps.executeQuery();
			rs.next();
			int count = rs.getInt(1);
			int startidx[] = {sumStar,count};
			return startidx;
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
	
	
	
	/**리뷰 수정*/
	public int updateRoomReview(RoomReviewDTO dto) {
		try {
			conn = semidb.DB.getConn();
			String sql = "update yk_room_review set room_review_content=? ,room_review_starscore=? ,room_review_img=? where room_review_idx=?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getRoom_review_content());
			System.out.println(dto.getRoom_review_content());
			ps.setInt(2, dto.getRoom_review_starScore());
			System.out.println(dto.getRoom_review_starScore());
			ps.setString(3, dto.getRoom_review_img());
			System.out.println(dto.getRoom_review_img());
			ps.setInt(4, dto.getRoom_review_idx());
			System.out.println(dto.getRoom_review_idx());
			int result = ps.executeUpdate();
			return result;
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
			// TODO: handle exception
		}finally {
			try {
				if(ps!=null) {ps.close();}
				if(conn!=null){conn.close();}
			} catch (Exception e2) {
				// TODO: handle exception
				e2.printStackTrace();
			}
		}
	}
	
	
	
	/**리뷰 삭제*/
	public int deleteRoomReview(int room_review_idx) {
		try {
			conn=semidb.DB.getConn();
			String sql = "delete from yk_room_review where room_review_idx = ?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, room_review_idx);
			int result = ps.executeUpdate();
			return result;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
			// TODO: handle exception
		} finally {
			try {
				if(ps!=null) {ps.close();}
				if(conn!=null) {conn.close();}
			} catch (Exception e2) {
				e2.printStackTrace();
				// TODO: handle exception
			}
		}
	}
	/**ref 마지막 값 추출 관련 메서드*/
	public int getMaxRef(){
		try {
			String sql = "select max(room_review_ref) from yk_room_review";
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			int max = 0;
			if(rs.next()){
				max = rs.getInt(1);
			}
			return max;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(ps!=null) {ps.close();}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	/**리뷰 글쓰기*/
	public int insertRoomReview(RoomReviewDTO dto) {
		try {
			conn = semidb.DB.getConn();
			int max = getMaxRef();
			String sql = "insert into yk_room_review"
					+ " values(yk_room_review_idx.nextval,?,?,?,?,"
					+ "?,sysdate,0,?,0,0)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getRoom_review_roomIdx());
			ps.setString(2, dto.getRoom_review_id());
			ps.setInt(3, dto.getRoom_review_starScore());
			ps.setString(4, dto.getRoom_review_content());
			ps.setString(5, dto.getRoom_review_img());
			ps.setInt(6,max+1);
			int result = ps.executeUpdate();
			return result;
		
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		}finally {
			try {
				if(ps!=null) {ps.close();}
				if(conn!=null) {conn.close();}
			} catch (Exception e2) {
				e2.printStackTrace();
				// TODO: handle exception
			}
		}
	}
	public int insertRoomReviewAnswer(int roomIdx,String content, int ref) {
		try {
			conn = semidb.DB.getConn();
			String sql = "insert into yk_room_review values(yk_room_review_idx.nextval,?,'관리자',0,?,'base.jpg',sysdate,0,?,1,1)";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, roomIdx);
			ps.setString(2, content);
			ps.setInt(3, ref);
			int result = ps.executeUpdate();
			return result;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return 0;
		} finally {
			try {
				if(ps!=null) {ps.close();}
				if(conn!=null) {conn.close();}
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
		
		
	}
	

	
	
	/**방정보 가져오기*/
	public String selectRoomReviewidx(String room_review_idx) {
		try {
			conn = semidb.DB.getConn();
			String sql = "select * from yk_room_review where room_review_idx ="+room_review_idx;
			ps = conn.prepareStatement(sql);
			rs = ps.executeQuery();
			rs.next();
			String room_review_content = rs.getString("room_review_content");
			return room_review_content;
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
	
	/**방가져오기 리뷰*/
	public ArrayList<RoomReviewDTO> getRoomReview(int roomidx , int cp, int ls) {
		try {
			conn = semidb.DB.getConn();
			String sql = "select * from (select rownum as rnum,a.* "
					+ "from (select * from yk_room_review where room_review_roomidx=? "
					+ "order by room_review_ref desc,room_review_step asc) a) "
					+ "where rnum>=? and rnum<=?";
			ps = conn.prepareStatement(sql);
			int start = (cp-1)*ls+1;
			int end = cp*ls;
			ps.setInt(1, roomidx);
			ps.setInt(2,start);
			ps.setInt(3, end);
			rs = ps.executeQuery();
			ArrayList<RoomReviewDTO> list = new ArrayList<RoomReviewDTO>();
			if(rs.next()) {
				do {
					int room_review_idx = rs.getInt("room_review_idx");
					
					int room_review_roomIdx = rs.getInt("room_review_roomidx");
					String room_review_id = rs.getString("room_review_id");
					int room_review_starScore = rs.getInt("room_review_starScore");
					String room_review_content = rs.getString("room_review_content");
					String room_review_img = rs.getString("room_review_img");
					java.sql.Date room_review_writeDate = rs.getDate("room_review_writedate");
					int room_review_readnum = rs.getInt("room_review_readnum");
					int room_review_ref = rs.getInt("room_review_ref");
					int room_review_lev = rs.getInt("room_review_lev");
					int room_review_step = rs.getInt("room_review_step");
					RoomReviewDTO dto = new RoomReviewDTO(room_review_idx, room_review_roomIdx, room_review_id, room_review_starScore, room_review_content, room_review_img, room_review_writeDate, room_review_readnum, room_review_ref, room_review_lev, room_review_step);
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
				e2.printStackTrace();
			}
		}
		
	}
	

}
