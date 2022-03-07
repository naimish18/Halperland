<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Create an account</title>

    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"></c:url>">
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"></c:url>">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@500&display=swap" rel="stylesheet">

    <script src="https://kit.fontawesome.com/5602f8a8c9.js" crossorigin="anonymous"></script>
</head>
<body>
    <nav id="faqnav" class="navbar navbar-expand-lg">
            
        <a href="home.html"><img src="<c:url value="/resources/images/logo-large.png"></c:url>" id="logo-faq"  alt=""></a>
        <button style="color:white; margin-right: 15px;" class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
            <i class="fas fa-bars"></i>
        </button>
        <div class="collapse navbar-collapse" id="navbarSupportedContent">
          <ul class="navbar-nav ms-auto" id="faq-nav">
            <li class="nav-item">
              <a class="nav-link rounded-pill nav-padding greenlink" aria-current="page" href="book_service.jsp">Book now</a>
            </li>
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
            <li class="nav-item">
              <button class="nav-link border border-1 rounded-pill px-3 nav-padding greenlink" data-bs-toggle="modal" data-bs-target="#exampleModal" style="color: #FFFFFF;">Login</button>
              
            </li>
            <li class="nav-item">
              <a class="nav-link border border-1 rounded-pill nav-padding greenlink" href="become_a_provider.jsp">Become a Helper</a>
            </li>
            
          </ul>
        
          </div>
    </nav>

    <div id="price_include" style="background-color: #FFFFFF;">
        <div style="padding-top: 70px;position: relative;">
            <p id="price_title" style="font-size: 35px;text-align: center;font-family: Roboto;font-size: 36px;"><b>Create an account</b></p>
            <img id="price_title_img" src="<c:url value="/resources/images/separator.png"></c:url>" alt="" style="background-color: #FFFFFF;">
        </div>

        <div id="form_main_div" style="margin-top: 100px;width: fit-content;margin-left: auto;margin-right: auto;">
            <form action="create_user" onsubmit="return validate()" method="post">
              <div id="form_sub_div">
                <input type="text" class="form-control" id="f_name" placeholder="First name" name="FirstName" required="required">
                <input type="text" class="form-control" id="l_name" placeholder="Last name" name="LastName" required="required">
              </div>
    
              <div id="form_sub_div">
                <div id="phone_num_div">
                  <div style="width: fit-content;display: inline">
                    <select name="" id="" style="appearance: none;width: 50px;height: 46px;text-align: center;background-color: #F3F3F3;border: 1px solid #C8C8C8;">
                      <option value="48">+48</option>
                      <option value="91">+91</option>
                    </select>
                  </div>
                  <div style="width: fit-content;display: inline;margin-left: -5px;">
                    <input type="tel" class="form-control" name="Mobile" id="phone_num" placeholder="Mobile number" required="required">
                  </div>
                </div>
                <input type="email" class="form-control" name="Email" id="email" placeholder="Email address" required="required">
              </div>
              <div id="form_sub_div" class="d-lg-flex">
                <input type="password" class="form-control" id="reg_passwd" placeholder="Password" name="Password" required="required" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{6,14}$">
                <div>
                <input type="password" class="form-control" id="reg_conf_passwd" placeholder="Confirm Password" name="conf_password" required="required">
              	<div id="error" style="color:red;font-size:12px;text-align: left;margin-left: 14px"></div>
              	</div>
              </div>
              <div class="d-flex align-items-center" style="margin-top: 15px;">
                <input type="checkbox" id="remember_me" name="acceptPrivacy" style="width: 15px;height: 15px;" required="required">
                <label for="acceptPrivacy" style="color: #111111; margin-left: 5px;">I have read the <a href="#">privacy policy</a></label>
              </div>

              <button id="submit_btn" type="submit" class="btn rounded-pill" style="background-color: #6DA9B5;padding: 11px 50px;">Register</button>
              </form>
              <h4 style="font-family: 'Roboto',sans-serif;font-size: 18px;text-align: center;margin-top: 20px;">Already registered? <button data-bs-toggle="modal" data-bs-target="#exampleModal" style="color: #1D7A8C;background-color: transparent;border: 0;">Login</button></h4>
            
          </div>
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
      <img width="100px" src="<c:url value="/resources/images/logo-large.png"></c:url>" alt="">
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

    <script type="text/javascript">
    function preventBack() { window.history.forward(); }  
    setTimeout("preventBack()", 0);  
    window.onunload = function () { null };
    
        function validate(){
            const password=document.getElementById("reg_passwd");
            const conf_password=document.getElementById("reg_conf_passwd");
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