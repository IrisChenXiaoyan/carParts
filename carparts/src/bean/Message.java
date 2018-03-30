package bean;

import java.sql.*;
import java.util.*;

public class Message{
	private String id;
	private String msgsubject;
	private String msgcont;
	private String msgdate;
	private String msgpushto;
	private String msgstate;
	//为所有私有属性对外提供存取接口
	public String getId(){
		return id;
	}
	public void setId(String id){
		this.id=id;
	}
	public String getMsgsubject(){
		return msgsubject;
	}
	public void setMsgsubject(String msgsubject){
		this.msgsubject=msgsubject;
	}
	public String getMsgcont(){
		return msgcont;
	}
	public void setMsgcont(String msgcont){
		this.msgcont=msgcont;
	}
	public String getMsgdate(){
		return msgdate;
	}
	public void setMsgdate(String msgdate){
		this.msgdate=msgdate;
	}
	public String getMsgpushto(){
		return msgpushto;
	}
	public void setMsgpushto(String msgpushto){
		this.msgpushto=msgpushto;
	}
	public String getMsgstate(){
		return msgstate;
	}
	public void setMsgstate(String msgstate){
		this.msgstate=msgstate;
	}
	//返回所有信息的方法
	public static ArrayList<Message> getMessageList(){
		ArrayList<Message> list=new ArrayList<Message>();
		String sql="select * from message";
		DBBean jdbc=new DBBean();
		ResultSet rs=jdbc.executeQuery(sql);
		try{
			while(rs.next()){
				Message fi=new Message();
				fi.setId(rs.getString(1));
				fi.setMsgsubject(rs.getString(2));
				fi.setMsgcont(rs.getString(3));
				fi.setMsgpushto(rs.getString(4));
				fi.setMsgstate(rs.getString(5));
				fi.setMsgdate(rs.getString(6));
				list.add(fi);
			}
			rs.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		jdbc.close();
		return list;
	}
	//返回某仓库信息的方法
		public static ArrayList<Message> getWarehouseMessageList(int msgpushto){
			ArrayList<Message> list=new ArrayList<Message>();
			String sql="select * from message where MSGPUSHTO='"+msgpushto+"'";
			DBBean jdbc=new DBBean();
			ResultSet rs=jdbc.executeQuery(sql);
			try{
				while(rs.next()){
					Message fi=new Message();
					fi.setId(rs.getString(1));
					fi.setMsgsubject(rs.getString(2));
					fi.setMsgcont(rs.getString(3));
					fi.setMsgpushto(rs.getString(4));
					fi.setMsgstate(rs.getString(5));
					fi.setMsgdate(rs.getString(6));
					list.add(fi);
				}
				rs.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
			jdbc.close();
			return list;
		}
	//返回仓库一未读消息数量的方法
	public static int getHaveRead1(){
		ArrayList<Message> list= getMessageList();
		int i=0;
		for(Message fi:list){
			if(fi.getMsgstate().equals("0")&&fi.getMsgpushto().equals("2")) i++;
		}
		return i;
	}
	//返回仓库二未读消息数量的方法
		public static int getHaveRead2(){
			ArrayList<Message> list= getMessageList();
			int i=0;
			for(Message fi:list){
				if(fi.getMsgstate().equals("0")&&fi.getMsgpushto().equals("3")) i++;
			}
			return i;
		}
}