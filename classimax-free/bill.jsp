<%@page import="com.vin.cls.UserInfo"%>
<%@page import="com.vin.cls.PrintBillHelper"%>
<%@page import="com.vin.cls.ServiceMan"%>
<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Bill</title>
<%
PrintBillHelper hh = new PrintBillHelper();
int sid= (int) session.getAttribute("sdd");
List<ServiceMan> ll = hh.retSer(sid);
List<UserInfo> lu = (List<UserInfo>) session.getAttribute("ui");
int bill = (int) session.getAttribute("bb");
ServiceMan ss = ll.get(0);
int h = (int) session.getAttribute("hr");
%>
<style type="text/css">
body {
    background-color: #000
}

.padding {
    padding: 2rem !important
}

.card {
    margin-bottom: 30px;
    border: none;
    -webkit-box-shadow: 0px 1px 2px 1px rgba(154, 154, 204, 0.22);
    -moz-box-shadow: 0px 1px 2px 1px rgba(154, 154, 204, 0.22);
    box-shadow: 0px 1px 2px 1px rgba(154, 154, 204, 0.22)
}

.card-header {
    background-color: #fff;
    border-bottom: 1px solid #e6e6f2
}

h3 {
    font-size: 20px
}

h5 {
    font-size: 15px;
    line-height: 26px;
    color: #3d405c;
    margin: 0px 0px 15px 0px;
    font-family: 'Circular Std Medium'
}

.text-dark {
    color: #3d405c !important
}
</style>
<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.4.1/css/bootstrap.min.css" integrity="sha384-Vkoo8x4CGsO3+Hhxv8T/Q5PaXtkKtu6ug5TOeNV6gBiFeWPGFN9MuhOf23Q9Ifjh" crossorigin="anonymous">
</head>
<body>




 <div class="offset-xl-2 col-xl-8 col-lg-12 col-md-12 col-sm-12 col-12 padding" >
     <div class="card">
         <div class="card-header p-4">
             <a class="pt-2 d-inline-block" href="user" data-abc="true"><img src="logo.png" alt=""></a>
             <div class="float-right">
                 <h3 class="mb-0">Invoice #BBB10234</h3>
                 

<p>Date/Time: <span id="datetime"></span></p>

<script>
var dt = new Date();
document.getElementById("datetime").innerHTML = dt.toLocaleString();
</script>



             </div>
         </div>
         <div class="card-body">
             <div class="row mb-4">
                 <div class="col-sm-6">
                     <h5 class="mb-3">From:</h5>
                     <%for(UserInfo ui:lu){ %>
                     <h3 class="text-dark mb-1"><%=ui.getUname() %></h3>
                     <div><%=ui.getUadr() %></div>
                     <div>Email: <%=ui.getUemail() %></div>
                     <div>Phone: <%=ui.getUmob() %></div>
                     <%} %>
                 </div>
                 <div class="col-sm-6 ">
                     <h5 class="mb-3">To:</h5>
                     <h3 class="text-dark mb-1"><%=ss.getSname() %></h3>
                     <div><%=ss.getExperience() %></div>
                     <div>Phone: <%=ss.getMobile() %></div>
                 </div>
             </div>
             <div class="table-responsive-sm">
                 <table class="table table-striped">
                     <thead>
                         <tr>
                             <th>Category</th>
							<th class="right">Hours</th>
                             <th class="right">Price</th>
                             <th class="right">Total</th>
                         </tr>
                     </thead>
                     <tbody>
                         <tr>
                             <td class="left strong"></td>
                             <td class="right"><%=h %></td>
                             <td class="right"><%=ss.getCharges() %></td>
                             <td class="right"><%=ss.getCharges() %></td>
                         </tr>
                      </tbody>
                 </table>
             </div>
             <div class="row">
                 <div class="col-lg-4 col-sm-5">
                 </div>
                 <div class="col-lg-4 col-sm-5 ml-auto">
                     <table class="table table-clear">
                         <tbody>
                             <tr>
                                 <td class="left">
                                     <strong class="text-dark">Subtotal</strong>
                                 </td>
                                 <td class="right"><%=ss.getCharges() %></td>
                             </tr>
                             <tr>
                                 <td class="left">
                                     <strong class="text-dark">Gst(18%) + Service Charge(2%)</strong>
                                 </td>
                                 <td class="right"><%=ss.getCharges()*(0.2) %></td>
                             </tr>
                             <tr>
                                 <td class="left">
                                     <strong class="text-dark">Total</strong> </td>
                                 <td class="right">
                                     <strong class="text-dark"><%=bill %></strong>
                                 </td>
                             </tr>
                         </tbody>
                     </table>
                 </div>
             </div>
         </div>
         <div class="btn btn-primary">Look For Another Service
         </div>
     </div>
 </div>



</body>
</html>