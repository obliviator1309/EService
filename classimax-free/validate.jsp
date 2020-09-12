<%@page import="com.vin.cls.TesterCls"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
<%
TesterCls ts = new TesterCls();
if(request.getParameter("username")!=null)
{
	String a= request.getParameter("username");
	String b = request.getParameter("passwords");
	String s = ts.retst(a, b);
	//out.println(s);
	
	if(s.equalsIgnoreCase("Complete"))
	{
		session.setAttribute("chg", a);
		response.sendRedirect("http://localhost:8080/EService/material-dashboard-master/examples/user.html");
	}
	else
	{
		int j =(int) session.getAttribute("lo");
		if(j==2)
		{
			response.sendRedirect("user.jsp");
		}
		else
		{
			j++;
			out.println("Wrong username or password");
			session.setAttribute("lo", j);
			response.sendRedirect("login.jsp");
		}
	}
}
%>

</body>
</html>
