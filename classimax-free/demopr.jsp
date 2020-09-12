<%@page import="com.vin.cls.UserInfo"%>
<%@page import="com.vin.cls.ServiceMan"%>
<%@page import="java.util.List"%>
<%@page import="com.vin.cls.PrintBillHelper"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<%
PrintBillHelper hh = new PrintBillHelper();
int sid= (int) session.getAttribute("sdd");
List<ServiceMan> ll = hh.retSer(sid);
List<UserInfo> lu = (List<UserInfo>) session.getAttribute("ui");
int bill = (int) session.getAttribute("bb");
%>
</head>
<body>
<%
UserInfo ui= lu.get(0);
for(ServiceMan ss:ll)
{
	out.println(ss.getSname()+" "+ss.getCharges()+""+ui.getUname()+"<br/>"+bill+" "+ui.getUemail());
}
%>
</body>
</html>