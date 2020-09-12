<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="com.vin.cls.UtilBill"%>
<%@page import="com.vin.cls.UserInfo"%>
<%@page import="com.vin.cls.UserHelper"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%
	UserInfo uh = new UserInfo();
UserHelper help=new UserHelper();
UtilBill bil=new UtilBill();
if(request.getParameter("id")!=null)
{
	int sdd = Integer.parseInt(request.getParameter("id"));
	int scc = Integer.parseInt(request.getParameter("schar"));
	session.setAttribute("sdd", sdd);
	session.setAttribute("scc", scc);
}
%>
</head>
<body>
	<form name="f11">
		<table>
			<tr>
				<td>Enter your name</td>
				<td><input type="text" name="uname"></td>
			</tr>
			<tr>
				<td>Enter your email</td>
				<td><input type="text" name="uemail"></td>
			</tr>
			<tr>
				<td>Enter your mobile</td>
				<td><input type="text" name="umob"></td>
			</tr>
			<tr>
				<td>Enter your Address</td>
				<td><input type="text" name="uadr"></td>
			</tr>
			<tr>
				<td>Enter number of hours to hire</td>
				<td><input type="text" name="uhr"></td>
			</tr>
			<tr>
				<td>
				<input type=submit value=Submit />
				</td>
			</tr>
		</table>
	</form>
	<%
		if (request.getParameter("uname") != null) {
			String n=request.getParameter("uname");
			String e=request.getParameter("uemail");
			String m=request.getParameter("umob");
			String a=request.getParameter("uadr");
			int h=Integer.parseInt(request.getParameter("uhr"));
			session.setAttribute("hr", h);
			int j = (int) session.getAttribute("scc");
			int b= bil.retBill(h, j);
			uh.setUname(n);
			uh.setUemail(e);
			uh.setUmob(m);
			uh.setUadr(a);
			uh.setUhr(h);
			List<UserInfo> ll = new ArrayList<UserInfo>();
			ll.add(uh);
			session.setAttribute("bb", b);
			session.setAttribute("ui", ll);
			//help.insUser(n, e, m, a,(int) session.getAttribute("sdd"), b);
			response.sendRedirect("bill.jsp");
		}
	%>
</body>
</html>