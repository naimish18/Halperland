<%@page import="helperland.model.User"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page isELIgnored ="false" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Prices</title>

    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"></c:url>">
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"></c:url>">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@500&display=swap" rel="stylesheet">

    <script src="https://kit.fontawesome.com/5602f8a8c9.js" crossorigin="anonymous"></script>
</head>
<body>
<% User u_id=new User();
if(session.getAttribute("user")!=null){
	u_id=(User)session.getAttribute("user");
}
int user_type=-1;
if(session.getAttribute("user_type")!=null){
	user_type=(Integer)session.getAttribute("user_type");
}
%>

<c:set var="id" value="<%= u_id.getUserId() %>" scope="session"></c:set>
    <nav id="faqnav" class="navbar navbar-expand-lg">
            
        <a href="index.jsp"><img src="<c:url value="/resources/images/logo-large.png"></c:url>" id="logo-faq"  alt=""></a>
        <button style="color:white; margin-right: 15px;" class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav ms-auto" id="faq-nav">
            <c:if test="${sessionScope.user_type!=2 }">
            <li class="nav-item">
              <a class="nav-link rounded-pill nav-padding greenlink" aria-current="page" href="book_service.jsp">Book now</a>
            </li>
            </c:if>
            <li class="nav-item">
              <a class="nav-link nav-padding rounded-pill" href="prices.jsp">Price & Services</a>
            </li>
            <li class="nav-item">
              <a class="nav-link nav-padding" href="#">Warranty</a>
            </li>
            <li class="nav-item">
              <a class="nav-link nav-padding" href="#">Blog</a>
            </li>
            <li class="nav-item">
                <a class="nav-link nav-padding" href="contact.jsp">Contact</a>
              </li>
             <c:if test="${sessionScope.id ==0 }">
            <li class="nav-item">
                <button class="nav-link border border-1 rounded-pill px-3 nav-padding greenlink" data-bs-toggle="modal" data-bs-target="#exampleModal" style="color: #FFFFFF;">Login</button>
              
            </li>
            </c:if>
            <c:if test="${sessionScope.user_type!=2 }">
            <li class="nav-item">
              <a class="nav-link border border-1 rounded-pill nav-padding greenlink" href="become_a_provider.jsp">Become a Helper</a>
            </li>
            </c:if>
            <c:if test="${sessionScope.id >0}">
	          	<li class="nav-item">
	          		<div id="ups_noti_icon" class="nav-item">
	                    <i id="ups_notification" class="nav-link fas fa-bell" style="color: white;font-size: 25px; padding: 15px 15px;margin-left: 10px;"></i>
	                </div>
	          	</li>
	          	<li class="nav-item dropdown">
	            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
	              <img  src="<c:url value="/resources/images//admin-user.png"></c:url>" alt="">
	            </a>
	            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown" >
	              <h4 class="dropdown-item ups_admin_fs">Warm Welcome,</h4> 
	              <h4 class="dropdown-item ups_admin_fs"><b><%= u_id.getFirstName() %><%=" " %><%= u_id.getLastName() %></b></h4>
	              <c:if test="${sessionScope.user_type!=2 }">
	              <li><a class="dropdown-item" href="customer_dashboard.jsp" style="font-size: 18px;"><span>My Dashboard</span></a></li>
	              </c:if>
	              <c:if test="${sessionScope.user_type==2 }">
	              <li><a class="dropdown-item" href="" style="font-size: 18px;"><span>My Dashboard</span></a></li>
	              </c:if>
	              <li><a class="dropdown-item" href="#" style="font-size: 18px;"><span>My settings</span></a></li>
	              <li><a class="dropdown-item" href="logout" style="font-size: 18px;"><span>Logout</span></a></li>
	            </ul>
          	</li>
          </c:if>
            
          </ul>
        
          </div>
    </nav>
    

    <div class="container-fluid px-0 py-0">
        <img id="faq_banner" src="<c:url value="/resources/images/group-18.png"></c:url>" alt="">
    </div>

    <div style="margin-top: 32px;position: relative;">
        <p id="faq_title" style="font-size: 35px;text-align: center;font-family: Roboto;font-size: 36px;"><b>Prices</b></p>
        <img id="faq_title_img" src="<c:url value="/resources/images/separator.png"></c:url>" alt="">
    </div>

    <div id="price_box">
        <p id="price_box_title">One Time</p>
        <p id="price_box_sub_txt">&#8364; 20<span style="font-size: 30px;font-family: Roboto;">/hr</span></p>
        <div id="price_sub_box">
            <div class="price_sub_sub_box">
                <img class="price_sub_img" src="<c:url value="/resources/images/forma-1_5.png"></c:url>" alt="">
                <p class="price_sub_img_txt">Lower prices</p>
            </div>
            <div class="price_sub_sub_box" style="margin-top: 20px;">
                <img class="price_sub_img" src="<c:url value="/resources/images/forma-1_5.png"></c:url>" alt="">
                <p class="price_sub_img_txt">Easy online & secure payment</p>
            </div>
            <div class="price_sub_sub_box" style="margin-top: 20px; margin-bottom: 30px;">
                <img class="price_sub_img" src="<c:url value="/resources/images/forma-1_5.png"></c:url>" alt="">
                <p class="price_sub_img_txt">Easy amendment</p>
            </div>
        </div>
    </div>

    <div id="price_service_box">
        <div style="margin-top: 32px;position: relative;">
            <p id="faq_title" style="font-size: 35px;text-align: center;font-family: Roboto;font-size: 36px;"><b>Extra services</b></p>
            <img id="faq_title_img" src="<c:url value="/resources/images/separator.png"></c:url>" alt="">
        </div>
        <div class="d-flex flex-wrap justify-content-between price_service_main">
            <div class="price_menu">
                <div id="price_service_sub_box">
                    <img id="price_service_box_img1" src="<c:url value="/resources/images/3.png"></c:url>" alt="">
                </div>
                <p id="price_service_box_txt1">Inside cabinets</p>
                <p id="price_service_box_txt2">30 minutes</p>
            </div>
            <div class="price_menu">
                <div id="price_service_sub_box">
                    <img id="price_service_box_img2" src="<c:url value="/resources/images/5.png"></c:url>" alt="">
                </div>
                <p id="price_service_box_txt1">Inside fridge</p>
                <p id="price_service_box_txt2">30 minutes</p>
            </div>
            <div class="price_menu">
                <div id="price_service_sub_box">
                    <img id="price_service_box_img3" src="<c:url value="/resources/images/4.png"></c:url>" alt="">
                </div>
                <p id="price_service_box_txt1">Inside oven</p>
                <p id="price_service_box_txt2">30 minutes</p>
            </div class="price_menu">
            <div class="price_menu">
                <div id="price_service_sub_box">
                    <img id="price_service_box_img4" src="<c:url value="/resources/images/2.png"></c:url>" alt="">
                </div>
                <p id="price_service_box_txt1">Laundry wash & dry</p>
                <p id="price_service_box_txt2">30 minutes</p>
            </div>
            <div class="price_menu">
                <div id="price_service_sub_box">
                    <img id="price_service_box_img5" src="<c:url value="/resources/images/1.png"></c:url>" alt="">
                </div>
                <p id="price_service_box_txt1">Interior windows</p>
                <p id="price_service_box_txt2">30 minutes</p>
            </div>
        </div>
    </div>

    <div id="price_include">
        <div style="padding-top: 70px;position: relative;">
            <p id="price_title" style="font-size: 35px;text-align: center;font-family: Roboto;font-size: 36px;"><b>What we include in cleaning</b></p>
            <img id="price_title_img" src="<c:url value="/resources/images/separator.png"></c:url>" alt="">
        </div>

        <div class="container price_include_card">
            <div class="row">
                <div class="col-md-6 col-lg-4 price_main_include" >
                    <img id="price_include_img" src="<c:url value="/resources/images/group-18_3.png"></c:url>" alt="">
                    <p id="price_include_title">Bedroom and Living Room</p>
                    <div class="price_include_txt" style="display: flex;align-items: center;">
                        <img id="" class="faq_arrow_img" src="<c:url value="/resources/images/right-arrow.png"></c:url>" alt="">
                        <a class="price_include_sub_txt" href="" style="font-size: 16px;margin-left: 15px;color: #4F4F4F;">Dust all accessible surfaces</a>
                    </div>
                    <div class="price_include_txt" style="display: flex;align-items: center;">
                        <img id="" class="faq_arrow_img" src="<c:url value="/resources/images/right-arrow.png"></c:url>" alt="">
                        <a class="price_include_sub_txt" href="" style="font-size: 16px;margin-left: 15px;color: #4F4F4F;">Wipe down all mirrors and glass fixtures</a>
                    </div>
                    <div class="price_include_txt" style="display: flex;align-items: center;">
                        <img id="" class="faq_arrow_img" src="<c:url value="/resources/images/right-arrow.png"></c:url>" alt="">
                        <a class="price_include_sub_txt" href="" style="font-size: 16px;margin-left: 15px;color: #4F4F4F;">Clean all floor surfaces</a>
                    </div>
                    <div class="price_include_txt" style="display: flex;align-items: center;margin-bottom: 20px;">
                        <img id="" class="faq_arrow_img" src="<c:url value="/resources/images/right-arrow.png"></c:url>" alt="">
                        <a class="price_include_sub_txt" href="" style="font-size: 16px;margin-left: 15px;color: #4F4F4F;">Take out garbage and recycling</a>
                    </div>

                </div>
                <div class="col-md-6 col-lg-4 price_main_include" >
                    <img id="price_include_img" src="<c:url value="/resources/images/group-18_4.png"></c:url>" alt="">
                    <p id="price_include_title">Bathroomsm</p>
                    <div class="price_include_txt" style="display: flex;align-items: center;">
                        <img id="" class="faq_arrow_img" src="<c:url value="/resources/images/right-arrow.png"></c:url>" alt="">
                        <a class="price_include_sub_txt" href="" style="font-size: 16px;margin-left: 15px;color: #4F4F4F;">Wash and sanitize the toilet, shower, tub, sink</a>
                    </div>
                    <div class="price_include_txt" style="display: flex;align-items: center;">
                        <img id="" class="faq_arrow_img" src="<c:url value="/resources/images/right-arrow.png"></c:url>" alt="">
                        <a class="price_include_sub_txt" href="" style="font-size: 16px;margin-left: 15px;color: #4F4F4F;">Dust all accessible surfaces</a>
                    </div>
                    <div class="price_include_txt" style="display: flex;align-items: center;">
                        <img id="" class="faq_arrow_img" src="<c:url value="/resources/images/right-arrow.png"></c:url>" alt="">
                        <a class="price_include_sub_txt" href="" style="font-size: 16px;margin-left: 15px;color: #4F4F4F;">Wipe down all mirrors and glass fixtures</a>
                    </div>
                    <div class="price_include_txt" style="display: flex;align-items: center;">
                        <img id="" class="faq_arrow_img" src="<c:url value="/resources/images/right-arrow.png"></c:url>" alt="">
                        <a class="price_include_sub_txt" href="" style="font-size: 16px;margin-left: 15px;color: #4F4F4F;">Clean all floor surfaces</a>
                    </div>
                    <div class="price_include_txt" style="display: flex;align-items: center;margin-bottom: 20px;">
                        <img id="" class="faq_arrow_img" src="<c:url value="/resources/images/right-arrow.png"></c:url>" alt="">
                        <a class="price_include_sub_txt" href="" style="font-size: 16px;margin-left: 15px;color: #4F4F4F;">Take out garbage and recycling</a>
                    </div>
                </div>
                <div class="col-md-6 col-lg-4 price_main_include" >
                    <img id="price_include_img" src="<c:url value="/resources/images/group-18_2.png"></c:url>" alt="">
                    <p id="price_include_title">Kitchen</p>
                    <div class="price_include_txt" style="display: flex;align-items: center;">
                        <img id="" class="faq_arrow_img" src="<c:url value="/resources/images/right-arrow.png"></c:url>" alt="">
                        <a class="price_include_sub_txt" href="" style="font-size: 16px;margin-left: 15px;color: #4F4F4F;">Dust all accessible surfaces</a>
                    </div>
                    <div class="price_include_txt" style="display: flex;align-items: center;">
                        <img id="" class="faq_arrow_img" src="<c:url value="/resources/images/right-arrow.png"></c:url>" alt="">
                        <a class="price_include_sub_txt" href="" style="font-size: 16px;margin-left: 15px;color: #4F4F4F;">Empty sink and load up dishwasher</a>
                    </div>
                    <div class="price_include_txt" style="display: flex;align-items: center;">
                        <img id="" class="faq_arrow_img" src="<c:url value="/resources/images/right-arrow.png"></c:url>" alt="">
                        <a class="price_include_sub_txt" href="" style="font-size: 16px;margin-left: 15px;color: #4F4F4F;">Wipe down exterior of stove, oven and fridge</a>
                    </div>
                    <div class="price_include_txt" style="display: flex;align-items: center;">
                        <img id="" class="faq_arrow_img" src="<c:url value="/resources/images/right-arrow.png"></c:url>" alt="">
                        <a class="price_include_sub_txt" href="" style="font-size: 16px;margin-left: 15px;color: #4F4F4F;">Clean all floor surfaces</a>
                    </div>
                    <div class="price_include_txt" style="display: flex;align-items: center;margin-bottom: 20px;">
                        <img id="" class="faq_arrow_img" src="<c:url value="/resources/images/right-arrow.png"></c:url>" alt="">
                        <a class="price_include_sub_txt" href="" style="font-size: 16px;margin-left: 15px;color: #4F4F4F;">Take out garbage and recycling</a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
    <div id="price_why_halper">
        <div style="margin-top: 32px;position: relative;">
            <p id="faq_title" style="font-size: 35px;text-align: center;font-family: Roboto;font-size: 36px;"><b>Why Helperland</b></p>
            <img id="faq_title_img" src="<c:url value="/resources/images/separator.png"></c:url>" alt="">
        </div>
        <div class="container price_include_card">
            <div class="row">
                <div class="col-lg-4">
                    <p id="price_why_halper_title1">Experienced and vetted professionals</p>
                    <p id="price_why_halper_txt1">dominate the industry in scale and scope with an adaptable, extensive network that consistently delivers exceptional results.</p>
                    <p id="price_why_halper_title1">Dedicated customer service</p>
                    <p id="price_why_halper_txt1">to our customers and are guided in all we do by their needs. The team is always happy to support you and offer all the information. you need.</p>
                </div>
                <div class="col-lg-4">
                    <img src="<c:url value="/resources/images/the-best-img-1.png"></c:url>" alt="" style="margin-left: auto;margin-right: auto;display: block;">
                </div>
                <div class="col-lg-4">
                    <p id="price_why_halper_title2">Every cleaning is insured</p>
                    <p id="price_why_halper_txt2">and seek to provide exceptional service and engage in proactive behavior. We‘d be happy to clean your homes.</p>
                    <p id="price_why_halper_title2">Secure online payment</p>
                    <p id="price_why_halper_txt2">Payment is processed securely online. Customers pay safely online and manage the booking.</p>
                </div>
            </div>

        </div>
    </div>

    <div style="position: relative;">
        <div class="text-center my-4">
            <h4 class="mb-3">GET OUR NEWSLETTER</h4>
            <form action="">
            <input type="text" name="email" placeholder="YOUR EMAIL" class="rounded-pill px-3" style="border: 1px solid gray;width: 233px;height: 40px;">
            <input type="submit" name="submit" class="rounded-pill border border-0 px-3" id="" style="width: 80px;height: 40px;background-color: #ff7b6d; padding-top: 3px; padding-bottom: 3px;  color: #ffffff;">
            </form>
            </div>
            <button type="button" class="btn btn-floating" id="timer" style="z-index: 100;"><img src="<c:url value="/resources/images/layer-598.png"></c:url>" alt=""></button>
            </section>
        
            <button type="button" class="btn btn-floating" id="btn-back-to-top" style="z-index: 100;"><i class="fas fa-chevron-circle-up"></i></button>
    </div>    

    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content" style="width: fit-content;display: block;margin-left: auto;margin-right: auto;">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Login to your account</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <form action="login" method="post">
                  <input type="email" name="email" required="required" placeholder="Email                                         &#xf007;" style="font-family:Arial, FontAwesome;margin-left: auto;display: block;margin-right: auto;width: 250px;height: 40px;" >
                  <input type="password" name="password" required="required" placeholder="Password                                  &#xf023;" style="font-family:Arial, FontAwesome;padding-right: 2px;margin-top: 15px;display: block;margin-left: auto;margin-right: auto;width: 250px;height: 40px;">
                  <div class="d-flex align-items-center" style="margin-top: 15px;">
                    <input type="checkbox" id="remember_me" name="remember_me" style="width: 15px;height: 15px;">
                    <label for="remember_me" style="color: #111111; margin-left: 5px;">Remember me</label>
                  </div>
                  <input class="rounded-pill" type="submit" value="Login" style="margin-top: 15px; width: 250px;height: 40px;background-color: #6DA9B5;border: 0px;color: #FFFFFF;">
                </form>
                <a data-bs-toggle="modal" data-bs-target="#exampleModal2" style="cursor: pointer;"><h4 style="font-family: 'Roboto',sans-serif;font-size: 14px;color: #1d7a8c;margin-top: 20px;text-align: center;">Forgot password?</h4></a>
                <h4 style="font-family: 'Roboto',sans-serif;font-size: 14px;text-align: center;">Don't have an account?<a href="user_registration.jsp"><h4 style="font-size: 14px;font-family: 'Roboto',sans-serif;color: #1d7a8c;display: inline;">Create an account</h4></a></h4>
              </div>
          </div>
        </div>
      </div>
      <div class="modal fade" id="exampleModal2" aria-hidden="true" aria-labelledby="exampleModalToggleLabel2" tabindex="-1">
		<div class="modal-dialog modal-dialog-centered">
			<div class="modal-content" style="width: fit-content;display: block;margin-left: auto;margin-right: auto;">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalToggleLabel2">Forgot Password</h5>
					<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
				</div>
				<div class="modal-body">
					<form action="forgotPassword" method="post">
						<input type="text" name="email" style="width: 250px;height: 46px;display: block;margin-left: auto;margin-right: auto;" placeholder="Email Address">
						<input type="submit" class="rounded-pill" style="width: 250px;height: 46px;background-color: #1d7a8c;color: #FFFFFF;border: 0px;margin-top: 10px;">
					</form>
				</div>
				<div class="modal-footer">
					<button style="background-color: transparent;color: #1d7a8c;border: 0px;display: block;margin-left: auto;margin-right: auto;" data-bs-target="#exampleModal" data-bs-toggle="modal" data-bs-dismiss="modal">Login now</button>
				</div>
			</div>
		</div>
	</div>

    <footer style="background-color: #111111;margin-top: 50px;">
      
        <div class="container d-flex justify-content-between flex-wrap align-items-center py-3" >
        
        <div id="footer_logo">
        <img width="100px" src="<c:url value="/resources/images/logo-small.png"></c:url>" alt="">
        </div>
        
        <div class="d-flex flex-wrap text-center justify-content-center" style="color: white;">
        <a class="px-3" href="index.jsp">HOME</a>
        <a class="px-3" href="about.jsp">ABOUT</a>
        <a class="px-3" href="#">TESTIMONIALS</a>
        <a class="px-3" href="faq.jsp">FAQS</a>
        <a class="px-3" href="#">INSURRANCE POLICY</a>
        <a class="px-3" href="#">IMPRESSUM</a>
        </div>
        
        <div id="footer_icons">
        <a class="px-2" href="#"><img src="<c:url value="/resources/images/ic-facebook.png"></c:url>" alt=""></i></a>
        
        <a class="px-2" href="#"><img src="<c:url value="/resources/images/ic-instagram.png"></c:url>" alt=""></i></a>
        </div>
        </div>
  
        <div class="container" style="height: 2px;background-color: #3D3D3D;"></div>
  
        <div class="d-flex flex-wrap text-center justify-content-center" style="color: #9BA0A3;font-size: 14px;margin-top: 22px;">
          <p>©2018 Helperland. All rights reserved.</p>
          <p> Terms and Conditions | Privacy Policy</p>
        </div>
        
        </footer>

    <script>
    function preventBack() { window.history.forward(); }  
    setTimeout("preventBack()", 0);  
    window.onunload = function () { null };
    
    window.addEventListener( "pageshow", function ( event ) {
    	  var historyTraversal = event.persisted || 
    	                         ( typeof window.performance != "undefined" && 
    	                              window.performance.navigation.type === 2 );
    	  if ( historyTraversal ) {
    	    // Handle page restore.
    	    window.location.reload(true);
    	  }
    	});
    
        let mybutton = document.getElementById("btn-back-to-top");

        window.onscroll = function () {
        scrollFunction();
        };
        

        function scrollFunction() {
        if (
        document.body.scrollTop > 20 ||
        document.documentElement.scrollTop > 20
        ) {
        mybutton.style.display = "block";
        } else {
        mybutton.style.display = "none";
        }
        }
        mybutton.addEventListener("click", backToTop);

        function backToTop() {
        document.body.scrollTop = 0;
        document.documentElement.scrollTop = 0;
        }
    </script>

    <script src="<c:url value="/resources/js/jquery.3.6.0.js"></c:url>"></script>
  <script src="<c:url value="/resources/js/bootstrap.min.js"></c:url>"></script>
</body>
</html>