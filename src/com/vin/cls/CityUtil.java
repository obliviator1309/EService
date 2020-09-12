package com.vin.cls;

import java.sql.*;

import com.vin.inter.IConn;

public class CityUtil implements IConn{
	static Connection conn = null;
	static {
		
		try {
			Class.forName(IConn.drivername);
			conn=DriverManager.getConnection(IConn.conn, IConn.root, IConn.pass);
			} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	public void insRec(String b)
	{	int y=0;
		String q="select max(cityid) from city";
		PreparedStatement ps = null;
		String query = "insert into city values(?,?)";
		
		try {
			Statement qt=conn.createStatement();
			ResultSet rs=qt.executeQuery(q);
			rs.next();
			y=rs.getInt(1);
			y++;
			ps= conn.prepareStatement(query);			
			ps.setInt(1, y);
			ps.setString(2, b);
			ps.execute();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}	
	}
	public void upsRec(String a,String b)
	{
		PreparedStatement ps1 = null;
		PreparedStatement ps = null;
		String query1 = "select cityid from city where cityname=?";
		String query = "update city set cityname=? where cityid = ?  ";
		try {
			ps1=conn.prepareStatement(query1);
			ps1.setString(1,a);
			ps1.execute();
			ResultSet rs=ps1.executeQuery();
			rs.next();
			int r=rs.getInt(1);
			ps= conn.prepareStatement(query);
			ps.setString(1, b);
			ps.setInt(2, r);
			ps.executeUpdate();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
	}
//	public void delRec(String j)
//	{
//		PreparedStatement ps = null;
//		String query = "delete from city where cityname=?";
//		try {
//			ps= conn.prepareStatement(query);
//			ps.setString(1, j);
//			ps.execute();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//	}
}
