package com.vin.cls;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.sql.Statement;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.vin.inter.IConn;

public class ServiceManHelper implements IConn{
static Connection conn = null;
int cid=0;
int catid=0;
int cmax=0;
int catmax=0;
static {

try {
	Class.forName(IConn.drivername);
	conn=DriverManager.getConnection(IConn.conn, IConn.root, IConn.pass);
	
} catch (ClassNotFoundException | SQLException e) {
e.printStackTrace();
}

}

public void insRec(int a, String b,String c,String d,String e,int f,String g) {
PreparedStatement ps = null;
PreparedStatement ps2 = null;
PreparedStatement ps3 = null;


try {
	String q1= "select cityid from city where cityname=?";
	
ps = conn.prepareStatement(q1);
ps.setString(1, c);
ResultSet rs = ps.executeQuery();
while(rs.next())
{
	cid=rs.getInt(1);
}
String q2="select catid from category where catname=?";
ps2=conn.prepareStatement(q2);
ps2.setString(1, d);
ResultSet rs1 = ps2.executeQuery();
while(rs1.next())
{
	catid=rs1.getInt(1);
}
//System.out.println(catid);
if(cid==0)
{
	String q5="select max(cityid) from city";
	PreparedStatement ps5 = conn.prepareStatement(q5);
	ResultSet rs5 = ps5.executeQuery();
	rs5.next();
	cmax=rs5.getInt(1);
	cid=cmax+1;
	String q4="insert into city values(?,?)";
	PreparedStatement ps4= conn.prepareStatement(q4);
	ps4.setInt(1, cmax+1);
	ps4.setString(2, c);
	ps4.execute();
}
//System.out.println(cmax);
if(catid==0)
{
	String q5="select max(catid) from category";
	PreparedStatement ps5 = conn.prepareStatement(q5);
	ResultSet rs5 = ps5.executeQuery();
	rs5.next();
	catmax=rs5.getInt(1);
	catid = catmax+1;
	String q4="insert into category values(?,?)";
	PreparedStatement ps4= conn.prepareStatement(q4);
	ps4.setInt(1, catmax+1);
	ps4.setString(2, d);
	ps4.execute();

}
//System.out.println(cmax+" "+catmax);
//System.out.println(catid);
String q3="insert into servicemen values(?,?,?,?,?,?,?)";
ps3 = conn.prepareStatement(q3);
ps3.setInt(1, a);
ps3.setString(2, b);
ps3.setInt(3, cid);
ps3.setInt(4, catid);
ps3.setString(5, e);
ps3.setInt(6, f);
ps3.setString(7, g);
ps3.execute();
} catch (SQLException e1) {
e1.printStackTrace();
}
}
public int retsid()
{
	int s=0;
	try {
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery("select max(sid) from servicemen");
		rs.next();
		s=rs.getInt(1);
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	
	return s;
}

public List<ServiceMan> retList(){
	List<ServiceMan> ls = new ArrayList<ServiceMan>();
	try {
		Statement st = conn.createStatement();
		ResultSet rs = st.executeQuery("select * from servicemen");
		while(rs.next())
		{
			ServiceMan s= new ServiceMan();
			s.setSid(rs.getInt(1));
			s.setSname(rs.getString(2));
			s.setCityid(rs.getInt(3));
			s.setCid(rs.getInt(4));
			s.setExperience(rs.getString(5));
			s.setCharges(rs.getInt(6));
			s.setMobile(rs.getString(7));
			ls.add(s);
			
		}
	} catch (SQLException e) {
		// TODO Auto-generated catch block
		e.printStackTrace();
	}
	ls.stream().forEach(n->System.out.println(n.getSid()));
	return ls;
}

public void upsRec(int e,String a, int b,String c,String d) {
	try {
		PreparedStatement ps = conn.prepareStatement("update servicemen set sname=?,charges=?,experience=?,Mobile=? where sid=?");
		ps.setString(1, a);
		ps.setInt(2, b);
		ps.setString(3, c);
		ps.setString(4, d);
		ps.setInt(5, e);
		ps.executeUpdate();
		
	} catch (SQLException ee) {
		// TODO Auto-generated catch block
		ee.printStackTrace();
	}




}

public void delRec(int j) {
PreparedStatement ps = null;
String query = "delete from servicemen where sid=?";
try {
ps = conn.prepareStatement(query);
ps.setInt(1, j);
ps.execute();
} catch (SQLException e) {
e.printStackTrace();
}
}
}
