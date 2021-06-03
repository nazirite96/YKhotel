package member;

import java.sql.Connection;
import java.sql.*;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class YkMemberDAO {
	
	private Connection conn;
	private PreparedStatement ps;
	private ResultSet rs;
	
	//기본생성자
	public YkMemberDAO() {
		System.out.println("YkMemberDAO 생성자 호출스");
	}
	
	//회원가입 관련 메서드
	public int yk_memberJoin(YkMemberDTO dto) {
		try {
			conn=semidb.DB.getConn();
			String sql="insert into yk_member values(yk_member_idx.nextval,?,?,?,?,?,?,?,sysdate,0)";
			
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getPassword());
			ps.setString(3, dto.getName());
			ps.setString(4, dto.getSex());
			ps.setString(5, dto.getEmail());
			ps.setString(6, dto.getAddr());
			ps.setString(7, dto.getTel());
			
			int count = ps.executeUpdate();
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
	
	//아이디 중복검사 메서드
	
	public int yk_idCheck(YkMemberDTO dto) {
		int count=0;
		try {
			conn=semidb.DB.getConn();
			String sql="select * from yk_member where id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1,dto.getId());
			rs=ps.executeQuery();
			if(rs.next()) {
				count=1;
			}else {
				count=0;
			}
		}catch(Exception e) {
			e.printStackTrace();
				count=-1;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();
			}catch(Exception e) {
				
			}
		}
		return count;
	}
	//로그인  , 회원탈퇴시 비밀번호 확인 관련 메서드
	
	public int yk_login(String id,String password) {
		try {
			conn=semidb.DB.getConn();
			String sql="select password from yk_member where id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			rs=ps.executeQuery();
			if(rs.next()) {
				String password2=rs.getString(1);
				if(password2.equals(password)) {
					return 1;
				}else {
					return 2;
				}
			}else {
				return 3;
			}
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
	//내 정보 보기 관련 메서드
	public YkMemberDTO getUserInfo(String userid) {
		try {
			conn=semidb.DB.getConn();
			String sql="select * from yk_member where id=?";
			
			ps=conn.prepareStatement(sql);
			ps.setString(1, userid);
			rs=ps.executeQuery();
			YkMemberDTO dto=new YkMemberDTO();
			if(rs.next()) {
				int idx=rs.getInt("idx");
				String id=rs.getString("id");
				String password=rs.getString("password");
				String name=rs.getString("name");
				String sex=rs.getString("sex");
				String email=rs.getString("email");
				String addr=rs.getString("addr");
				String tel=rs.getString("tel");
				Date joindate=rs.getDate("joindate");
				int master=rs.getInt("master");
				dto=new YkMemberDTO(idx, id, password, name, sex, email, addr, tel, joindate, master);
				
			}
			return dto;
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
	
	//회원정보 수정 관련 메서드
	public int yk_myUpdate(YkMemberDTO dto) {
		try {
			conn=semidb.DB.getConn();
			String sql="update yk_member set name=?,email=?,addr=?,tel=? where id=?";
			System.out.println("ok");
			ps=conn.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getEmail());
			ps.setString(3, dto.getAddr());
			ps.setString(4, dto.getTel());
			ps.setString(5, dto.getId());
			int count = ps.executeUpdate();
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
	//회원탈퇴 관련 메서드
	public int yk_myDelete(String id,String password) {
		try {
			int count=0;
			conn=semidb.DB.getConn();
			String sql="delete from yk_member where id=? and password=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, password);
			count=ps.executeUpdate();
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
	//아이디 찾기 이름,이메일로 ID 가져오기
	public String yk_idFind(String name,String email) {
				try {
					
					String id="";
					conn=semidb.DB.getConn();
					String sql="select id from yk_member where name=? and email=?";
					ps=conn.prepareStatement(sql);
					ps.setString(1, name);
					ps.setString(2, email);
					rs=ps.executeQuery();
					if(rs.next()) {
						id=rs.getString(1);
					}
					return id;
					
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
	

	/**ID에 해당하는 유저 name 가져오기(추가한것)*/
	public String getUserNameInfo(String id) { 
		try {
			conn=semidb.DB.getConn();
			String sql ="select name from yk_member where id=?";		
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
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
	
	
	/**master인지 아닌지 판단 메서드(추가한것)*/
	public int getMasterInfo(String id) {//사용자가 쓰는 id를 받아옴
		try {
			conn=semidb.DB.getConn();
			String sql="select master from yk_member where id=?"; //id로 마스터 컬럼값 가져오기
			ps=conn.prepareStatement(sql);
			ps.setString(1, id); //사용자 id로 조회
			rs=ps.executeQuery();
			rs.next();
			return rs.getInt(1); //sql = select 한 첫번째 컬럼값 반환
			
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}finally {
			try {
				if(rs!=null)rs.close();
				if(ps!=null)ps.close();
				if(conn!=null)conn.close();	
			} catch (Exception e2) {

			}
		}
	}
	//비밀번호 찾기
	public int pwdFind(String id, String email) {
		try {
			int ran=0;
			conn=semidb.DB.getConn();
			String sql="select * from yk_member where id=? and email=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, id);
			ps.setString(2, email);
			rs=ps.executeQuery();
			if(rs.next()) {
				ran=(int)(Math.random()*8999)+1000;
				return ran;
			}else {
				return 0;
			}
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
	public int pwdUpdate(String id,String pwd) {
		try {
			conn=semidb.DB.getConn();
			String sql="update yk_member set password=? where id=?";
			ps=conn.prepareStatement(sql);
			ps.setString(1, pwd);
			ps.setString(2, id);
			int count = ps.executeUpdate();
			
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
