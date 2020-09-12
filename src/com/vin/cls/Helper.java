package com.vin.cls;
import java.sql.*;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import com.vin.inter.IConn;
public class Helper implements IConn {
	
	Connection con=null;
	List<String> a=Collections.EMPTY_LIST;
	String r="";
	public List<String> retS(String s)
	{
		a=new ArrayList<String>();
		try {
			Class.forName(IConn.drivername);
			con=DriverManager.getConnection(IConn.conn, IConn.root, IConn.pass);
			if(s.equals("city"))
			{
				r="cityname";
			}
			else
			{
				r="catname";
			}
			String query="select "+r+" from "+s;
			PreparedStatement st = con.prepareStatement(query);
			ResultSet rs = st.executeQuery();
			
			while(rs.next())
			{
				//a.add(rs.getString(1));
//				System.out.println(rs.getObject(1));
				Object o=rs.getObject(1);
				if(o!=null){
				a.add(o.toString());
				}
			}
			
//			System.out.println(query);
			
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return a;
	}

}
