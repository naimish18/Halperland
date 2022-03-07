<%@page import="helperland.model.User"%>
<%@page import="org.hibernate.internal.build.AllowSysOut"%>
<%@ page isELIgnored ="false" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Homepage</title>

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
<c:set var="user_type" value="<%=user_type %>" scope="session"></c:set>
  <header class="header">
    <nav class="navbar navbar-expand-lg">
      <a class="navbar-brand ms-3" href="index.jsp"><img src="<c:url value="/resources/images/logo-large.png"></c:url>" id="mylogo"  alt=""></a>
      
      <button style="color:white; margin-right: 15px;" class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <i class="fas fa-bars"></i>
      </button>
      <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav ms-auto me-2">
          <c:if test="${sessionScope.user_type!=2 }">
          <li class="nav-item px-3">
            <a class="nav-link active border border-1 rounded-pill px-3 nav-padding" aria-current="page" href="book_service.jsp">Book a Cleaner</a>
          </li>
          </c:if>
          <li class="nav-item px-3">
            <a class="nav-link nav-padding" href="prices.jsp">Prices</a>
          </li>
          <li class="nav-item px-3">
            <a class="nav-link nav-padding" href="#">Our Guarantee</a>
          </li>
          <li class="nav-item px-3">
            <a class="nav-link nav-padding" href="#">Blog</a>
          </li>
          <c:if test="${sessionScope.id ==0 }">
          <li class="nav-item px-3">
            <button class="nav-link border border-1 rounded-pill px-3 nav-padding" data-bs-toggle="modal" data-bs-target="#exampleModal" style="background-color: transparent;color: #FFFFFF;">Login</button>
            <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
              <div class="modal-dialog modal-dialog-centered">
                <div class="modal-content" style="width: fit-content;display: block;margin-left: auto;margin-right: auto;">
                    <div class="modal-header">
                      <h5 class="modal-title" id="exampleModalLabel">Login to your account</h5>
                      <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
                    </div>
                    <div class="modal-body">
                      <form action="login" method="post">
                        <input type="email" name="email" placeholder="Email                                         &#xf007;" style="font-family:Arial, FontAwesome;margin-left: auto;display: block;margin-right: auto;width: 250px;height: 40px;" >
                        <input type="password" name="password" placeholder="Password                                  &#xf023;" style="font-family:Arial, FontAwesome;padding-right: 2px;margin-top: 15px;display: block;margin-left: auto;margin-right: auto;width: 250px;height: 40px;">
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
          </li>
          </c:if>
          <c:if test="${sessionScope.user_type!=2 }">
          <li class="nav-item px-3">
            <a class="nav-link border border-1 rounded-pill px-3 nav-padding" href="become_a_provider.jsp">Become a Helper</a>
          </li>
          </c:if>
          <li class="nav-item dropdown">
            <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-bs-toggle="dropdown" aria-expanded="false">
              <img style="vertical-align: baseline;" src="<c:url value="/resources/images//ic-flag.png"></c:url>" alt="">
            </a>
            <ul class="dropdown-menu dropdown-menu-end" aria-labelledby="navbarDropdown" >
              <li ><a class="dropdown-item" href="#" ><img src="<c:url value="/resources/images//ic-flag.png"></c:url>" alt=""> <span>India</span> </a></li>
              <li><a class="dropdown-item" href="#"><img src="<c:url value="/resources/images//ic-flag.png"></c:url>" alt=""> <span>U.K.</span> </a></li>
              <li><a class="dropdown-item" href="#"><img src="<c:url value="/resources/images//ic-flag.png"></c:url>" alt=""> <span>U.S.A.</span> </a></li>
            </ul>
          </li>
          <c:if test="${sessionScope.id >0}">
          	<li class="nav-item px-3">
          		<div id="ups_noti_icon" class="nav-item">
                    <i id="ups_notification" class="fas fa-bell" style="color: white;font-size: 25px; padding: 15px 15px;margin-left: 10px;"></i>
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
	              <li><a class="dropdown-item" href="new-service-request" style="font-size: 18px;"><span>My Dashboard</span></a></li>
	          </c:if>
	          <c:if test="${sessionScope.user_type!=2 }">
              	<li><a class="dropdown-item" href="customer_settings.jsp" style="font-size: 18px;"><span>My settings</span></a></li>
              </c:if>
              <c:if test="${sessionScope.user_type==2 }">
              	<li><a class="dropdown-item" href="#" style="font-size: 18px;"><span>My settings</span></a></li>
              </c:if>
              <li><a class="dropdown-item" href="logout" style="font-size: 18px;"><span>Logout</span></a></li>
            </ul>
          </li>
          </c:if>
        </ul>
      
        </div>
  </nav>

    <div class="text-center text-lg-start ps-lg-5 col-lg-5 heading">
      <h1 class="mb-3">Lorem, ipsum dolor.</h1>
      <div><img class="me-2 mb-0" src="images/ic-check.png" alt=""><p class="d-inline mb-0">  Lorem, ipsum dolor sit amet consectetur adipisicing.</p>
      </div>
      <div><img class="me-2 my-0" src="images/ic-check.png" alt=""><p class="d-inline my-0">Lorem, ipsum dolor sit amet consectetur adipisicing.</p>
      </div>
      <div><img class="me-2" src="images/ic-check.png" alt=""><p class="d-inline">Lorem, ipsum dolor sit amet consectetur adipisicing.</p>
      </div>

    </div>
	
	<c:if test="${sessionScope.user_type!=2 }">
    <div class="text-center mt-5">
    <a class="rounded-pill border border-1 px-3 py-2" style="background-color: #0061729a; color: #ffffff;width: 225px;height: 54px;" href="book_service.jsp">Let's Book a Cleaner</a>
    </div>
	</c:if>

  <div class="mt-5 d-flex justify-content-center flex-wrap align-items-baseline" id="steps">
  <div id="step_img" class="text-center">
    <img class="mb-3" src="<c:url value="/resources/images/step-1.png"></c:url>" alt="">
    <p style="size: 20px;">Enter your postcode</p>
  </div>
  <div id="arrow" class="mx-md-3 mx-lg-5 step-arrow">
    <img src="<c:url value="/resources/images/step-arrow-1.png"></c:url>" alt="">
  </div>
  <div id="step_img" class="text-center">
    <img class="mb-2" src="<c:url value="/resources/images/step-2.png"></c:url>" alt="">
    <p style="size: 20px;">Select your plan</p>
  </div>
  <div id="arrow" class="mx-md-3 mx-lg-5 step-arrow">
    <img  src="<c:url value="/resources/images/step-arrow-1-copy.png"></c:url>" alt="">
  </div>
  <div id="step_img" class="text-center">
    <img class="mb-3" src="<c:url value="/resources/images/step-3.png"></c:url>" alt="">
    <p style="size: 20px;">Pay securely online</p>
  </div>
  <div id="arrow" class="mx-md-3 mx-lg-5 step-arrow">
    <img  src="<c:url value="/resources/images/step-arrow-1.png"></c:url>" alt="">
  </div>
  <div id="step_img" class="text-center">
    <img class="mb-2" src="<c:url value="/resources/images/step-4.png"></c:url>" alt="">
    <p style="size: 20px;">Enjoy amazing services</p>
  </div>
  </div>

  <div class="text-center mt-lg-3" >
  <a href="#why_helper" ><img src="<c:url value="/resources/images/group-18_5.png"></c:url>" alt=""></i></a>
  </div>
</header>

<main>

  <section class="my-5">
  <h1 class="text-center mt-5 mb-5 " id="why_helper"  style="size: 40px;">Why Helperland</h1>
  <div class="d-flex flex-row flex-wrap justify-content-center align-items-stretch">

  <div class="mx-3 mb-3 text-center" style="max-width: 300px;">
    <img class="rounded-circle shadow mb-4" src="<c:url value="/resources/images/helper-img-1.png"></c:url>" alt="" width="275px" height="275px">
    <h2 class="mb-4" style="size: 30px;">Experience & Vetted Professionals</h2>
    <p style="size: 17px;">Lorem ipsum dolor sit amet, consectetur adipisicing elit. In dicta doloremque corporis saepe neque incidunt.</p>
  </div>

  <div class="mx-3 mb-5 text-center" style="max-width: 300px;">
    <img class="rounded-circle shadow mb-4"  src="<c:url value="/resources/images/group-23.png"></c:url>" alt="" width="275px" height="275px">
    <h2 class="mb-4" style="size: 30px;">Secure Online Payment</h2>
    <p style="size: 17px;"></p>>Lorem ipsum dolor sit amet, consectetur adipisicing elit. In dicta doloremque corporis saepe neque incidunt.</p>
  </div>

  <div class="mx-3 mb-3 text-center" style="max-width: 300px;">
    <img class="rounded-circle shadow mb-4" src="<c:url value="/resources/images/group-24.png"></c:url>" alt="" width="275px" height="275px">
    <h2 class="mb-4" style="size: 30px;">Dedicated Customer Service</h2>
    <p style="size: 17px;"></p>>Lorem ipsum dolor sit amet, consectetur adipisicing elit. In dicta doloremque corporis saepe neque incidunt.</p>
  </div>

  </div>
  </section>

  <div style="position: relative; margin-left: 0;margin-right: 0;">
  <div style="position:absolute; left:0; bottom:-3rem; z-index: 0;">
  <img src="<c:url value="/resources/images/blog-left-bg.png"></c:url>" alt="">
  </div>

  <section>

  <div class="container mt-5">
  <div class="row mt-5 d-flex flex-wrap justify-content-center align-items-center">
    <div class="col-lg-5" id="group_text" >
      <h2 style="size: 30px;">
        Lorem ipsum, dolor sit amet consectetur adipisicing.
      </h2>
      <p style="size: 18px;">
        Lorem ipsum dolor sit amet, consectetur adipisicing elit. Ab minima omnis quod? Quaerat, repellat sit?
      </p>
      <p style="size: 18px;">Lorem ipsum dolor sit amet consectetur adipisicing elit. Quibusdam, deserunt consectetur, aperiam harum est delectus ipsa excepturi sunt, quod dolorem id! Enim illo ipsa magni.</p>
      <p style="size: 18px;">Lorem ipsum dolor sit amet, consectetur adipisicing elit.</p>
    </div>
    <div class="col-lg-3 ms-lg-5 mt-0 pt-0" >
      <img src="<c:url value="/resources/images/group-36.png"></c:url>" id="group_img"  alt="" >
    </div>
  </div>
  </div>

  </section>

  <section class="my-5">
  <h1 class="text-center my-5"  style="size: 40px;">Our Blog</h1>
  <div class="container my-5">
  <div class="row d-flex justify-content-center align-items-stretch">
    
    <div class="col-lg-3 mx-3 my-3">
      <div class="card border border-0 shadow-lg" >
        <img src="<c:url value="/resources/images/group-28.png"></c:url>" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">Lorem ipsum dolor sit.</h5>
          <h6 class="date">April 19, 2021</h6>
          <p class="card-text">Lorem ipsum, dolor sit amet consectetur adipisicing elit. deserunt sequi excepturi, autem veniam.</p>
          <a href="#" class="blacklink">Read the Post <img src="images/shape-2.png" alt=""></a>
        </div>
      </div>
    </div>

    <div class="col-lg-3 mx-3 my-3">
      <div class="card border border-0 shadow-lg" >
        <img src="<c:url value="/resources/images/group-29.png"></c:url>" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">Lorem ipsum dolor sit amet.</h5>
          <h6 class="date">April 19, 2021</h6>
          <p class="card-text">Lorem ipsum, dolor sit amet consectetur adipisicing elit. deserunt sequi excepturi, autem veniam.</p>
          <a href="#" class="blacklink">Read the Post <img src="images/shape-2.png" alt=""></a>
        </div>
      </div>
    </div>

    <div class="col-lg-3 mx-3 my-3">
      <div class="card border border-0 shadow-lg" >
        <img src="<c:url value="/resources/images/group-30.png"></c:url>" class="card-img-top" alt="...">
        <div class="card-body">
          <h5 class="card-title">Lorem ipsum dolor sit amet.</h5>
          <h6 class="date">April 19, 2021</h6>
          <p class="card-text">Lorem ipsum, dolor sit amet consectetur adipisicing elit. deserunt sequi excepturi, autem veniam.</p>
          <a href="#" class="blacklink">Read the Post <img src="images/shape-2.png" alt=""></a>
        </div>
      </div>
    </div>
  </div>
  </div>
  </section>

  <div style="position:absolute; right:0; bottom: -3rem; z-index: -1;">
  <img src="<c:url value="/resources/images/blog-right-bg.png"></c:url>" alt="">
  </div>

  </div>

  <section class="py-5" style="background-color:#f4f5f8; position: relative;">
  <h1 class="text-center mb-5">What Our Customers Say</h1>
  <div class="mx-auto d-flex flex-wrap justify-content-center">
  <div class="col-lg-3 mx-3 my-3 position-relative">
    <div class="position-absolute" style="top:1rem; right: 1rem; z-index: 10;"><img src="<c:url value="/resources/images/message.png"></c:url>" alt=""></div>
    <div class="card d-flex flex-column p-3" style="border-left: 3px solid 
    #1d7a8c;">
        
      <div class="d-flex flex-row profile pt-4 mt-auto mb-2"> 
        <img src="<c:url value="/resources/images/group-31.png"></c:url>" alt="" class="rounded-circle">
        <div class="d-flex flex-column ps-2">
            <div class="name"><h5 class="mb-0 pb-0">Lary Watson</h5></div>
            <p class="text-muted designation">Manchester</p>
        </div>
      </div>
      <div class="testimonial mb-1"><p> Lorem ipsum, dolor sit amet consectetur adipisicing elit. Magni dolores molestias veniam inventore itaque eius iure omnis. </p>
      <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eveniet.</p></div>
      <div ><a href="#" class="blacklink">Read the Post <img src="<c:url value="/resources/images/shape-2.png"></c:url>" alt=""></a></div>
    </div>
  </div>

  <div class="col-lg-3 mx-3 my-3 position-relative">
    <div class="position-absolute" style="top:1rem; right: 1rem; z-index: 10;"><img src="<c:url value="/resources/images/message.png"></c:url>" alt=""></div>
    <div class="card d-flex flex-column p-3" style="border-left: 3px solid 
    #1d7a8c;">
      
      <div class="d-flex flex-row profile pt-4 mt-auto mb-2"> 
        <img src="<c:url value="/resources/images/group-32.png"></c:url>" alt="" class="rounded-circle">
        <div class="d-flex flex-column ps-2">
            <div class="name"><h5 class="mb-0 pb-0">John Smith</h5></div>
            <p class="text-muted designation">Manchester</p>
        </div>
      </div>
      <div class="testimonial"><p> Lorem ipsum, dolor sit amet consectetur adipisicing elit. Magni dolores molestias veniam inventore itaque eius iure omnis. </p>
      <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eveniet.</p></div>
      <div><a href="#" class="blacklink">Read the Post <img src="<c:url value="/resources/images/shape-2.png"></c:url>" alt=""></a></div>
    </div>
  </div>

  <div class="col-lg-3 mx-3 my-3 position-relative">
    <div class="position-absolute" style="top:1rem; right: 1rem; z-index: 10;"><img src="<c:url value="/resources/images/message.png"></c:url>" alt=""></div>
    <div class="card d-flex flex-column p-3" style="border-left: 3px solid 
    #1d7a8c;">
      
      <div class="d-flex flex-row profile pt-4 mt-auto mb-2"> 
        <img src="<c:url value="/resources/images/group-33.png"></c:url>" alt="" class="rounded-circle">
        <div class="d-flex flex-column ps-2">
            <div class="name"><h5 class="mb-0 pb-0">Lars Johnson</h5></div>
            <p class="text-muted designation">Manchester</p>
        </div>
      </div>
      <div class="testimonial mb-1"><p> Lorem ipsum, dolor sit amet consectetur adipisicing elit. Magni dolores molestias veniam inventore itaque eius iure omnis. </p>
      <p>Lorem ipsum dolor sit, amet consectetur adipisicing elit. Eveniet.</p></div>
      <div ><a href="#" class="blacklink">Read the Post <img src="<c:url value="/resources/images/shape-2.png"></c:url>" alt=""></a></div>
    </div>
  </div>
  </div>

  <div class="text-center my-3">
  <h4 class="mb-3">GET OUR NEWSLETTER</h4>
  <form action="">
    <input type="text" name="email" placeholder="YOUR EMAIL" class="rounded-pill px-3" style="border: 1px solid gray;width: 233px;height: 40px;">
    <input type="submit" name="submit" class="rounded-pill border border-0 px-3" id="" style="width: 80px;height: 40px;background-color: #ff7b6d; padding-top: 3px; padding-bottom: 3px;  color: #ffffff;">
  </form>
  </div>
  <button type="button" class="btn btn-floating" id="timer" style="z-index: 100;"><img src="<c:url value="/resources/images/layer-598.png"></c:url>" alt=""></button>
  </section>

  <button type="button" class="btn btn-floating" id="btn-back-to-top" style="z-index: 100;"><i class="fas fa-chevron-circle-up"></i></button>

</main>

<footer style="background-color: #111111;">

<div class="container d-flex justify-content-between flex-wrap align-items-center py-3">

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

<div id="privacy_text" class="text-center mb-0 py-2" style="position:relative; color:white; background-color: #292929;">
<p class="mb-0 py-2 d-inline" style="color: #FFFFFF;">Lorem ipsum dolor sit consectetur elit. Accusantium, nostrum.
<a href="#" style="color: #6EABEF;">privacy policy</a>
</p>
<input id="btn_ok" type="submit" name="ok" value="OK" class="rounded-pill px-3 border border-0 " style="background-color: yellow; position: absolute; right: 15px;">
</div>

</footer>

<script>
function preventBack() { window.history.forward(); }  
setTimeout("preventBack()", 0);  
window.onunload = function () { null };

  document.getElementById("btn_ok").onclick=function(){
    document.getElementById("privacy_text").style.display="none";
  }

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