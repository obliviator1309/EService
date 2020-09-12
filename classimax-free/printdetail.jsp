<%@page import="com.vin.cls.PrintBillHelper"%>
<%@page import="com.vin.cls.PrintHelper"%>
<%@page import="com.vin.cls.ServiceMan"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0/css/bootstrap.min.css" integrity="sha384-Gn5384xqQ1aoWXA+058RXPxPg6fy4IWvTNh0E263XmFcJlSAwiGgFAW/dAiS6JXm" crossorigin="anonymous">
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Details</title>
<%
String city="";
String cat="";
PrintBillHelper pbh=new PrintBillHelper();
%>
</head>
<body>
<%
PrintHelper pl=new PrintHelper();
List<ServiceMan> ll = (List<ServiceMan>) session.getAttribute("lis");
for(ServiceMan ss:ll)
{
%>
<div class="card" style="width: 20rem;">
  <div class="card-body">
    <h4 class="card-title"><%=ss.getSname() %></h4>
    <% 
    	int sd=ss.getSid();
    	int sc=ss.getCharges();
    	//pbh.retSer(sd);
    	int c=ss.getCid();
    	int cty=ss.getCityid();
    	city=pl.retCity(cty);
    	cat=pl.retCategory(c);
    %>
    <form>
    <h5 class="card-subtitle mb-2 text-muted">Id :<%=sd%> </h5>
    <h5 class="card-subtitle mb-2 text-muted">City :<%=city%> </h5>
    <h5 class="card-subtitle mb-2 text-muted">Category :<%=cat%></h5>
    <h5 class="card-subtitle mb-2 text-muted">Mobile   :<%=ss.getMobile()%></h5>
    <h5 class="card-subtitle mb-2 text-muted">Charges/hour Rs. :<%=ss.getCharges() %></h5>  
   
   <% String j="book.jsp?id="+sd+"&schar="+ss.getCharges(); %>
    <a href="<%=j %>" class="btn btn-primary">Book Now</a>  
    </form>
  </div>
</div>





<br/><br/>
<% }%>
</body>
</html>