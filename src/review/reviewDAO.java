package review;

import java.sql.*;
import java.util.*;
import tour.*;

public class reviewDAO {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;


	public reviewDAO() {
		// TODO Auto-generated constructor stub
	}

	/**각 관광지마다의 총 별점 갯수를 반버림으로 구해서 평균별점 계산의 재료로 사용*/
	public int totalstar(int ref) {  
		try {
			String sql="select  trunc(sum(review_star) /count(*)) from yk_review  where review_ref=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, ref);
			rs=ps.executeQuery(); //파라미터는 무조건 데이터가 나오기에 
			int star=0;
			if(rs.next()) {
				star=rs.getInt(1);
			}
			return star;
		} catch (SQLException e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	/**각 관광지마다의 총 게시글 수를 구해 평균별점 및 총 참여인원 통계의 재료로 사용*/
	public int totalcount(int ref) {
		try {
			conn=semidb.DB.getConn();
			String sql="select count(review_star) from yk_review where review_ref=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, ref);
			rs=ps.executeQuery(); //파라미터는 무조건 데이터가 나오기에 
			int tc=0;
			if(rs.next()) {
				tc=rs.getInt(1);
			}
			return tc;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
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
	/**idx외에 글의 실질적인 순서를 정해줌*/
	public int getMaxRef() {

		try {
			//글쓰기 메서드 떄 커넥션을 할당받는 가정 하에 그냥 작성
			String sql="select max(review_write_ref) from yk_review";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			int max=0;
			if(rs.next()) {
				max=rs.getInt(1);
			}
			return max;
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}

	}

	/** 글 작성메서드 스텝은 하기 표기*/
	public int postContent(reviewDTO dto) {

		try {
			int count=0;
			conn=semidb.DB.getConn();
			int max=getMaxRef();// 먼저 총 별점을 가져오기
			String sql="insert into yk_review values(yk_review_idx.nextval,?,?,?,?,0,?,?,?,sysdate)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, dto.getReview_star());
			ps.setString(2, dto.getReview_id());
			ps.setString(3, dto.getReview_subject());
			ps.setString(4, dto.getReview_content());
			ps.setInt(5, dto.getReview_ref());
			ps.setInt(6, max+1);
			ps.setString(7, dto.getReview_imgname());
			count=ps.executeUpdate();


			int result=0;
			int star=totalstar(dto.getReview_ref());
			System.out.println("ref="+dto.getReview_ref());
			System.out.println("star="+star);

			//여기서 관광지의 평균별점을 업데이트해줌
			sql="update yk_tour set tour_staravg=? where tour_ref=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, star);
			ps.setInt(2, dto.getReview_ref());
			result=ps.executeUpdate();
			System.out.println("count="+count);
			return count;

		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}

	}
	/**각 관광지마다 리뷰를 출력 여기서 ref는 관광지 고유값| how는 정렬순서 (디폴트는 최신순)*/
	public ArrayList<reviewDTO> getreview(String how,int ref,int cp, int listsize){
		ArrayList<reviewDTO> arr=new ArrayList<reviewDTO>();
		try {
			conn=semidb.DB.getConn();
			//	String sql="select * from yk_review where review_ref=? order by "+how+" desc";
			String sql="select * from (select rownum as rnum, a.* from (select * from  yk_review where review_ref=? order by "+how+" desc)a)b "+" where rnum>=? and rnum<=?";
			System.out.println("11111");
			ps=conn.prepareStatement(sql);
			int start=(cp-1)*listsize+1;
			int end= cp*listsize;
			ps.setInt(1, ref);
			ps.setInt(2, start);
			ps.setInt(3, end);
			rs=ps.executeQuery();
			System.out.println("22222");

			if(rs.next()) {
				do {System.out.println("3333");
				int review_idx=rs.getInt("review_idx");

				int review_star=rs.getInt("review_star");
				String review_id=rs.getString("review_id");

				String review_subject=rs.getString("review_subject");

				String review_content=rs.getString("review_content");
				int review_like=rs.getInt("review_like");

				int review_ref=rs.getInt("review_ref");
				int review_write_ref=0;
				String review_imgname=rs.getString("review_imgname");
				String review_writedate=rs.getString("review_writedate");

				reviewDTO rd=new reviewDTO(review_idx, review_star, review_id, review_subject, review_content, review_like, review_ref, review_write_ref, review_imgname, review_writedate);
				arr.add(rd);
				}while(rs.next());
			}

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
		return arr;
	}
	/**좋아요 누르는 메서드 */
	public void likeit(int idx,int like) {
		try {
			conn=semidb.DB.getConn();
			String sql="update yk_review set review_like=? where review_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, like+1);
			ps.setInt(2, idx);
			ps.executeUpdate();
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}

	}
	public reviewDTO reviewcontent(int review_idx){
		try {
			conn=semidb.DB.getConn();


			String sql="select * from yk_review where review_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, review_idx);
			rs=ps.executeQuery();
			reviewDTO rt= null;

			if(rs.next()) {
				int review_star=rs.getInt("review_star");
				String review_id=rs.getString("review_id");
				String review_subject=rs.getString("review_subject");
				String review_content=rs.getString("review_content");
				int review_like=rs.getInt("review_like");
				int review_ref=rs.getInt("review_ref");
				int review_write_ref=rs.getInt("review_write_ref");
				String review_imgname=rs.getString("review_imgname");
				String review_writedate=rs.getString("review_writedate");
				rt= new reviewDTO(review_idx, review_star, review_id, review_subject, review_content, review_like, review_ref, review_write_ref, review_imgname, review_writedate);
			}	

			return rt;

		} catch (Exception e) {
			e.printStackTrace();

			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
			}
		}
	}

	public int deleteReview(int review_idx, String review_id) {
		int count=0;
		try {
			conn=semidb.DB.getConn();

			String sql="delete from yk_review where review_idx=? and review_id=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, review_idx);
			ps.setString(2, review_id);
			count=ps.executeUpdate();

			return count;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			return -1;
		}finally {
			try {

				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	public int getTotalCnt(int ref) {

		try {
			conn=semidb.DB.getConn();
			String sql="select count(*) from yk_review where review_ref=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, ref);
			rs=ps.executeQuery(); //파라미터는 무조건 데이터가 나오기에 
			rs.next();
			int count=rs.getInt(1);
			count=count==0?1:count;
			return count;
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
	public int editReview(reviewDTO rdto) {
		try {
			conn=semidb.DB.getConn();
			String sql="update yk_review set review_star=?, review_subject=?, review_content=?, review_imgname=? where review_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, rdto.getReview_star());
			ps.setString(2, rdto.getReview_subject());
			ps.setString(3, rdto.getReview_content());
			ps.setString(4, rdto.getReview_imgname());
			System.out.println("여기는 나와?");
			ps.setInt(5, rdto.getReview_idx());
			
			int count=ps.executeUpdate();
		
			return count;
		} catch (Exception e) {
			// TODO: handle exception
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
		
	}
	
	
	
	
	public ArrayList<reviewDTO> getAllreview(String how, int cp, int listsize){
		ArrayList<reviewDTO> arr=new ArrayList<reviewDTO>();
		try {
			conn=semidb.DB.getConn();
			//	String sql="select * from yk_review where review_ref=? order by "+how+" desc";
			String sql="select * from (select rownum as rnum, a.* from (select * from  yk_review order by "+how+" desc)a)b "+" where rnum>=? and rnum<=?";
			System.out.println("11111");
			ps=conn.prepareStatement(sql);
			int start=(cp-1)*listsize+1;
			int end= cp*listsize;
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs=ps.executeQuery();

			if(rs.next()) {
				do {
				int review_idx=rs.getInt("review_idx");
				int review_star=rs.getInt("review_star");
				String review_id=rs.getString("review_id");
				String review_subject=rs.getString("review_subject");
				String review_content=rs.getString("review_content");
				int review_like=rs.getInt("review_like");
				int review_ref=rs.getInt("review_ref");
				String review_imgname=rs.getString("review_imgname");
				int review_write_ref=rs.getInt("review_write_ref");
				String review_writedate=rs.getString("review_writedate");

				reviewDTO rd=new reviewDTO(review_idx, review_star, review_id, review_subject, review_content, review_like, review_ref, review_write_ref, review_imgname, review_writedate);
				arr.add(rd);
				}while(rs.next());
			}

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
		return arr;
	}
	
	
	public int getAllCnt() {

		try {
			conn=semidb.DB.getConn();
			String sql="select count(*) from yk_review";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery(); //파라미터는 무조건 데이터가 나오기에 
			rs.next();
			int count=rs.getInt(1);
			count=count==0?1:count;
			return count;
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
	
	
	
	
	

}