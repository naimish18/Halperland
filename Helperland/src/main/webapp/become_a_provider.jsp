<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Become A Provider</title>

    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"></c:url>">
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"></c:url>">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@500&display=swap" rel="stylesheet">

    <script src="https://kit.fontawesome.com/5602f8a8c9.js" crossorigin="anonymous"></script>

</head>
<body>
    <header class="header1">
        <nav class="navbar navbar-expand-lg">
                  
          <a class="navbar-brand ms-3" href="index.html"><img src="<c:url value="/resources/images/logo-large.png"></c:url>"  alt=""></a>
          <button style="color:white; margin-right: 15px;" class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fas fa-bars"></i>
          </button>
          <div class="collapse navbar-collapse" id="navbarSupportedContent">
            <ul class="navbar-nav ms-auto me-2">
              <li class="nav-item px-3">
                <a class="home_nav_items nav-link active border  border-1 rounded-pill  nav-padding" href="book_service.jsp" style="width: 161px;height: 40px;text-align: center;">Book a Cleaner</a>
              </li>
              <li class="nav-item px-3">
                <a class="home_nav_items nav-link nav-padding" href="prices.jsp">Prices</a>
              </li>
              <li class="nav-item px-3">
                <a class="home_nav_items nav-link nav-padding" href="#">Our Guarantee</a>
              </li>
              <li class="nav-item px-3">
                <a class="home_nav_items nav-link nav-padding" href="#">Blog</a>
              </li>
              <li class="nav-item px-3">
                <button class="home_nav_items nav-link border border-1 rounded-pill  nav-padding" data-bs-toggle="modal" data-bs-target="#exampleModal" style="width: 97px;height: 40px;text-align: center;background-color: transparent;color: #ffffff;">Login</button>
              </li>
              <li class="nav-item px-3">
                <a class="home_nav_items nav-link border border-1 rounded-pill nav-padding" href="#" style="width: 161px;height: 40px;text-align: center;">Become a Helper</a>
              </li>
              <li class="home_nav_items nav-item dropdown">
                <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
                  <img style="vertical-align: baseline;" src="<c:url value="/resources/images/ic-flag.png"></c:url>" alt="" style="width: 25px;height: 16px;">
                </a>
                <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown" >
                  <li><a class="dropdown-item" href="#"><img src="<c:url value="/resources/images/ic-flag.png"></c:url>" alt=""> <span>U.K.</span> </a></li>
                </ul>
              </li>
            </ul>
          
            </div>
        </nav>

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

        <div id="bac_register">
            <h2 style="text-align: center;padding-top: 20px;padding-bottom: 10px;">Register Now!</h2>
            <form action="save_provider" onsubmit="return validate()" method="post">
            <input type="text" class="form-control" id="bac_f_name" placeholder="First name" name="FirstName" required="required">
            <input type="text" class="form-control" id="bac_l_name" placeholder="Last name" name="LastName" required="required">
            <input type="email" class="form-control" name="Email" id="bac_email" placeholder="Email address" required="required">
            <div id="bac_phone_div">
                <div style="width: fit-content;display: inline">
                  <select name="" id="bac_ph_select" style="appearance: none;width: 50px;height: 46px;text-align: center;background-color: #F3F3F3;border: 1px solid #C8C8C8;">
                    <option value="48">+48</option>
                    <option value="91">+91</option>
                  </select>
                </div>
                <div style="width: fit-content;display: inline;margin-left: -5px;">
                  <input type="tel" class="form-control" name="Mobile" id="bac_phone_num" placeholder="Mobile number" required="required">
                </div>
            </div>
            <input type="password" class="form-control" id="bac_password" placeholder="Password" name="Password" required="required" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{6,14}$">
            <input type="password" class="form-control" id="bac_conf_password" placeholder="Confirm Password" name="conf_password" required="required">
            <div id="error" style="color:red;font-size=12px"></div>
            <div class="form-check" id="bac_check">
                <input class="form-check-input" type="checkbox" value="send_me_newsletters" id="send_news" name="SendNews">
                <label class="send_news" for="flexCheckDefault" style="color: black;">
                    Send me newsletters from Helperland
                </label>
            </div>
            <div class="form-check" id="bac_check">
                <input class="form-check-input" type="checkbox" name="privacy" value="privacyAccept" id="bac_t_and_c" required="required">
                <label class="bac_tand_c" for="flexCheckChecked" style="color: black;">
                    I accept terms and <a href="" style="color: #1FB6FF;">conditions & privacy policy</a>
                </label>
            </div>
            <div class="d-flex align-items-center" id="bac_robot_div">
                <div class="form-check" id="bac_check" style="display: block;margin-left: 0px;width: fit-content;">
                    <input class="form-check-input" type="checkbox" name="robot" value="notRobot" id="not_robot" required="required">
                    <label class="not_robot" for="flexCheckDefault" style="color: black;">
                        i'm not a robot
                    </label>
                </div>
                <div>
                    <img src="<c:url value="/resources/images/re_captcha.png"></c:url>" alt="" style="height: 60px;width: 60px;">
                </div>
            </div>
            <button type="submit" id="get_started_btn" class="btn rounded-pill" style="background-color: #29626D;"> Get Started <img src="images/arrow-white.png" alt=""></button>
        </form>
        </div>
        <a href="#bac_section2"><img src="<c:url value="/resources/images/group-18_5.png"></c:url>" alt="" style="width: 40px;height: 40px;margin-top: 40px;display: block;margin-left: auto;margin-right: auto;"></a>
    </header>
    
    <div style="position: relative; margin-left: 0;margin-right: 0;">
        <div style="position:absolute; left:0; z-index: -1;">
            <img src="<c:url value="/resources/images/blog-left-bg.png"></c:url>" alt="">
        </div>

        <section id="bac_section2">
            <h2 id="bac_sec2_title">How it works</h2>    
            <div class="container" style="margin-top: 60px;">
                <div class="row d-flex flex-wrap align-items-center justify-content-lg-between justify-content-md-center justify-content-sm-center">
                    <div id="bac_card1" class="col-lg-4">
                        <h3 class="bac_work_subtitle">Register yourself</h3>
                        <h4 class="bac_work_para" style="margin-bottom: 40px;">Provide your basic information to register yourself as a service provider.</h4>
                        <a href="" class="bac_work_para">Read more <img src="<c:url value="/resources/images/shape-2.png"></c:url>" alt=""></a>
                    </div>
                    <div id="bac_img1" class="col-lg-4">
                        <img src="<c:url value="/resources/images/group-18@2x.png"></c:url>" alt="" style="width: 260px;height: 260px;display: block;margin-left: auto;margin-right: auto;">
                    </div>
                </div>
                <div class="row d-flex flex-wrap align-items-center justify-content-lg-between justify-content-md-center justify-content-sm-center" style="margin-top: 30px;">
                    <div class="col-lg-4">
                        <img src="<c:url value="/resources/images/group-18@3x.png"></c:url>" " alt="" style="width: 260px;height: 260px;display: block;margin-left: auto;margin-right: auto;">
                    </div>
                    <div class="col-lg-4">
                        <h3 class="bac_work_subtitle">Get service requests</h3>
                        <h4 class="bac_work_para" style="margin-bottom: 40px;">You will get service requests from
                            customes depend on service area and profile.</h4>
                        <a href="" class="bac_work_para">Read more <img src="<c:url value="/resources/images/shape-2.png"></c:url>" alt=""></a>
                    </div>
                </div>
                <div class="row d-flex flex-wrap align-items-center justify-content-lg-between justify-content-md-center justify-content-sm-center" style="margin-top: 30px;">
                    <div id="bac_card1" class="col-lg-4">
                        <h3 class="bac_work_subtitle">Complete service</h3>
                        <h4 class="bac_work_para" style="margin-bottom: 40px;">Accept service requests from your customers
                            and complete your work.</h4>
                        <a href="" class="bac_work_para">Read more <img src="<c:url value="/resources/images/shape-2.png"></c:url>" alt=""></a>
                    </div>
                    <div id="bac_img1" class="col-lg-4">
                        <img src="<c:url value="/resources/images/group-18_2x.png"></c:url>"  alt="" style="width: 260px;height: 260px;display: block;margin-left: auto;margin-right: auto;">
                    </div>
                </div>

            </div>
        </section>
        <div style="position:absolute; right:0; top: 0px; z-index: -1;">
            <img src="images/blog-right-bg.png" alt="">
        </div>
    </div>

    <div style="position: relative;margin-top: 50px;" >
        <div class="text-center my-4">
            <h4 class="mb-3">GET OUR NEWSLETTER</h4>
            <form action="">
            <input type="text" name="email" placeholder="YOUR EMAIL" class="rounded-pill px-3" style="border: 1px solid gray;width: 233px;height: 40px;">
            <input type="submit" name="submit" class="rounded-pill border border-0 px-3" id="" style="width: 80px;height: 40px;background-color: #ff7b6d; padding-top: 3px; padding-bottom: 3px;  color: #ffffff;">
            </form>
        </div>    
    </div>   
    
    <footer style="background-color: #111111;margin-top: 50px;">
      
        <div class="container d-flex justify-content-between flex-wrap align-items-center py-3" >
        
        <div id="footer_logo">
        <img width="100px" src="<c:url value="/resources/images/logo-small.png"></c:url>"  alt="">
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
        <a class="px-2" href="#"><img src="<c:url value="/resources/images/ic-facebook.png"></c:url>"  alt=""></i></a>
        
        <a class="px-2" href="#"><img src="<c:url value="/resources/images/ic-instagram.png"></c:url>"  alt=""></i></a>
        </div>
        </div>
  
        <div class="container" style="height: 2px;background-color: #3D3D3D;"></div>
  
        <div class="d-flex flex-wrap text-center justify-content-center" style="color: #9BA0A3;font-size: 14px;margin-top: 22px;">
          <p>©2018 Helperland. All rights reserved.</p>
          <p> Terms and Conditions | Privacy Policy</p>
        </div>
        
      </footer>
      
      <script type="text/javascript">
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
        
        function validate(){
            const password=document.getElementById("bac_password");
            const conf_password=document.getElementById("bac_conf_password");
            const msg=document.getElementById("error");

            const pass_val=password.value.trim();
            const conf_pass_val=conf_password.value.trim();
            if(pass_val!=conf_pass_val){
                conf_password.style.border="1px solid red";
                msg.innerText="password does not match"
                return false;
            }
            else{
                conf_password.style.border="1px solid #09c372";
                msg.innerText='';
                true;
            }
        }
    </script>

    <script src="<c:url value="/resources/js/jquery.3.6.0.js"></c:url>"></script>
  <script src="<c:url value="/resources/js/bootstrap.min.js"></c:url>"></script>
</body>
</html>