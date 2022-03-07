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
    <title>FAQ</title>

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
            
        <a href="home.html"><img src="<c:url value="/resources/images/logo-large.png"></c:url>" id="logo-faq"  alt=""></a>
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
        <img id="faq_banner" src="<c:url value="/resources/images/faq-banner.png"></c:url>" alt="">
    </div>
    
    <div style="margin-top: 32px;position: relative;">
        <p id="faq_title" style="font-size: 35px;text-align: center;"><b>FAQs</b></p>
        <img id="faq_title_img" src="<c:url value="/resources/images/separator.png"></c:url>" alt="">
    </div>

    <div style="margin-top: 68px;">
        <p style="font-size: 18px;text-align: center;">Whether you are Customer or Service provider,</p>
        <p style="font-size: 18px;text-align: center;">We have tried our best to solve all your queries and questions.</p>
    </div>

    <div id="faq_main_content" style="margin-left: auto;margin-right: auto;display: block;">
    <div class="container" style="margin-top: 40px;">
        <ul class="nav nav-pills" role="tablist">
            <li class="nav-item" style="width: 50%;">
                <a id="faq_customer_btn" class="nav-link active" data-bs-toggle="pill" href="#faq_customer_text">FOR CUSTOMER</a>
            </li>
            <li class="nav-item" style="width: 50%;">
                <a id="faq_service_btn" class="nav-link" data-bs-toggle="pill" href="#faq_service_text">FOR SERVICE PROVIDER</a>
            </li>
        </ul>
    </div>
    <div class="tab-content mb-5">
        <div class="container tab-pane active" id="faq_customer_text"><br>
            <div class="faq_collapse_box" style="display: flex;align-items: center;">
                <img id="faq_arrow_img1" class="faq_arrow_img" src="<c:url value="/resources/images/right-arrow.png"></c:url>" alt="">
                <a id="faq_collapse_title1" href="#faq_collapse_txt1" data-bs-toggle="collapse" style="font-size: 16px;margin-left: 15px;color: #565656;"><b>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum nisl nunc, iaculis mattis tellus ac ut non imperdiet velit?</b></a>
            </div>
            <div id="faq_collapse_txt1" class="collapse faq_collapse_content">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id diam tincidunt, fringilla ante vitae, dapibus velit. Vivamus id tortor rhoncus, efficitur quam at, suscipit tortor. Integer fermentum convallis eros vel semper. Ut non imperdiet velit. Praesent eu dui vel lacus porta eleifend eget quis dui. Integer tempus massa in gravida tincidunt. Fusce in libero tristique, euismod nisi vel, luctus urna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec et placerat arcu. Suspendisse lacinia tristique massa. Etiam risus justo, scelerisque id arcu eu, sodales tempor eros. Aliquam efficitur pretium urna, sit amet congue risus malesuada rutrum. Donec id massa vel velit ullamcorper accumsan ut eget nisl. Fusce viverra commodo lacus, sit amet facilisis leo luctus dictum.
            </div>

            <div class="faq_collapse_box" style="display: flex;align-items: center;">
                <img id="faq_arrow_img2" class="faq_arrow_img" src="<c:url value="/resources/images/right-arrow.png"></c:url>" alt="">
                <a id="faq_collapse_title2" href="#faq_collapse_txt2" data-bs-toggle="collapse" style="font-size: 16px;margin-left: 15px;color: #565656;"><b>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum nisl nunc, iaculis mattis tellus ac ut non imperdiet velit?</b></a>
            </div>
            <div id="faq_collapse_txt2" class="collapse faq_collapse_content">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id diam tincidunt, fringilla ante vitae, dapibus velit. Vivamus id tortor rhoncus, efficitur quam at, suscipit tortor. Integer fermentum convallis eros vel semper. Ut non imperdiet velit. Praesent eu dui vel lacus porta eleifend eget quis dui. Integer tempus massa in gravida tincidunt. Fusce in libero tristique, euismod nisi vel, luctus urna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec et placerat arcu. Suspendisse lacinia tristique massa. Etiam risus justo, scelerisque id arcu eu, sodales tempor eros. Aliquam efficitur pretium urna, sit amet congue risus malesuada rutrum. Donec id massa vel velit ullamcorper accumsan ut eget nisl. Fusce viverra commodo lacus, sit amet facilisis leo luctus dictum.
            </div>

            <div class="faq_collapse_box" style="display: flex;align-items: center;">
                <img id="faq_arrow_img3" class="faq_arrow_img" src="<c:url value="/resources/images/right-arrow.png"></c:url>" alt="">
                <a id="faq_collapse_title3" href="#faq_collapse_txt3" data-bs-toggle="collapse" style="font-size: 16px;margin-left: 15px;color: #565656;"><b>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum nisl nunc, iaculis mattis tellus ac ut non imperdiet velit?</b></a>
            </div>
            <div id="faq_collapse_txt3" class="collapse faq_collapse_content">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id diam tincidunt, fringilla ante vitae, dapibus velit. Vivamus id tortor rhoncus, efficitur quam at, suscipit tortor. Integer fermentum convallis eros vel semper. Ut non imperdiet velit. Praesent eu dui vel lacus porta eleifend eget quis dui. Integer tempus massa in gravida tincidunt. Fusce in libero tristique, euismod nisi vel, luctus urna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec et placerat arcu. Suspendisse lacinia tristique massa. Etiam risus justo, scelerisque id arcu eu, sodales tempor eros. Aliquam efficitur pretium urna, sit amet congue risus malesuada rutrum. Donec id massa vel velit ullamcorper accumsan ut eget nisl. Fusce viverra commodo lacus, sit amet facilisis leo luctus dictum.
            </div>

            <div class="faq_collapse_box" style="display: flex;align-items: center;">
                <img id="faq_arrow_img4" class="faq_arrow_img" src="<c:url value="/resources/images/right-arrow.png"></c:url>" alt="">
                <a id="faq_collapse_title4" href="#faq_collapse_txt4" data-bs-toggle="collapse" style="font-size: 16px;margin-left: 15px;color: #565656;"><b>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum nisl nunc, iaculis mattis tellus ac ut non imperdiet velit?</b></a>
            </div>
            <div id="faq_collapse_txt4" class="collapse faq_collapse_content">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id diam tincidunt, fringilla ante vitae, dapibus velit. Vivamus id tortor rhoncus, efficitur quam at, suscipit tortor. Integer fermentum convallis eros vel semper. Ut non imperdiet velit. Praesent eu dui vel lacus porta eleifend eget quis dui. Integer tempus massa in gravida tincidunt. Fusce in libero tristique, euismod nisi vel, luctus urna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec et placerat arcu. Suspendisse lacinia tristique massa. Etiam risus justo, scelerisque id arcu eu, sodales tempor eros. Aliquam efficitur pretium urna, sit amet congue risus malesuada rutrum. Donec id massa vel velit ullamcorper accumsan ut eget nisl. Fusce viverra commodo lacus, sit amet facilisis leo luctus dictum.
            </div>

            <div class="faq_collapse_box" style="display: flex;align-items: center;">
                <img id="faq_arrow_img5" class="faq_arrow_img" src="<c:url value="/resources/images/right-arrow.png"></c:url>" alt="">
                <a id="faq_collapse_title5" href="#faq_collapse_txt5" data-bs-toggle="collapse" style="font-size: 16px;margin-left: 15px;color: #565656;"><b>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum nisl nunc, iaculis mattis tellus ac ut non imperdiet velit?</b></a>
            </div>
            <div id="faq_collapse_txt5" class="collapse faq_collapse_content">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id diam tincidunt, fringilla ante vitae, dapibus velit. Vivamus id tortor rhoncus, efficitur quam at, suscipit tortor. Integer fermentum convallis eros vel semper. Ut non imperdiet velit. Praesent eu dui vel lacus porta eleifend eget quis dui. Integer tempus massa in gravida tincidunt. Fusce in libero tristique, euismod nisi vel, luctus urna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec et placerat arcu. Suspendisse lacinia tristique massa. Etiam risus justo, scelerisque id arcu eu, sodales tempor eros. Aliquam efficitur pretium urna, sit amet congue risus malesuada rutrum. Donec id massa vel velit ullamcorper accumsan ut eget nisl. Fusce viverra commodo lacus, sit amet facilisis leo luctus dictum.
            </div>

            <div class="faq_collapse_box" style="display: flex;align-items: center;">
                <img id="faq_arrow_img6" class="faq_arrow_img" src="<c:url value="/resources/images/right-arrow.png"></c:url>" alt="">
                <a id="faq_collapse_title6" href="#faq_collapse_txt6" data-bs-toggle="collapse" style="font-size: 16px;margin-left: 15px;color: #565656;"><b>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum nisl nunc, iaculis mattis tellus ac ut non imperdiet velit?</b></a>
            </div>
            <div id="faq_collapse_txt6" class="collapse faq_collapse_content">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id diam tincidunt, fringilla ante vitae, dapibus velit. Vivamus id tortor rhoncus, efficitur quam at, suscipit tortor. Integer fermentum convallis eros vel semper. Ut non imperdiet velit. Praesent eu dui vel lacus porta eleifend eget quis dui. Integer tempus massa in gravida tincidunt. Fusce in libero tristique, euismod nisi vel, luctus urna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec et placerat arcu. Suspendisse lacinia tristique massa. Etiam risus justo, scelerisque id arcu eu, sodales tempor eros. Aliquam efficitur pretium urna, sit amet congue risus malesuada rutrum. Donec id massa vel velit ullamcorper accumsan ut eget nisl. Fusce viverra commodo lacus, sit amet facilisis leo luctus dictum.
            </div>

            <div class="faq_collapse_box" style="display: flex;align-items: center;">
                <img id="faq_arrow_img7" class="faq_arrow_img" src="<c:url value="/resources/images/right-arrow.png"></c:url>" alt="">
                <a id="faq_collapse_title7" href="#faq_collapse_txt7" data-bs-toggle="collapse" style="font-size: 16px;margin-left: 15px;color: #565656;"><b>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum nisl nunc, iaculis mattis tellus ac ut non imperdiet velit?</b></a>
            </div>
            <div id="faq_collapse_txt7" class="collapse faq_collapse_content">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id diam tincidunt, fringilla ante vitae, dapibus velit. Vivamus id tortor rhoncus, efficitur quam at, suscipit tortor. Integer fermentum convallis eros vel semper. Ut non imperdiet velit. Praesent eu dui vel lacus porta eleifend eget quis dui. Integer tempus massa in gravida tincidunt. Fusce in libero tristique, euismod nisi vel, luctus urna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec et placerat arcu. Suspendisse lacinia tristique massa. Etiam risus justo, scelerisque id arcu eu, sodales tempor eros. Aliquam efficitur pretium urna, sit amet congue risus malesuada rutrum. Donec id massa vel velit ullamcorper accumsan ut eget nisl. Fusce viverra commodo lacus, sit amet facilisis leo luctus dictum.
            </div>

            <div class="faq_collapse_box" style="display: flex;align-items: center;">
                <img id="faq_arrow_img8" class="faq_arrow_img" src="<c:url value="/resources/images/right-arrow.png"></c:url>" alt="">
                <a id="faq_collapse_title8" href="#faq_collapse_txt8" data-bs-toggle="collapse" style="font-size: 16px;margin-left: 15px;color: #565656;"><b>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum nisl nunc, iaculis mattis tellus ac ut non imperdiet velit?</b></a>
            </div>
            <div id="faq_collapse_txt8" class="collapse faq_collapse_content">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id diam tincidunt, fringilla ante vitae, dapibus velit. Vivamus id tortor rhoncus, efficitur quam at, suscipit tortor. Integer fermentum convallis eros vel semper. Ut non imperdiet velit. Praesent eu dui vel lacus porta eleifend eget quis dui. Integer tempus massa in gravida tincidunt. Fusce in libero tristique, euismod nisi vel, luctus urna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec et placerat arcu. Suspendisse lacinia tristique massa. Etiam risus justo, scelerisque id arcu eu, sodales tempor eros. Aliquam efficitur pretium urna, sit amet congue risus malesuada rutrum. Donec id massa vel velit ullamcorper accumsan ut eget nisl. Fusce viverra commodo lacus, sit amet facilisis leo luctus dictum.
            </div>

            <div class="faq_collapse_box" style="display: flex;align-items: center;">
                <img id="faq_arrow_img9" class="faq_arrow_img" src="<c:url value="/resources/images/right-arrow.png"></c:url>" alt="">
                <a id="faq_collapse_title9" href="#faq_collapse_txt9" data-bs-toggle="collapse" style="font-size: 16px;margin-left: 15px;color: #565656;"><b>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum nisl nunc, iaculis mattis tellus ac ut non imperdiet velit?</b></a>
            </div>
            <div id="faq_collapse_txt9" class="collapse faq_collapse_content">
                Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed id diam tincidunt, fringilla ante vitae, dapibus velit. Vivamus id tortor rhoncus, efficitur quam at, suscipit tortor. Integer fermentum convallis eros vel semper. Ut non imperdiet velit. Praesent eu dui vel lacus porta eleifend eget quis dui. Integer tempus massa in gravida tincidunt. Fusce in libero tristique, euismod nisi vel, luctus urna. Interdum et malesuada fames ac ante ipsum primis in faucibus. Donec et placerat arcu. Suspendisse lacinia tristique massa. Etiam risus justo, scelerisque id arcu eu, sodales tempor eros. Aliquam efficitur pretium urna, sit amet congue risus malesuada rutrum. Donec id massa vel velit ullamcorper accumsan ut eget nisl. Fusce viverra commodo lacus, sit amet facilisis leo luctus dictum.
            </div>

            
        </div>
        <div class="container tab-pane fade" id="faq_service_text"><br>
            This Lorem ipsum dolor sit amet consectetur adipisicing elit. Numquam deleniti harum cumque quidem quibusdam molestias?
        </div>

    </div>
</div>
    <div class="text-center my-3">
        <h4 class="mb-3" style="font-size: 18px;">GET OUR NEWSLETTER</h4>
        <form action="">
          <input type="text" name="email" placeholder="YOUR EMAIL" class="rounded-pill px-3" style="border: 1px solid gray;width: 233px;height: 40px;font-size: 14px;">
          <input type="submit" name="submit" class="rounded-pill border border-0 px-3" id="" style="font-size: 14px;width: 80px;height: 40px;background-color: #ff7b6d; padding-top: 3px; padding-bottom: 3px;  color: #ffffff;">
        </form>
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
      <a class="px-2" href="#"><img src="<c:url value="/resources/images/ic-facebook.png"></c:url>" alt=""></a>
      
      <a class="px-2" href="#"><img src="<c:url value="/resources/images/ic-instagram.png"></c:url>" alt=""></a>
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
    
        document.getElementById("faq_customer_btn").onclick=function(){
            document.getElementById("faq_service_btn").style.backgroundColor="#F6F6F6";
            document.getElementById("faq_service_btn").style.color="black";
            document.getElementById("faq_customer_btn").style.backgroundColor="#29626D";
            document.getElementById("faq_customer_btn").style.color="white";

        }
        document.getElementById("faq_service_btn").onclick=function(){
            document.getElementById("faq_customer_btn").style.backgroundColor="#F6F6F6";
            document.getElementById("faq_customer_btn").style.color="black";
            document.getElementById("faq_service_btn").style.backgroundColor="#29626D";
            document.getElementById("faq_service_btn").style.color="white";
        }
        let txt1=0;
        document.getElementById("faq_collapse_title1").onclick=function(){
            txt1=(txt1+1)%2;
            if(txt1&1){
                document.getElementById("faq_arrow_img1").src="<c:url value="/resources/images/down-arrow.png"></c:url>";
            }
            else{
                document.getElementById("faq_arrow_img1").src="<c:url value="/resources/images/right-arrow.png"></c:url>";
            }
        }
        let txt2=0;
        document.getElementById("faq_collapse_title2").onclick=function(){
            txt2=(txt2+1)%2;
            if(txt2){
                document.getElementById("faq_arrow_img2").src="<c:url value="/resources/images/down-arrow.png"></c:url>";
            }
            else{
                document.getElementById("faq_arrow_img2").src="<c:url value="/resources/images/right-arrow.png"></c:url>";
            }
        }
        let txt3=0;
        document.getElementById("faq_collapse_title3").onclick=function(){
            txt3=(txt3+1)%2;
            if(txt3){
                document.getElementById("faq_arrow_img3").src="<c:url value="/resources/images/down-arrow.png"></c:url>";
            }
            else{
                document.getElementById("faq_arrow_img3").src="<c:url value="/resources/images/right-arrow.png"></c:url>";
            }
        }
        let txt4=0;
        document.getElementById("faq_collapse_title4").onclick=function(){
            txt4=(txt4+1)%2;
            if(txt4){
                document.getElementById("faq_arrow_img4").src="<c:url value="/resources/images/down-arrow.png"></c:url>";
            }
            else{
                document.getElementById("faq_arrow_img4").src="<c:url value="/resources/images/right-arrow.png"></c:url>";
            }
        }
        let txt5=0;
        document.getElementById("faq_collapse_title5").onclick=function(){
            txt5=(txt5+1)%2;
            if(txt5){
                document.getElementById("faq_arrow_img5").src="<c:url value="/resources/images/down-arrow.png"></c:url>";
            }
            else{
                document.getElementById("faq_arrow_img5").src="<c:url value="/resources/images/right-arrow.png"></c:url>";
            }
        }
        let txt6=0;
        document.getElementById("faq_collapse_title6").onclick=function(){
            txt6=(txt6+1)%2;
            if(txt6){
                document.getElementById("faq_arrow_img6").src="<c:url value="/resources/images/down-arrow.png"></c:url>";
            }
            else{
                document.getElementById("faq_arrow_img6").src="<c:url value="/resources/images/right-arrow.png"></c:url>";
            }
        }
        let txt7=0;
        document.getElementById("faq_collapse_title7").onclick=function(){
            txt7=(txt7+1)%2;
            if(txt7){
                document.getElementById("faq_arrow_img7").src="<c:url value="/resources/images/down-arrow.png"></c:url>";
            }
            else{
                document.getElementById("faq_arrow_img7").src="<c:url value="/resources/images/right-arrow.png"></c:url>";
            }
        }
        let txt8=0;
        document.getElementById("faq_collapse_title8").onclick=function(){
            txt8=(txt8+1)%2;
            if(txt8){
                document.getElementById("faq_arrow_img8").src="<c:url value="/resources/images/down-arrow.png"></c:url>";
            }
            else{
                document.getElementById("faq_arrow_img8").src="<c:url value="/resources/images/right-arrow.png"></c:url>";
            }
        }
        let txt9=0;
        document.getElementById("faq_collapse_title9").onclick=function(){
            txt9=(txt9+1)%2;
            if(txt9){
                document.getElementById("faq_arrow_img9").src="<c:url value="/resources/images/down-arrow.png"></c:url>";
            }
            else{
                document.getElementById("faq_arrow_img9").src="<c:url value="/resources/images/right-arrow.png"></c:url>";
            }
        }

    </script>

    <script src="<c:url value="/resources/js/jquery.3.6.0.js"></c:url>"></script>
  <script src="<c:url value="/resources/js/bootstrap.min.js"></c:url>"></script>
</body>
</html>