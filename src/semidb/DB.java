package semidb;
import java.sql.*;
import javax.sql.DataSource;
import javax.naming.Context;
import javax.naming.InitialContext;



public class DB {

private static DataSource ds;
	
	static {
		try {
		Context initContext = new InitialContext();
		Context envContext  = (Context)initContext.lookup("java:/comp/env");
		 ds = (DataSource)envContext.lookup("jdbc/myoracle");
		}catch(Exception e) {
			e.printStackTrace();
		}
	
	}
	
	
	public static Connection getConn() throws Exception{
		
		return ds.getConnection();
	}
	
	
	
	

	
	
	
	
}
