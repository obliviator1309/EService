package com.vin.cls;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.ws.rs.*;

import com.vin.inter.IConn;

@Path("/sec")
public class Validate implements IConn{
	Connection con=null;
	@GET
	@Path("/val")
	public String retS(@QueryParam("email")String email,@QueryParam("passwords")String passwords)
	{
		String status="incomplete";
		String query = "select passwords from admin where email=?";
		try {
			Class.forName(IConn.drivername);
			con=DriverManager.getConnection(IConn.conn, IConn.root, IConn.pass);
			PreparedStatement ps = con.prepareStatement(query);
			ps.setString(1, email);
			
			ps.execute();
			ResultSet rs = ps.executeQuery();
			String r="";
			while(rs.next())
			{

			 r = rs.getString(1);
			}
			if(r.equals(passwords)){
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
