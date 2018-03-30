package bean;

import java.sql.*;
import java.util.*;

public class CarPartsInfo{
	private int id;
	private String partsname;
	private int partsnum;
	private String partsunit;
	private String putawaydate;
	private float partsprice;
	private String manufactuper;
	private String productiondate;
	private String location;
	//为所有私有属性对外提供存取接口
	public int getId(){
		return id;
	}
	public void setId(int id){
		this.id=id;
	}
	public String getPartsname(){
		return partsname;
	}
	public void setPartsname(String partsname){
		this.partsname=partsname;
	}
	public int getPartsnum(){
		return partsnum;
	}
	public void setPartsnum(int partsnum){
		this.partsnum=partsnum;
	}
	public String getPartsunit(){
		return partsunit;
	}
	public void setPartsunit(String partsunit){
		this.partsunit=partsunit;
	}
	public String getPutawaydate(){
		return putawaydate;
	}
	public void setPutawaydate(String putawaydate){
		this.putawaydate=putawaydate;
	}
	public float getPartsprice(){
		return partsprice;
	}
	public void setPartsprice(float partsprice){
		this.partsprice=partsprice;
	}
	public String getManufactuper(){
		return  manufactuper;
	}
	public void  setManufactuper(String  manufactuper){
		this. manufactuper= manufactuper;
	}
	public String getProductiondate(){
		return  productiondate;
	}
	public void  setProductiondate(String  productiondate){
		this. productiondate= productiondate;
	}
	public String getLocation(){
		return  location;
	}
	public void  setLocation(String  location){
		this. location= location;
	}
	
	//返回所有零配件信息的方法
	public static ArrayList<CarPartsInfo> getCarPartsList(){
		ArrayList<CarPartsInfo> list=new ArrayList<CarPartsInfo>();
		String sql="select * from partsinfo";
		DBBean jdbc=new DBBean();
		ResultSet rs=jdbc.executeQuery(sql);
		try{
			while(rs.next()){
				CarPartsInfo fi=new CarPartsInfo();
				fi.setId(rs.getInt(1));
				fi.setPartsname(rs.getString(2));
				fi.setPartsnum(rs.getInt(3));
				fi.setPartsunit(rs.getString(4));
				fi.setPutawaydate(rs.getString(5));
				fi.setPartsprice(rs.getFloat(6));
				fi.setManufactuper(rs.getString(7));
				fi.setProductiondate(rs.getString(8));
				fi.setLocation(rs.getString(9));
				
				list.add(fi);
			}
			rs.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		jdbc.close();
		return list;
	}
	//返回某个仓库内零配件信息的方法
		public static ArrayList<CarPartsInfo> getWarehousePartsList(String location){
			ArrayList<CarPartsInfo> list=new ArrayList<CarPartsInfo>();
			String sql="select * from partsinfo where LOCATION='"+location+"'";
			DBBean jdbc=new DBBean();
			ResultSet rs=jdbc.executeQuery(sql);
			try{
				while(rs.next()){
					CarPartsInfo fi=new CarPartsInfo();
					fi.setId(rs.getInt(1));
					fi.setPartsname(rs.getString(2));
					fi.setPartsnum(rs.getInt(3));
					fi.setPartsunit(rs.getString(4));
					fi.setPutawaydate(rs.getString(5));
					fi.setPartsprice(rs.getFloat(6));
					fi.setManufactuper(rs.getString(7));
					fi.setProductiondate(rs.getString(8));
					fi.setLocation(rs.getString(9));
					list.add(fi);
				}
				rs.close();
			}catch(SQLException e){
				e.printStackTrace();
			}
			jdbc.close();
			return list;
		}
	//返回单条零配件信息的方法
	public static CarPartsInfo getPartById(String id){
		String sql="select * from partsinfo where PARTSID="+id;
		DBBean jdbc=new DBBean();
		ResultSet rs=jdbc.executeQuery(sql);
		CarPartsInfo fi =new CarPartsInfo();
		try{
			if(rs.next()){
				fi.setId(rs.getInt(1));
				fi.setPartsname(rs.getString(2));
				fi.setPartsnum(rs.getInt(3));
				fi.setPartsunit(rs.getString(4));
				fi.setPutawaydate(rs.getString(5));
				fi.setPartsprice(rs.getFloat(6));
				fi.setManufactuper(rs.getString(7));
				fi.setProductiondate(rs.getString(8));
				fi.setLocation(rs.getString(9));
		}
			rs.close();
		}catch(SQLException e){
			e.printStackTrace();
		}
		jdbc.close();
		return fi;	
	}
	//修改某条零配件的方法
	public static int updatePart(String id,String partsname,int partsnum,float partsprice,String location){
		int result=0;
		String sql="update partsinfo set PARTSNAME='"+partsname+"',PARTSNUM='"+partsnum+"',PARTSPRICE='"+partsprice+"',LOCATION='"+location+"' where PARTSID=" +id;
		DBBean jdbc=new DBBean();
		result=jdbc.executeUpdate(sql);
		return result;
	}
	//删除某条零配件信息的方法
	public static int deletePart(String id){
		int result=0;
		String sql="delete from partsinfo where PARTSID="+id;
		DBBean jdbc=new DBBean();
		result=jdbc.executeUpdate(sql);
		return result;
	}
	//添加零配件信息的方法
	public static int addPart( String partsname,int partsnum,String partsunit,String putawaydate,float partsprice,String manufactuper,String productiondate,String location){
		int result=0;
		String sql="insert into partsinfo(PARTSNAME,PARTSNUM,PARTSUNIT,PUTAWAYDATE,PARTSPRICE,MANUFACTUPER,PRODUCTIONDATE,LOCATION) values('"+partsname+"','"+partsnum+"','"+partsunit+"','"+putawaydate+"','"+partsprice+"','"+manufactuper+"','"+productiondate+"','"+location+"')";
		DBBean jdbc=new DBBean();
		result=jdbc.executeUpdate(sql);
		return result;
	}
}