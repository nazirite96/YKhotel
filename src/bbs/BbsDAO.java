package bbs;
import java.sql.*;
import java.util.*;
import bbs.*;
import java.io.*;

public class BbsDAO {
	private Connection conn;
 	private PreparedStatement ps;
 	private ResultSet rs;
	
	
	public BbsDAO() {
		
	}
	
	
	/*검색해서 찾기 메서드*/
	public ArrayList<BbsDTO> findMatching(int cp,int listSize,String sel,String tf){
		
	       
				try {
					conn=semidb.DB.getConn();
			
					String sql=	"select * from ( select rownum as rnum,a.* from ( select * from yk_bbs where "+sel+" like '%"+tf+"%' order by bbs_ref desc,bbs_sunbun asc ) a ) b where rnum>=? and rnum<=?";
					
					ps=conn.prepareStatement(sql);
		
					int start=(cp-1)*listSize+1;
					int end=cp*listSize;
					
					ps.setInt(1, start);
					ps.setInt(2, end);
			
			
				rs=ps.executeQuery();
				ArrayList<BbsDTO> arr=new ArrayList<BbsDTO>();
				while(rs.next()) {
					int bbs_idx=rs.getInt("bbs_idx");
					String bbs_id=rs.getString("bbs_id");
					String bbs_subject=rs.getString("bbs_subject");
					String bbs_content=rs.getString("bbs_content");
					java.sql.Date bbs_writedate=rs.getDate("bbs_writedate");
					int bbs_readnum=rs.getInt("bbs_readnum");
					int bbs_likenum=rs.getInt("bbs_likenum");
					int bbs_ref=rs.getInt("bbs_ref");
					int bbs_lev=rs.getInt("bbs_lev");
					int bbs_sunbun=rs.getInt("bbs_sunbun");
					String bbs_imgname=rs.getString("bbs_imgname");
					
					BbsDTO dto=new BbsDTO(bbs_idx, bbs_id, bbs_subject, bbs_content, bbs_writedate, bbs_readnum, bbs_likenum, bbs_ref, bbs_lev, bbs_sunbun, bbs_imgname);
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
	
	
	
	
	
	/*ref 마지막값 추출관련 메서드*/
 	public int getMaxRef() {
 		
 		try {
			String sql="select max(bbs_ref) from yk_bbs";
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
	
	
	
	
	
	/*글쓰기 메서드*/
	public int bbsWrite(BbsDTO dto, String sid) {
		try {
			
			conn=semidb.DB.getConn();
			int max=getMaxRef();
			String sql="insert into yk_bbs values(yk_bbs_idx.nextval,?,?,?,sysdate," + 
					"0,0,?,0,0,?) ";
			ps=conn.prepareStatement(sql);
			ps.setString(1, sid);
			ps.setString(2, dto.getBbs_subject());
			ps.setString(3, dto.getBbs_content());
		
			ps.setInt(4, max+1);
			ps.setString(5,dto.getBbs_imgname());
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
	
	
	/*순번 업데이트 관련 메서드*/
	public void setSunbunUpdate(int ref,int sunbun) {
		try {
			String sql="Update yk_bbs set bbs_sunbun=bbs_sunbun+1 where bbs_ref=? and bbs_sunbun>=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, ref);
			ps.setInt(2, sunbun);
			ps.executeUpdate();
		} catch (Exception e) {
		e.printStackTrace();
		}finally {
			try {
				if(ps!=null)ps.close();
				
			} catch (Exception e2) {
			e2.printStackTrace();
			}
		}
	}
	
	
	
	
	
	
	/*답변글쓰기 관련메서드*/
	public int bbsReWrite(BbsDTO dto) {
		try {
			
			conn=semidb.DB.getConn();
			setSunbunUpdate(dto.getBbs_ref(), dto.getBbs_sunbun()+1);
			//3번째규칙 : 순번은 무조건 1이상이있을경우(답글이하나이상잇을시) 바뀌는거니까
			String sql="insert into yk_bbs values(yk_bbs_idx.nextval,?,?,?,sysdate,0,0,?,?,?,?) ";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getBbs_id());
			ps.setString(2, dto.getBbs_subject());
			ps.setString(3, dto.getBbs_content());
			
			ps.setInt(4, dto.getBbs_ref());
			ps.setInt(5, dto.getBbs_lev()+1);
			ps.setInt(6, dto.getBbs_sunbun()+1);
			ps.setString(7, dto.getBbs_imgname());
			
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
	
	
	
	
	
	
	
	
	
	/*idx값으로 글정보 가져오는 메소드+ 동시에 조회수 증가*/
	public BbsDTO bbsContent(int idx) {
		
		try {
		
			conn=semidb.DB.getConn();
			
			//조회수증가부분추가
			String sql2="update yk_bbs set bbs_readnum=bbs_readnum+1 where bbs_idx=?";
			ps=conn.prepareStatement(sql2);
			ps.setInt(1,idx);
			ps.executeUpdate();
		
			String sql="select * from yk_bbs where bbs_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1,idx);
			rs=ps.executeQuery();
			
			BbsDTO dto=new BbsDTO();
			if(rs.next()) {
				
			dto.setBbs_idx(rs.getInt("bbs_idx"));
			dto.setBbs_id(rs.getString("bbs_id"));			
			dto.setBbs_subject(rs.getString("bbs_subject"));
			dto.setBbs_content(rs.getString("bbs_content"));
			dto.setBbs_writedate(rs.getDate("bbs_writedate"));
			dto.setBbs_readnum(rs.getInt("bbs_readnum"));
			dto.setBbs_likenum(rs.getInt("bbs_likenum"));		
			dto.setBbs_ref(rs.getInt("bbs_ref"));
			dto.setBbs_lev(rs.getInt("bbs_lev"));
			dto.setBbs_sunbun(rs.getInt("bbs_sunbun"));
			dto.setBbs_imgname(rs.getString("bbs_imgname"));
						
			}

		return dto;
	
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
	
	
	
	
	
	/*페이지총갯수*/
	public int getTotalcount() {
		
		try {
			
			conn=semidb.DB.getConn();
			String sql="select count(*) from yk_bbs";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
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
			e2.printStackTrace();
			}
		}
	}
	
	

 	
 	
	
	/*게시판글목록 가져오는 메소드*/
	public ArrayList<BbsDTO> getbbsList(int cp,int listSize){
		
	       
		try {
			conn=semidb.DB.getConn();
	
			String sql=	"select * from (select rownum as rnum,a.* from "
					+ "(select * from yk_bbs order by bbs_ref desc,bbs_sunbun asc)a)b "
					+ "where rnum>=? and rnum<=?";
			
			//쿼리에는 계산이 있으면 안됨. 다 계산해서 넣어야함.
			ps=conn.prepareStatement(sql);
			
			int start=(cp-1)*listSize+1;
			int end=cp*listSize;
			
			ps.setInt(1, start);
			ps.setInt(2, end);
			rs=ps.executeQuery();
			ArrayList<BbsDTO> arr=new ArrayList<BbsDTO>();
			while(rs.next()) {
				int bbs_idx=rs.getInt("bbs_idx");
				String bbs_id=rs.getString("bbs_id");
				String bbs_subject=rs.getString("bbs_subject");
				String bbs_content=rs.getString("bbs_content");
				java.sql.Date bbs_writedate=rs.getDate("bbs_writedate");
				int bbs_readnum=rs.getInt("bbs_readnum");
				int bbs_likenum=rs.getInt("bbs_likenum");
				int bbs_ref=rs.getInt("bbs_ref");
				int bbs_lev=rs.getInt("bbs_lev");
				int bbs_sunbun=rs.getInt("bbs_sunbun");
				String bbs_imgname=rs.getString("bbs_imgname");
				
				BbsDTO dto=new BbsDTO(bbs_idx, bbs_id, bbs_subject, bbs_content, bbs_writedate, bbs_readnum, bbs_likenum, bbs_ref, bbs_lev, bbs_sunbun, bbs_imgname);
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

	
	
	
	/*게시글 삭제*/
	public int bbsDelete(String imgname,int idx) {
		try {
			
			//기존파일 지우기	
			System.out.println("이미지네임?"+imgname);
			String filepath=
					"C:/sooyeon/yk/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/semi/upload/"+imgname;
			System.out.println(filepath);
			File f=new File(filepath);
			if(f.isFile()){
				f.delete();
			}

			
			
			conn=semidb.DB.getConn();
			String sql="delete yk_bbs where bbs_idx=?";
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
	
	
	
	
	

	/*글 수정하기  메서드*/
	public int bbsUpdate(BbsDTO dto) {
		try {
			
			conn=semidb.DB.getConn();
			String sql="update yk_bbs set bbs_subject=? ,bbs_content=? ,bbs_imgname=? where bbs_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getBbs_subject());
			ps.setString(2, dto.getBbs_content());
			ps.setString(3, dto.getBbs_imgname());
			ps.setInt(4, dto.getBbs_idx());
			
		
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
	
	
	
	
	/*파일 리셋시키기-수정화면*/
	public int resetFile(String imgname,int idx) {
	try {
			
	//기존파일 지우기	
		System.out.println("이미지네임?"+imgname);
		String filepath=
				"C:/sooyeon/yk/.metadata/.plugins/org.eclipse.wst.server.core/tmp0/wtpwebapps/semi/upload/"+imgname;
		System.out.println(filepath);
		File f=new File(filepath);
		if(f.isFile()){
			f.delete();
		}
		
			
		
			conn=semidb.DB.getConn();
			String sql="update yk_bbs set bbs_imgname='nono' where bbs_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			
		 int count= ps.executeUpdate();
	
	 
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
	
	
	
	/*게시글좋아요 올리기 메소드*/
	public int bbsLikePlus(int idx) {
		
		try {
			conn=semidb.DB.getConn();
			String sql="Update yk_bbs set bbs_likenum=bbs_likenum+1 where bbs_idx=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, idx);
			int count=ps.executeUpdate();
			
			return count;
		} catch (Exception e) {
		e.printStackTrace();
		return 0;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {
			e2.printStackTrace();
			}
		}
	
	}
	
	
	
	/*게시판에 올라온 이미지 목록 출력하는 메소드*/
	public ArrayList<BbsDTO> getbbsImgList(int imgCnt){
		       
		try {
			conn=semidb.DB.getConn();
	
			String sql=	"select * from " + 
					"(select * from yk_bbs where not bbs_imgname='nono' order by bbs_writedate desc)a " + 
					"where rownum<?";
			
			//쿼리에는 계산이 있으면 안됨. 다 계산해서 넣어야함.
			ps=conn.prepareStatement(sql);
			
			
			ps.setInt(1, imgCnt+1);
			rs=ps.executeQuery();
			ArrayList<BbsDTO> arr=new ArrayList<BbsDTO>();
			while(rs.next()) {
				int bbs_idx=rs.getInt("bbs_idx");
				String bbs_id=rs.getString("bbs_id");
				String bbs_subject=rs.getString("bbs_subject");
				String bbs_content=rs.getString("bbs_content");
				java.sql.Date bbs_writedate=rs.getDate("bbs_writedate");
				int bbs_readnum=rs.getInt("bbs_readnum");
				int bbs_likenum=rs.getInt("bbs_likenum");
				int bbs_ref=rs.getInt("bbs_ref");
				int bbs_lev=rs.getInt("bbs_lev");
				int bbs_sunbun=rs.getInt("bbs_sunbun");
				String bbs_imgname=rs.getString("bbs_imgname");
				
				BbsDTO dto=new BbsDTO(bbs_idx, bbs_id, bbs_subject, bbs_content, bbs_writedate, bbs_readnum, bbs_likenum, bbs_ref, bbs_lev, bbs_sunbun, bbs_imgname);
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

	
	
	
	
	
	
	
}
