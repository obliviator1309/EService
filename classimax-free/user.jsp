<%@page import="java.util.ArrayList"%>
<%@page import="com.vin.cls.ServiceMen"%>
<%@page import="com.vin.cls.Search"%>
<%@page import="com.vin.cls.ServiceMan"%>
<%@page import="java.util.Collections"%>
<%@page import="java.util.List"%>
<%@page import="com.vin.cls.Helper"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Choice</title>
<%
	Helper hh = new Helper();
	List<String> b = Collections.EMPTY_LIST;
	String a="hello";
	int i=0;
	session.setAttribute("lo", i);
%>



<!-- SITE TITTLE -->
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>SAAVAN</title>
  
  <!-- FAVICON -->
  <link href="img/favicon.png" rel="shortcut icon">
  <!-- PLUGINS CSS STYLE -->
  <!-- <link href="plugins/jquery-ui/jquery-ui.min.css" rel="stylesheet"> -->
  <!-- Bootstrap -->
  <link rel="stylesheet" href="plugins/bootstrap/css/bootstrap.min.css">
  <link rel="stylesheet" href="plugins/bootstrap/css/bootstrap-slider.css">
  <!-- Font Awesome -->
  <link href="plugins/font-awesome/css/font-awesome.min.css" rel="stylesheet">
  <!-- Owl Carousel -->
  <link href="plugins/slick-carousel/slick/slick.css" rel="stylesheet">
  <link href="plugins/slick-carousel/slick/slick-theme.css" rel="stylesheet">
  <!-- Fancy Box -->
  <link href="plugins/fancybox/jquery.fancybox.pack.css" rel="stylesheet">
  <link href="plugins/jquery-nice-select/css/nice-select.css" rel="stylesheet">
  <!-- CUSTOM CSS -->
  <link href="css/style.css" rel="stylesheet">


  <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
  <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
  <!--[if lt IE 9]>
  <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
  <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
  <![endif]-->
</head>
<body class="body-wrapper">
	<section>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-expand-lg navbar-light navigation">
					<a class="navbar-brand" href="user.jsp">
						<img src="logo.png" alt="">
					</a>
					<button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent"
					 aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>
					<div class="collapse navbar-collapse" id="navbarSupportedContent">
						<ul class="navbar-nav ml-auto main-nav ">
							<li class="nav-item active">
								<a class="nav-link" href="user.jsp">Home</a>
							</li>
							<li class="nav-item dropdown dropdown-slide">
								<a class="nav-link dropdown-toggle" data-toggle="dropdown" href="">Dashboard<span><i class="fa fa-angle-down"></i></span>
								</a>

								<!-- Dropdown list -->
								<div class="dropdown-menu">
									<a class="dropdown-item" href="about-us.html">About Us</a>
									<a class="dropdown-item" href="contact-us.html">Contact Us</a>

								</div>
								
							</li>
							<li class="nav-item dropdown dropdown-slide">
								<a class="nav-link dropdown-toggle" href="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
									Pages <span><i class="fa fa-angle-down"></i></span>
								</a>
								<!-- Dropdown list -->
								<div class="dropdown-menu">
									<a class="dropdown-item" href="about-us.html">About Us</a>
									<a class="dropdown-item" href="contact-us.html">Contact Us</a>

								</div>
							</li>
							
						</ul>
						<ul class="navbar-nav ml-auto mt-10">
							<li class="nav-item">
								<a class="btn btn-success" href="login.jsp">Login</a>
							</li>
							
						</ul>
					</div>
				</nav>
			</div>
		</div>
	</div>
</section>

<!--===============================
=            Hero Area            =
================================-->

<section class="hero-area bg-1 text-center overly">
	<!-- Container Start -->
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<!-- Header Contetnt -->
				<div class="content-block">
					<h1>Contact the right person at right point of time </h1>
					<p>Find the serviceman according to your need<br> from local communities around the country</p>
					
					
				</div>
				<!-- Advance Search -->
				<div class="advance-search">
						<div class="container">
							<div class="row justify-content-center">
								<div class="col-lg-12 col-md-12 align-content-center">
										<form style="margin-left:22%">
											<div class="form-row">
												<div class="form-group col-md-3">
												<p>Choose City or Category</p>
													<select class="w-100 form-control mt-lg-1 mt-md-2" name="f11" onchange="submit()">
														<option>Select</option>			
														<option value="city">City</option>
														<option value="category">Category</option>
														<option value="all">Both</option>
													</select>
												</div>
											</div>
										</form>
												<%
													if (request.getParameter("f11") != null) {
														a = request.getParameter("f11");
														if(request.getParameter("f11").equalsIgnoreCase("all"))
														{
														}
														else{
															b = hh.retS(a);
														}
														session.setAttribute("va", a);
													}
												%>
								</div>
								<div class="col-lg-12 col-md-12 align-content-center">
										<form style="margin-left:22%">
											<div>
												<div class="form-group col-md-3">
												<p>Choose <%=request.getParameter("f11") %></p>
													<select class="w-100 form-control mt-lg-1 mt-md-2" name="f22">
														<option>Select</option>
														<%
															for (String r : b) {
														%>
														<option><%=r%></option>
														<% } %>
													</select>
												</div>
												<div class="form-group col-md-3 align-self-center">
													<button type="submit" class="btn btn-primary">Search Now</button>
												</div>
											</div>
										</form>
										<%
											List<ServiceMan> ll = Collections.EMPTY_LIST;
										    ll=new ArrayList<ServiceMan>();
											Search s= new Search();
											if(request.getParameter("f22")!=null)
											{
												String d = request.getParameter("f22");
												String r= (String)session.getAttribute("va");
												if(r.equals("city"))
												{
													ll= s.retListCity(d);
												}
												else if(r.equals("category"))
												{
													ll= s.retListCategory(d);
												}
												else
												{
													ll=s.retAll();
												}
												session.setAttribute("lis",ll);
												response.sendRedirect("printdetail.jsp");
											}
										%>
									</div>
								</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<!-- Container End -->
</section>

<!--===================================
=            Client Slider            =
====================================-->


<!--===========================================
=            Popular deals section            =
============================================-->

<section class="popular-deals section bg-gray">
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<div class="section-title">
					<h2>Services Offered</h2>
				</div>
			</div>
		</div>
		<div class="row">
			<!-- offer 01 -->
			<div class="col-lg-12">
				<div class="trending-ads-slide">

				
				
				<div class="col-sm-12 col-lg-4">
						<!-- product card -->
<div class="product-item bg-light">
	<div class="card">
		<div class="thumb-content">
			<a href="single.html">
				<img class="card-img-top img-fluid" src="images/products/carpenter1.jpg" alt="Card image cap">
			</a>
		</div>
		<div class="card-body">
		    <h4 class="card-title"><a href="single.html">Carpenter</a></h4>
		    <ul class="list-inline product-meta">
		    </ul>
		</div>
	</div>
</div>

				</div>
				
				
				
				
				<div class="col-sm-12 col-lg-4">
						<!-- product card -->
<div class="product-item bg-light">
	<div class="card">
		<div class="thumb-content">
			<a href="single.html">
				<img class="card-img-top img-fluid" src="images/products/carwasher.jpg" alt="Card image cap">
			</a>
		</div>
		<div class="card-body">
		    <h4 class="card-title"><a href="single.html">Carwasher</a></h4>
		    <ul class="list-inline product-meta">
		    </ul>
		</div>
	</div>
</div>

				</div>
				
				
				
				
				
				
					<div class="col-sm-12 col-lg-4">
						<!-- product card -->
<div class="product-item bg-light">
	<div class="card">
		<div class="thumb-content">
			<a href="single.html">
				<img class="card-img-top img-fluid" src="images/products/driv.jpg" alt="Card image cap">
			</a>
		</div>
		<div class="card-body">
		    <h4 class="card-title"><a href="single.html">Driver</a></h4>
		    <ul class="list-inline product-meta">
		    </ul>
		</div>
	</div>
</div>

				</div>
				
				
				
				<div class="col-sm-12 col-lg-4">
						<!-- product card -->
<div class="product-item bg-light">
	<div class="card">
		<div class="thumb-content">
			<a href="single.html">
				<img class="card-img-top img-fluid" src="images/products/elec.jpg" alt="Card image cap">
			</a>
		</div>
		<div class="card-body">
		    <h4 class="card-title"><a href="single.html">Electrician</a></h4>
		    <ul class="list-inline product-meta">
		    </ul>
		</div>
	</div>
</div>

				</div>
				
				
				
				
				
				
				
				<div class="col-sm-12 col-lg-4">
						<!-- product card -->
<div class="product-item bg-light">
	<div class="card">
		<div class="thumb-content">
			<a href="single.html">
				<img class="card-img-top img-fluid" src="images/products/plumbing.jpg" alt="Card image cap">
			</a>
		</div>
		<div class="card-body">
		    <h4 class="card-title"><a href="single.html">Plumber</a></h4>
		    <ul class="list-inline product-meta">
		    </ul>
		</div>
	</div>
</div>

				</div>	
					</div>
				</div>
			</div>
			
			
		</div>
	</div>
</section>



<!--==========================================
=            All Category Section            =
===========================================-->

<section class=" section">
	<!-- Container Start -->
	<div class="container ">
		<div class="row" >
			<div class="col-12">
				<!-- Section title -->
				<div class="section-title">
					<h2>Why Choose SAAVAN</h2>
					<p>SAAVAN is recognized as the growing startup in India. We are a mobile marketplacce for local services. We help customers hire trusted professionals for all the service needs. We are staffed with young, passionate people working tirelessly to make a difference in the lives of people by catering to their service needs at there doorsteps. We provide housekeeping services which consist of Plumbing, Electricians, Carpenters, Cleaning, Drivers. We are a sure shot destination for your service needs.  </p>
				</div>
			</div>
		</div>
	</div>
	<!-- Container End -->
</section>
<!--====================================
=            Call to Action            =
=====================================-->

<section class="call-to-action overly bg-3 section-sm">
	<!-- Container Start -->
	<div class="container ">
		<div class="row justify-content-md-center text-center ">
			<div class="col-md-8">
				<div class="content-holder">
					<h2>We bring good services to your doorstep.</h2><br/>
					<iframe width="560" height="315" src="https://www.youtube.com/embed/_hy5nlpQC1I" frameborder="0" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>				</div>
			</div>
		</div>
	</div>
	<!-- Container End -->
</section>

<!--============================
=            Footer            =
=============================-->




  <!-- Container End -->
</footer>
<!-- Footer Bottom -->
<footer class="footer-bottom">
  <!-- Container Start -->
  <div class="container">
    
      
        <!-- Copyright -->
        <div class="copyright  text-center">
          <p>Copyright © <script>
              var CurrentYear = new Date().getFullYear()
              document.write(CurrentYear)
            </script>. All Rights Reserved <br/><br/></p>
        </div>
      
      <div class="row-sm-6 col-12">
        <!-- Social Icons -->
        <ul class="social-media-icons text-right">
          <li><a class="fa fa-facebook" href="https://www.facebook.com" target="_blank"></a></li>
          <li><a class="fa fa-twitter" href="https://www.twitter.com" target="_blank"></a></li>
          <li><a class="fa fa-pinterest-p" href="https://www.pinterest.com" target="_blank"></a></li>
          <li><a class="fa fa-vimeo" href=""></a></li>
        </ul>
      </div>
    
  </div>
  <!-- Container End -->
  <!-- To Top -->
  <div class="top-to">
    <a id="top" class="" href="#"><i class="fa fa-angle-up"></i></a>
  </div>
</footer>

<!-- JAVASCRIPTS -->
<script src="plugins/jQuery/jquery.min.js"></script>
<script src="plugins/bootstrap/js/popper.min.js"></script>
<script src="plugins/bootstrap/js/bootstrap.min.js"></script>
<script src="plugins/bootstrap/js/bootstrap-slider.js"></script>
  <!-- tether js -->
<script src="plugins/tether/js/tether.min.js"></script>
<script src="plugins/raty/jquery.raty-fa.js"></script>
<script src="plugins/slick-carousel/slick/slick.min.js"></script>
<script src="plugins/jquery-nice-select/js/jquery.nice-select.min.js"></script>
<script src="plugins/fancybox/jquery.fancybox.pack.js"></script>
<script src="plugins/smoothscroll/SmoothScroll.min.js"></script>
<!-- google map -->
<script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCcABaamniA6OL5YvYSpB3pFMNrXwXnLwU&libraries=places"></script>
<script src="plugins/google-map/gmap.js"></script>
<script src="js/script.js"></script>
</body>
</html>