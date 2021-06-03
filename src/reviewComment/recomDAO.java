package reviewComment;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import oracle.net.aso.f;

public class recomDAO {
	Connection conn;
	PreparedStatement ps;
	ResultSet rs;

	public recomDAO() {
		// TODO Auto-generated constructor stub
	}


	public int postContent(recomDTO dto) {

		try {
			conn=semidb.DB.getConn();
			String sql="insert into yk_review_comment values(yk_review_comment_idx.nextval,?,?,?,sysdate,?,0,0)";
			int max=getMaxRef();
			ps=conn.prepareStatement(sql);
			ps.setInt(1, dto.getRecom_review_idx());
			System.out.println(dto.getRecom_review_idx());
			ps.setString(2, dto.getRecom_id());
			ps.setString(3, dto.getRecom_content());
			ps.setInt(4, max+1);
			int count=ps.executeUpdate();
			return count;
		} catch (Exception e) {
			return -1;
		}finally {
			try {

			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
	public int getMaxRef() {
		try {
			String sql="select max(recom_ref) from yk_review_comment";
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
				e2.printStackTrace();
			}	
		}

	}

	public ArrayList<recomDTO> listcomment(int review_idx){
		ArrayList<recomDTO> arr=new ArrayList<recomDTO>(); 
		try {
			conn=semidb.DB.getConn();
			String sql=	"select * from yk_review_comment where recom_review_idx=? order by recom_ref asc,recom_sunbun asc";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, review_idx);
			rs=ps.executeQuery();
			while(rs.next()) {

				int recom_idx=rs.getInt("recom_idx");
				int recom_review_idx=rs.getInt("recom_review_idx");
				String recom_id=rs.getString("recom_id");
				String recom_content=rs.getString("recom_content");
				String recom_writedate=rs.getString("recom_writedate");
				int recom_ref=rs.getInt("recom_ref");
				int recom_lev=rs.getInt("recom_lev");
				int recom_sunbun=rs.getInt("recom_sunbun");
				recomDTO rt=new recomDTO(recom_idx, recom_review_idx, recom_id, recom_content, recom_writedate, recom_ref, recom_lev, recom_sunbun);
				arr.add(rt);
			}
			return arr;
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();

			}catch(Exception e2) {
				e2.printStackTrace();
			}

		}
	}
	public int recontent(recomDTO dto) {

		try {

			conn=semidb.DB.getConn();
			String sql="insert into yk_review_comment values(yk_review_comment_idx.nextval,?,?,?,sysdate,?,1,?)";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, dto.getRecom_review_idx());
			ps.setString(2, dto.getRecom_id());
			ps.setString(3, dto.getRecom_content());
			ps.setInt(4, dto.getRecom_ref());
			ps.setInt(5, dto.getRecom_sunbun()+1);
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();

			}catch(Exception e2) {
				e2.printStackTrace();
			}

		}
	}

	public int delcomment(int idx) {
		try {

			conn=semidb.DB.getConn();
			String sql="delete from yk_review_comment where recom_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			int count=ps.executeUpdate();
			return count;
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();

			}catch(Exception e2) {
				e2.printStackTrace();
			}

		}
	}
	
	public int countComment(int idx) {
		try {
			conn=semidb.DB.getConn();
			String sql="select count(*) from yk_review_comment where recom_review_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs=ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			return count;
		} catch (Exception e) {
			// TODO: handle exception
			return -1;
		}finally {
			try {
				if(rs!=null) rs.close();
				if(ps!=null) ps.close();
				if(conn!=null) conn.close();
			} catch (Exception e2) {
				// TODO: handle exception
			}
		}
	}
}