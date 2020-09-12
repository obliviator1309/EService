package com.vin.cls;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import com.vin.inter.IConn;

public class CategoryUtil implements IConn{
	static Connection conn = null;
	static {

		try {
			Class.forName(IConn.drivername);
			conn=DriverManager.getConnection(IConn.conn, IConn.root, IConn.pass);
			
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}

	}

	public void insRec(int a, String b) {
		PreparedStatement ps = null;
		String query = "insert into category values(?,?)";

		try {
			ps = conn.prepareStatement(query);
			ps.setInt(1, a);
			ps.setString(2, b);
			ps.execute();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}
	}

	public void upsRec(String a, String b) {
		PreparedStatement ps1 = null;
		PreparedStatement ps = null;
		String query1 = "select catid from category where catname=?";
		String query = "update category set catname=? where catid = ?";
		try {
			ps1 = conn.prepareStatement(query1);
			ps1.setString(1, a);
			ps1.execute();
			ResultSet rs = ps1.executeQuery();
			rs.next();
			int r = rs.getInt(1);
			ps = conn.prepareStatement(query);
			ps.setString(1, b);
			ps.setInt(2, r);
			ps.executeUpdate();
		} catch (SQLException e1) {
			e1.printStackTrace();
		}

	}
//
//	public void delRec(String b) {
//		int j=0;
//		PreparedStatement ps2 = null;
//		try {
//			String query = "select catid from category where catname='" + b+ "'";
//			PreparedStatement ps = conn.prepareStatement(query);
//			ResultSet rs = ps.executeQuery();
//			while (rs.next()) {
//				j = rs.getInt(1);
//
//			}
//			System.out.println(j);
//			ps2 = conn.prepareStatement("delete from category where catid=?");
//			ps2.setInt(1, j);
//			ps2.executeUpdate();
//		} catch (SQLException e) {
//			e.printStackTrace();
//		}
//	}
}