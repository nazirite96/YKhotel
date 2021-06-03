package com;
import java.io.File;
import java.sql.*;
import java.sql.Date;
import java.util.*;
import com.*;


public class ComDAO {
	private Connection conn;
 	private PreparedStatement ps;
 	private ResultSet rs;
	
	
	
	public ComDAO() {
		// TODO Auto-generated constructor stub
	}
	
	
	/*ref 마지막값 추출관련 메서드*/
 	public int comgetMaxRef() {
 		
 		try {
			String sql="select max(com_ref) from yk_com";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			int max=0;
			if(rs.next()) {
				//max함수는  등록된데이터가 없으면 0조차도 안뜸. 그래서 if조건꼭 줘야함.
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
	
	
	
	
	
	
	/*댓글작성 메소드*/
	public int comWrite(ComDTO dto) {
		 
			try {
				
				conn=semidb.DB.getConn();
				int max=comgetMaxRef();
				String sql="insert into yk_com values(yk_com_idx.nextval,?,?,?,sysdate,0,?,0,0) ";
				ps=conn.prepareStatement(sql);
			
				ps.setInt(1, dto.getCom_bbs_idx());
				ps.setString(2, dto.getCom_id());
				ps.setString(3, dto.getCom_content());
				
				ps.setInt(4, max+1);
	
				int count=ps.executeUpdate();
				

			return count;
		
			}catch(Exception e) {
				e.printStackTrace();
				return -1;
			}finally {
				try {
					if(rs!=null) {rs.close();}
					if(ps!=null) {ps.close();}
					if(conn!=null) {conn.close();}
					
				}catch(Exception e2) {
					e2.printStackTrace();
				}
				
			}
			

		}
		
	
	
	
	
	/*대댓글작성 메소드*/
	public int comReWrite(ComDTO dto) {
		 
			try {
				
				conn=semidb.DB.getConn();
				String sql="insert into yk_com values(yk_com_idx.nextval,?,?,?,sysdate,0,?,?,?) ";
				ps=conn.prepareStatement(sql);
			
				ps.setInt(1, dto.getCom_bbs_idx());
				ps.setString(2, dto.getCom_id());
				ps.setString(3, dto.getCom_content());
				
				ps.setInt(4, dto.getCom_ref());
				ps.setInt(5, 1);  //lev 들여쓰기는 무조건 그냥 1 , 더하면 화면더러워짐
				ps.setInt(6, dto.getCom_sunbun()+1);
	
				int count=ps.executeUpdate();
				

			return count;
		
			}catch(Exception e) {
				e.printStackTrace();
				return -1;
			}finally {
				try {
					if(rs!=null) {rs.close();}
					if(ps!=null) {ps.close();}
					if(conn!=null) {conn.close();}
					
				}catch(Exception e2) {
					e2.printStackTrace();
				}
				
			}
			

		}
		
	
	
	
	/*부모댓글+대댓글 전부 삭제 메소드*/
	public int comAllDelete(int ref) {
		try {
					
			conn=semidb.DB.getConn();
			String sql="delete yk_com where com_ref=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, ref);
			int count=ps.executeUpdate();
			
		return count;
	
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				
				if(ps!=null) {ps.close();}
				if(conn!=null) {conn.close();}
				
			}catch(Exception e2) {
				e2.printStackTrace();
			}
			
		}
	
	}
	
	
	
	
	
	
	
	/*대댓글 삭제 메소드*/
	public int recomDelete(int idx) {
		try {
					
			conn=semidb.DB.getConn();
			String sql="delete yk_com where com_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			int count=ps.executeUpdate();
			
		return count;
	
		}catch(Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				
				if(ps!=null) {ps.close();}
				if(conn!=null) {conn.close();}
				
			}catch(Exception e2) {
				e2.printStackTrace();
			}
			
		}
	
	}
	
	
	
	
	
	
	
	
	
	
	
	/*댓글목록 가져오는 메소드*/
	public ArrayList<ComDTO> getcomList(int idx){
		
	       
		try {
			conn=semidb.DB.getConn();
	
			String sql=	"select * from yk_com where com_bbs_idx=? order by com_ref asc,com_writedate asc";
			
			//대댓글은 그냥 시간순으로 정렬해서 넣엇음
			
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			
			rs=ps.executeQuery();
			ArrayList<ComDTO> arr=new ArrayList<ComDTO>();
			while(rs.next()) {
				int com_idx=rs.getInt("com_idx");
				int com_bbs_idx=rs.getInt("com_bbs_idx");
				String com_id=rs.getString("com_id");
				String com_content=rs.getString("com_content");
				java.sql.Date com_writedate=rs.getDate("com_writedate");
				int com_likenum=rs.getInt("com_likenum");
				int com_ref=rs.getInt("com_ref");
				int com_lev=rs.getInt("com_lev");
				int com_sunbun=rs.getInt("com_sunbun");
				
				ComDTO dto=new ComDTO(com_idx, com_bbs_idx, com_id, com_content, com_writedate, com_likenum, com_ref, com_lev, com_sunbun);
				
				arr.add(dto);
			}
			
		return arr;	
		}catch(Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null) {rs.close();}
				if(ps!=null) {ps.close();}
				if(conn!=null) {conn.close();}
				
			}catch(Exception e2) {
				e2.printStackTrace();
			}
			
		}
		

	}

		
	
	/*총댓글 개수 가져오는 메소드*/
	public int getTotalcom(int idx) {
	try {
			
			conn=semidb.DB.getConn();
			String sql="select count(*) from yk_com where com_bbs_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs=ps.executeQuery();
			rs.next();
			int count=rs.getInt(1);
			return count;
			
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
			e2.printStackTrace();
			}
		}
	}
	
		
	
/*댓글고유번호idx로 모든정보 찾아오는 메서드*/
	public ComDTO getComInfo(int idx) {
		
	try {
			
			conn=semidb.DB.getConn();
			String sql="select * from yk_com where com_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			rs=ps.executeQuery();
			rs.next();
				int com_idx=rs.getInt("com_idx");
				int com_bbs_idx=rs.getInt("com_bbs_idx");
				String com_id=rs.getString("com_id");
				String com_content=rs.getString("com_content");
				java.sql.Date com_writedate=rs.getDate("com_writedate");
				int com_likenum=rs.getInt("com_likenum");
				int com_ref=rs.getInt("com_ref");
				int com_lev=rs.getInt("com_lev");
				int com_sunbun=rs.getInt("com_sunbun");
				
				ComDTO dto=new ComDTO(com_idx, com_bbs_idx, com_id, com_content, com_writedate, com_likenum, com_ref, com_lev, com_sunbun);
			
			return dto;
			
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
			e2.printStackTrace();
			}
		}
		
		
		
		
	}
	
	
	

}
