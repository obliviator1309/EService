package com.vin.cls;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import com.vin.inter.IConn;

public class ServiceManUtil implements IConn{
	static Connection conn = null;
	static {

		try {
			Class.forName(IConn.drivername);
			conn=DriverManager.getConnection(IConn.conn, IConn.root, IConn.pass);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

	}

	public void insRec(int a, String b,int c,int d,String e,String f,String g) {
		PreparedStatement ps = null;
		String query = "insert into servicemen values(?,?,?,?,?,?,?)";

		try {
			ps = conn.prepareStatement(query);
			ps.setInt(1, a);
			ps.setString(2, b);
			ps.setInt(3, c);
			ps.setInt(4, d);
			ps.setString(5, e);
			ps.setString(6, f);
			ps.setString(7, g);
			ps.execute();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
	}

	public void upsRec(String a, String b) {
//		PreparedStatement ps1 = null;
//		PreparedStatement ps = null;
//		String query1 = "select sid from servicemen where cname=?";
//		String query = "update category set cname=? where sid = ?  ";
//		try {
//			ps1 = conn.prepareStatement(query1);
//			ps1.setString(1, a);
//			ps1.execute();
//			ResultSet rs = ps1.executeQuery();
//			rs.next();
//			int r = rs.getInt(1);
//			ps = conn.prepareStatement(query);
//			ps.setString(1, b);
//			ps.setInt(2, r);
//			ps.executeUpdate();
//		} catch (SQLException e1) {
//			e1.printStackTrace();
//		}
		
		List<ServiceMan> ls=new ArrayList<>();
		
		

	}

	public void delRec(String j) {
		PreparedStatement ps = null;
		String query = "delete from servicemen where sid=?";
		try {
			ps = conn.prepareStatement(query);
			ps.setString(1, j);
			ps.execute();
		} catch (SQLException e) {
			e.printStackTrace();
		}
	}
}
