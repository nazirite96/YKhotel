package qna;

import java.sql.*;
import java.util.*;

public class QnaDAO {

	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	/**ref 마지막값 추출관련 메서드*/
	public int getMaxRef() {
		try {
			String sql="select max(qna_ref) from yk_qna where qna_ref < 9999"; //Q&A ref max값 뽑기
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			int max=0; // max를 0초기화 시켜줌
			if(rs.next()) {
				max=rs.getInt(1); //sql문 첫번째 컬럼 qna_ref의 값을 max에 넣어줌
			}
			return max; // max를 돌려줌
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
			} catch (Exception e2) {

			}
		}
	}
	
	/**ref 마지막값 추출관련 메서드*/
	public int getMasterMaxRef() {
		try {
			String sql="select max(qna_ref) from yk_qna"; //Q&A ref max값 뽑기
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			int max2=0; // max를 0초기화 시켜줌
			if(rs.next()) {
				max2=rs.getInt(1); //sql문 첫번째 컬럼 qna_ref의 값을 max에 넣어줌
			}
			return max2; // max를 돌려줌
		} catch (Exception e) {
			e.printStackTrace();
			return 0;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
			} catch (Exception e2) {

			}
		}
	}
	
	/**글쓰기 관련 메서드*/
	public int qnaWrite(QnaDTO dto) {
		try {
			conn=semidb.DB.getConn();
			int max=getMaxRef(); //ref값 메서드 가져옴(글쓰기를 했을때 ref값을 넣기위함)
			String sql="insert into yk_qna values(yk_qna_idx.nextval,?,?,?,sysdate,0,?,0,0)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getQna_id());  //Q&A관련 id
			System.out.println(dto.getQna_id());
			ps.setString(2, dto.getQna_subject()); //Q&A관련 제목
			System.out.println(dto.getQna_subject());
			ps.setString(3, dto.getQna_content()); //Q&A관련 글내용
			System.out.println(dto.getQna_content());
			ps.setInt(4, max+1); //Q&A관련 ref를 1씩 카운트해주기
			System.out.println(max);
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {

			}
			
		}
		
	}
	
	/**공지사항 쓰기 관련 메서드*/
	public int qnaMasterWrite(QnaDTO dto) {
		try {
			conn=semidb.DB.getConn();
			int max2=getMaxRef(); //ref값 메서드 가져옴(글쓰기를 했을때 ref값을 넣기위함)
			setMasterSunUpdate();
			String sql="insert into yk_qna values(yk_qna_idx.nextval,?,?,?,sysdate,0,?,0,0)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getQna_id());  //Q&A관련 id
			ps.setString(2, dto.getQna_subject()); //Q&A관련 제목
			ps.setString(3, dto.getQna_content()); //Q&A관련 글내용
			ps.setInt(4, 9999); //Q&A관련 공지사항 ref를  카운트해주기
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				
			} catch (Exception e2) {

			}
		}
	}
	/** 공지사항 순서 업데이트 관련 메서드*/
	public void setMasterSunUpdate() {
		try {
			String sql = "update yk_qna set qna_sunbun=qna_sunbun+1 where qna_ref=9999";
			ps=conn.prepareStatement(sql);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			try {
				if(ps!=null)ps.close();
			} catch (Exception e2) {

			}
		}
	}
	/**순서 업데이트 관련 메서드*/
	public void setSunUpdate(int qna_ref,int qna_sunbun) {
		try {
			String sql = "update yk_qna set qna_sunbun=qna_sunbun+1 where qna_ref=? and qna_sunbun>=?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, qna_ref);
			ps.setInt(2, qna_sunbun);
			ps.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
			
		}finally {
			try {
				if(ps!=null)ps.close();
			} catch (Exception e2) {

			}
		}
	}
	
	/**답변글쓰기 관련메서드*/
	public int qnaReWrite(QnaDTO dto) {
		try {
			conn=semidb.DB.getConn();
			setSunUpdate(dto.getQna_ref(),dto.getQna_sunbun()+1);
			String sql="insert into yk_qna values(yk_qna_idx.nextval,?,?,?,sysdate,0,?,?,?)";
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getQna_id());
			ps.setString(2, dto.getQna_subject());
			ps.setString(3, dto.getQna_content());
			ps.setInt(4, dto.getQna_ref());
			ps.setInt(5, dto.getQna_lev()+1);
			ps.setInt(6, dto.getQna_sunbun()+1);
			int count = ps.executeUpdate();
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {

			}
			
		}
	}
	
	/**총 게시물수 관련 메서드*/
	public int getTotalCnt(){
		try {
			conn=semidb.DB.getConn();
			String sql="select count(*) from yk_qna";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			
			rs.next();
			int count = rs.getInt(1);
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

			}
		}
	}
	
	/**목록보기 관련 메서드*/
	public ArrayList<QnaDTO> qnaList(int cp,int ls, String keyWord, String searchWord){
		try {
			conn=semidb.DB.getConn();
			String sql = null; 
			System.out.println(keyWord);
			System.out.println(searchWord);
			
			if(keyWord==null) {
				sql = "select * from (select rownum as rnum,a.* from "
						+ "(select * from yk_qna  order by qna_ref desc, qna_sunbun asc) a) "
						+ "b where rnum >=? and rnum <=?"; 
				ps=conn.prepareStatement(sql);
				int start=(cp-1)*ls+1; //시작값
				int end=cp*ls;
				ps.setInt(1, start);
				ps.setInt(2, end);
			}else if(keyWord.equals("qna_subject")) {
				sql = "select * from yk_qna where qna_subject like '%"+searchWord+"%' order by qna_ref desc";
				ps=conn.prepareStatement(sql);
			}else if(keyWord.equals("qna_content")) {
				sql = "select * from yk_qna where qna_content like '%"+searchWord+"%' order by qna_ref desc";
				ps=conn.prepareStatement(sql);
			}else if(keyWord.equals("qna_id")) {
				sql = "select * from yk_qna where qna_id like '%"+searchWord+"%' order by qna_ref desc";
				ps=conn.prepareStatement(sql);
				
			}
			rs=ps.executeQuery();
			ArrayList<QnaDTO> arr = new ArrayList<QnaDTO>();
			while(rs.next()) {
				int qna_idx = rs.getInt("qna_idx");
				String qna_id = rs.getString("qna_id");
				String qna_subject = rs.getString("qna_subject");
				String qna_content=rs.getString("qna_content");
				java.sql.Date qna_writedate = rs.getDate("qna_writedate");
				int qna_readnum = rs.getInt("qna_readnum");
				int qna_ref = rs.getInt("qna_ref");
				int qna_lev=rs.getInt("qna_lev");
				int qna_sunbun=rs.getInt("qna_sunbun");
				
				QnaDTO dto = new QnaDTO(qna_idx, qna_id, qna_subject, qna_content, qna_writedate, qna_readnum, qna_ref, qna_lev, qna_sunbun);
				arr.add(dto);
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

			}
		}
	}
	
	/**공지사항 목록보기*/
	public ArrayList<QnaDTO> qnaNoticeList(){
		try {
			conn=semidb.DB.getConn();
			String sql = "select * from yk_qna where qna_ref = 9999 order by qna_sunbun asc";
			ps=conn.prepareStatement(sql);
			rs=ps.executeQuery();
			ArrayList<QnaDTO> arr2 = new ArrayList<QnaDTO>();
			while(rs.next()) {
				int qna_idx = rs.getInt("qna_idx");
				String qna_id = rs.getString("qna_id");
				String qna_subject = rs.getString("qna_subject");
				String qna_content=rs.getString("qna_content");
				java.sql.Date qna_writedate = rs.getDate("qna_writedate");
				int qna_readnum = rs.getInt("qna_readnum");
				int qna_ref = rs.getInt("qna_ref");
				int qna_lev=rs.getInt("qna_lev");
				int qna_sunbun=rs.getInt("qna_sunbun");
				
				QnaDTO dto = new QnaDTO(qna_idx, qna_id, qna_subject, qna_content, qna_writedate, qna_readnum, qna_ref, qna_lev, qna_sunbun);
				arr2.add(dto);
			}
			return arr2;
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
	
	/**본문관련 메서드*/
	public QnaDTO getQnaContent(int qna_idx) {
		try {
			conn=semidb.DB.getConn();
			String sql ="select * from yk_qna where qna_idx =?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, qna_idx);
			rs=ps.executeQuery();
			System.out.println(qna_idx);
			
			QnaDTO dto = null;
			if(rs.next()) {
				sql = "update yk_qna set qna_readnum = qna_readnum+1 where qna_idx =?";
				ps=conn.prepareStatement(sql);
				ps.setInt(1, qna_idx);
				int count = ps.executeUpdate();
				
				String qna_id = rs.getString("qna_id");
				String qna_subject = rs.getString("qna_subject");
				String qna_content = rs.getString("qna_Content");
				java.sql.Date qna_writedate = rs.getDate("qna_writedate");
				int qna_readnum = rs.getInt("qna_readnum")+1;
				int qna_ref = rs.getInt("qna_ref");
				int qna_lev = rs.getInt("qna_lev");
				int qna_sunbun = rs.getInt("qna_sunbun");
				dto=new QnaDTO(qna_idx, qna_id, qna_subject, qna_content, qna_writedate, qna_readnum, qna_ref, qna_lev, qna_sunbun);
			}
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

			}
		}
	}
	
	/**게시물 삭제 관련 메서드*/
	public int getDelQna(int qna_idx) {
		try {
			conn=semidb.DB.getConn();
			
			String sql = "delete from yk_qna where qna_idx =?";
			ps=conn.prepareStatement(sql);
			ps.setInt(1, qna_idx);
			int count = ps.executeUpdate();
			
			return count;
			
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {

			}
		}
	}
	
	/*부모게시글+자식게시글 관련 삭제 메소드*/
	public int qnaAllDelete(int ref) {
		try {
			conn=semidb.DB.getConn();

			String sql="delete yk_qna where qna_ref=?";
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

			}
			
		}
	
	}
	
	/**게시물 수정 관련 메서드*/
	public QnaDTO getUpdateQna(QnaDTO dto) {
		try {
			conn=semidb.DB.getConn();
			String sql="select * from yk_qna where qna_idx = ?";
			ps = conn.prepareStatement(sql);
			ps.setInt(1, dto.getQna_idx());
			rs=ps.executeQuery();
		
			QnaDTO rs_dto = new QnaDTO();
			
			if(rs.next()) {
				rs_dto.setQna_idx(rs.getInt("qna_idx"));
				rs_dto.setQna_id(rs.getNString("qna_id"));
				rs_dto.setQna_writedate(rs.getDate("qna_writedate"));
				rs_dto.setQna_readnum(rs.getInt("qna_readnum"));
				rs_dto.setQna_subject(rs.getString("qna_subject"));
				rs_dto.setQna_content(rs.getString("qna_content"));
				
			}
			
			return rs_dto;
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
	
	/**게시물 수정 관련 메서드2*/
	public int getUpdateQna2(QnaDTO dto) {
		try {
			conn=semidb.DB.getConn();
			String sql = "update yk_qna set qna_subject=?,qna_content =? where qna_idx =?";
			ps = conn.prepareStatement(sql);
			ps.setString(1, dto.getQna_subject());
			ps.setString(2, dto.getQna_content());
			ps.setInt(3, dto.getQna_idx());
			int count = ps.executeUpdate();
			
			return count;
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			} catch (Exception e2) {

			}
		}
	}
	
	/**사용자 정보 추출 관련 메서드(로그인 한사람 이름 가져오기)*/
	public String getUserinfo(String qna_id) {
		try {
			conn=semidb.DB.getConn();
			String sql = "select name from yk_qna where qna_idx =?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, qna_id);
			rs=ps.executeQuery();
			rs.next();
			return rs.getString(1);
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
	
	
	
}
