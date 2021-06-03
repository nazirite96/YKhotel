package master;
import java.sql.*;
import java.util.ArrayList;


public class MasterDAO {
	private Connection conn;
 	private PreparedStatement ps;
 	private ResultSet rs;
 	
 	public MasterDAO() {
		// TODO Auto-generated constructor stub
	}
 	
 	/*ref 마지막 값 추출하는 메서드 */
 	public int getMaxRef() {
 		try {
 			conn=semidb.DB.getConn();
 			String sql="select max(master_ref) from yk_master";
 			
 			ps=conn.prepareStatement(sql);
 			rs=ps.executeQuery();
 			int max=0;
 			if(rs.next()) {
 				max=rs.getInt(1);
 			}
 			return max;
 		}catch(Exception e){
 			e.printStackTrace();
 			return -1;
 		}finally {
 			try {
 				if(rs!=null)rs.close();
 				if(ps!=null)ps.close();
 			}catch(Exception e) {
 				
 			}
 		}
 	}
 	
 	/**간단게시물 등록하는 메서드*/
 	public int easyWrite(MasterDTO dto) {
 		try {
 			conn=semidb.DB.getConn();
 			int max=getMaxRef();
 			String sql="insert into yk_master values(yk_master_idx.nextval,?,?,sysdate,?,0,0)";
 			ps=conn.prepareStatement(sql);
 			ps.setString(1, dto.getMaster_id());
 			ps.setString(2, dto.getMaster_content());
 			ps.setInt(3, max+1);//등록할 때마다 ref 증가시켜준다
 			int count=ps.executeUpdate();
 			return count;
 		}catch(Exception e) {
 			e.printStackTrace();
 			return -1;
 		}finally {
 			try {
 				if(ps!=null)ps.close();
 				if(conn!=null)conn.close();
 			}catch(Exception e) {
 				
 			}
 		}
 	}
 	/*총게시물 수 보기 메서드*/
 	public int getTotalCnt() {
 		try {
 			conn=semidb.DB.getConn();
 			String sql="select count(*) from yk_master";
 			ps=conn.prepareStatement(sql);
 			rs=ps.executeQuery();
 			
 			rs.next();
 			int count=rs.getInt(1);
 			count=count==0?1:count;
 			return count;
 		}catch(Exception e) {
 			e.printStackTrace();
 			return -1;
 		}finally {
 			try {
 				if(rs!=null)rs.close();
 				if(ps!=null)ps.close();
 				if(conn!=null)conn.close();
 			}catch(Exception e) {
 				
 			}
 		}
 	}
 	/*마스터 메모 목록 보기 메서드*/
 	public ArrayList<MasterDTO> memoList(int cp,int ls){
 		try {
 			conn=semidb.DB.getConn();
 			String sql="select * from (select rownum as rnum,a.* from "
 					+ "(select * from yk_master order by master_ref desc, master_sunbun asc) a) "
 					+ "b where rnum >=? and rnum <=?";
 			ps=conn.prepareStatement(sql);
 			int start=(cp-1)*ls+1; // 이것은 시작값
 			int end=cp*ls; //끝 값
 			ps.setInt(1, start);
 			ps.setInt(2, end);
 			rs=ps.executeQuery();
 			ArrayList<MasterDTO> arr=new ArrayList<MasterDTO>();
 			while(rs.next()) {
 				int master_idx=rs.getInt("master_idx");
 				String master_id=rs.getString("master_id");
 				String master_content=rs.getString("master_content");
 				java.sql.Date master_writedate=rs.getDate("master_writedate");
 				int master_ref=rs.getInt("master_ref");
 				int master_lev=rs.getInt("master_lev");
 				int master_sunbun=rs.getInt("master_sunbun");
 				
 				MasterDTO dto = new MasterDTO(master_idx, master_id, master_content, master_writedate, master_ref, master_lev, master_sunbun);
 				arr.add(dto);
 			}
 			return arr;
 			
 		}catch(Exception e) {
 			e.printStackTrace();
 			return null;
 		}finally {
 			try {
 				if(rs!=null)rs.close();
 				if(ps!=null)ps.close();
 				if(conn!=null)conn.close(); 				
 			}catch(Exception e) {
 				
 			}
 		}
 	}
 	/*마스터 글 순번 적어서 지우기*/
 	public int masterDelete(int idx) {
 		try {
 			conn=semidb.DB.getConn();
 			String sql="delete from yk_master where master_idx=?";
 			
 			ps=conn.prepareStatement(sql);
 			ps.setInt(1, idx);
 			int count=ps.executeUpdate();
 			return count;
 		}catch(Exception e) {
 			e.printStackTrace();
 			return -1;
 		}finally {
 			try {
 				if(ps!=null)ps.close();
 				if(conn!=null)conn.close();
 			}catch(Exception e) {
 				
 			}
 		}
 	}
 	/*마스터 글 전부 지우기 메서드*/
 	public int masterDeleteAll(MasterDTO dto) {
 		try {
 			conn=semidb.DB.getConn();
 			String sql="delete from yk_master";
 			ps=conn.prepareStatement(sql);
 			int count=ps.executeUpdate();
 			return count;
 		}catch(Exception e) {
 			e.printStackTrace();
 			return -1;
 		}finally {
 			try {
 				if(ps!=null)ps.close();
 				if(conn!=null)conn.close();
 			}catch(Exception e) {
 				
 			}
 		}
 	}
}
