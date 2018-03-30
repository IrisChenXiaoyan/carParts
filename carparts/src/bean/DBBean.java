package bean;
import java.sql.*;

public class DBBean{
	private String driverStr="com.microsoft.sqlserver.jdbc.SQLServerDriver";
	private String connStr="jdbc:sqlserver://localhost:1433;databasename=CARPARTS";
	private String dbusername="sa";
	private String dbpassword="password";
	private Connection conn=null;
	private Statement stmt=null;
	public DBBean(){
		try{
			Class.forName(driverStr);
			conn=DriverManager.getConnection(connStr,dbusername,dbpassword);
			stmt=conn.createStatement();
		}
		catch(Exception ex){System.out.println("无法同数据库建立连接！");}
	}
	
	public int executeUpdate(String s){
		int result=0;
		try{result=stmt.executeUpdate(s);}
		catch(Exception ex){System.out.println("执行更新错误！");}
		return result;
	}
	
	public ResultSet executeQuery(String s){
		ResultSet rs=null;
		try{rs=stmt.executeQuery(s);}
		catch(Exception ex){System.out.println("执行查询错误！");}
		return rs;
	}
	
	public void close(){
		try{
			stmt.close();
			conn.close();
		}
		catch(Exception ex){}
	}
}
