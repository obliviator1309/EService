package com.vin.cls;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.Collections;
import java.util.List;

public class PrintHelper {
	static Connection conn = null;
	List<ServiceMan> ls=Collections.EMPTY_LIST;
	static {
		try {
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/eservice?characterEncoding=latin1&useConfigs=maxPerformance", "root","123456ns");
		} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	public String retCategory(int c) {
		String cat=null;
		PreparedStatement ps=null;
		String q="Select catname from category where catid=?";
		try {
			ps=conn.prepareStatement(q);
			ps.setInt(1, c);
			ResultSet rs=ps.executeQuery();
			rs.next();
			cat=rs.getString(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return cat;
	}
	public String retCity(int c) {
		String city=null;
		PreparedStatement ps=null;
		String q="Select cityname from city where cityid=?";
		try {
			ps=conn.prepareStatement(q);
			ps.setInt(1, c);
			ResultSet rs=ps.executeQuery();
			rs.next();
			city=rs.getString(1);
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return city;
	}
}
