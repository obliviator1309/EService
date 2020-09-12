package com.vin.cls;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.vin.inter.IConn;

public class Search implements IConn{
	static Connection conn = null;
	List<ServiceMan> ls=Collections.EMPTY_LIST;
	static {
		try {
			Class.forName(IConn.drivername);
			conn=DriverManager.getConnection(IConn.conn, IConn.root, IConn.pass);
			} catch (ClassNotFoundException | SQLException e) {
			e.printStackTrace();
		}
	}
	public Search() {
		ls=new ArrayList<ServiceMan>();
	}
	public List<ServiceMan> retListCity(String ct){
		PreparedStatement ps=null;
		String q="select * from servicemen s,city c where s.cityid=c.cityid and c.cityname=?";
		try {
			ps=conn.prepareStatement(q);
			ps.setString(1, ct);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				ServiceMan ss = new ServiceMan();
				ss.setSid(rs.getInt(1));
				ss.setSname(rs.getString(2));
				ss.setCityid(rs.getInt(3));
				ss.setCid(rs.getInt(4));
				ss.setExperience(rs.getString(5));
				ss.setCharges(rs.getInt(6));
				ss.setMobile(rs.getString(7));
				
				ls.add(ss);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ls;
	}
	public List<ServiceMan> retListCategory(String ct){
		PreparedStatement ps=null;
		String q="select * from servicemen s,category c where s.catid=c.catid and c.catname=?";
		try {
			ps=conn.prepareStatement(q);
			ps.setString(1, ct);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				ServiceMan ss = new ServiceMan();
				ss.setSid(rs.getInt(1));
				ss.setSname(rs.getString(2));
				ss.setCityid(rs.getInt(3));
				ss.setCid(rs.getInt(4));
				ss.setExperience(rs.getString(5));
				ss.setCharges(rs.getInt(6));
				ss.setMobile(rs.getString(7));
				ls.add(ss);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ls;
	}
	public List<ServiceMan> retAll(){
		PreparedStatement ps=null;
		String q="select * from servicemen";
		try {
			ps=conn.prepareStatement(q);
			ResultSet rs = ps.executeQuery();
			while(rs.next())
			{
				ServiceMan ss = new ServiceMan();
				ss.setSid(rs.getInt(1));
				ss.setSname(rs.getString(2));
				ss.setCityid(rs.getInt(3));
				ss.setCid(rs.getInt(4));
				ss.setExperience(rs.getString(5));
				ss.setCharges(rs.getInt(6));
				ss.setMobile(rs.getString(7));
				ls.add(ss);
			}
			
		} catch (SQLException e) {
			e.printStackTrace();
		}
		return ls;
	}
}
