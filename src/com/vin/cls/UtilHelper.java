package com.vin.cls;

import java.sql.*;

import com.vin.inter.IConn;

public class UtilHelper implements IConn{
	
	Connection con=null;
	public String retS(String a,String b)
	{
		String status="incomplete";
		String query = "select passwords from admin where email=?";
		try {
			Class.forName(IConn.drivername);
			con=DriverManager.getConnection(IConn.conn, IConn.root, IConn.pass);
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, a);
			
			ps.execute();
			ResultSet rs = ps.executeQuery();
			String r="";
			while(rs.next())
			{

			 r = rs.getString(1);
			}
			if(r.equals(b)){
				status = "complete";
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		
		
		return status;
	}
}
