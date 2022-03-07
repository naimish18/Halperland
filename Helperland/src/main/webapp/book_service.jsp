<%@page import="helperland.model.City"%>
<%@page import="java.text.NumberFormat.Style"%>
<%@page import="helperland.model.Useraddress"%>
<%@page import="java.util.List"%>
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
    <title>Book Now</title>

    <link rel="stylesheet" href="<c:url value="/resources/css/bootstrap.min.css"></c:url>">
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"></c:url>">
    <script src="<c:url value="/resources/js/jquery.3.6.0.js"></c:url>"></script>

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@500&display=swap" rel="stylesheet">

    <script src="https://kit.fontawesome.com/5602f8a8c9.js" crossorigin="anonymous"></script>
</head>
<body>
<% User u_id=new User();
/* List<Useraddress> user_addresses=null */;
if(session.getAttribute("user")!=null){
	u_id=(User)session.getAttribute("user");
	/* user_addresses=(List<Useraddress>)session.getAttribute("addresses"); */
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
            <li class="nav-item">
              <a class="nav-link rounded-pill nav-padding greenlink" aria-current="page" href="#">Book now</a>
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
             <c:if test="${sessionScope.id ==0 }">
            <li class="nav-item">
                <button id="login_btn" class="nav-link border border-1 rounded-pill px-3 nav-padding greenlink" data-bs-toggle="modal" data-bs-target="#exampleModal" style="color: #FFFFFF;">Login</button>
              
            </li>
            </c:if>
            <li class="nav-item">
              <a class="nav-link border border-1 rounded-pill nav-padding greenlink" href="become_a_provider.jsp">Become a Helper</a>
            </li>
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
	              <li><a class="dropdown-item" href="#" style="font-size: 18px;"><span>To overview</span></a></li>
	              <li><a class="dropdown-item" href="#" style="font-size: 18px;"><span>My settings</span></a></li>
	              <li><a class="dropdown-item" href="logout" style="font-size: 18px;"><span>Logout</span></a></li>
	            </ul>
          	</li>
          </c:if>
            
          </ul>
        
          </div>
    </nav>
    
    <div class="container-fluid px-0 py-0">
        <img id="faq_banner" src="<c:url value="/resources/images/book-service-banner.jpg"></c:url>" alt="">
    </div>
    
    <div style="margin-top: 32px;position: relative;">
        <p id="faq_title" style="font-size: 35px;text-align: center;"><b>Set up your cleaning service</b></p>
        <img id="faq_title_img" src="<c:url value="/resources/images/separator.png"></c:url>" alt="">
    </div>

    <section>
        <div id="bs_main_div">
            <div class="row">
                <div class="col-md-8">
                    <ul class="nav nav-pills" role="tablist">
                        <li class="nav_list nav-item">
                            <a id="bs_setup_service" class="nav-link active" data-bs-toggle="pill" href="#bs_setup_content">
                                <div class="d-flex justify-content-center align-items-center">
                                    <img src="<c:url value="/resources/images/setup-service-white.png"></c:url>" alt="">
                                    <h4 id="bs_setup_service_txt">Setup Service</h4>
                                </div>
                            </a>
                            <div id="bs_setup_down" class="triangle-down"></div>
                        </li>
                        <li class="nav_list nav-item" >
                            <a id="bs_shedule_plan" class="nav-link" data-bs-toggle="pill" href="#bs_shedule_content">
                                <div class="d-flex justify-content-center align-items-center">
                                    <img id="bs_shedule_img" src="<c:url value="/resources/images/schedule.png"></c:url>"alt="">
                                    <h4 id="bs_shedule_service_txt">Shedule & Plan</h4>
                                </div>
                            </a>
                            <div id="bs_shedule_down" class="triangle-down"></div>
                        </li>
                        <li class="nav_list nav-item">
                            <a id="bs_details" class="nav-link" data-bs-toggle="pill" href="#bs_details_content">
                                <div class="d-flex justify-content-center align-items-center">
                                    <img id="bs_details_img" src="<c:url value="/resources/images/details.png"></c:url>" alt="">
                                    <h4 id="bs_details_service_txt">Your Details</h4>
                                </div>
                            </a>
                            <div id="bs_details_down" class="triangle-down"></div>
                        </li>
                        <li class="nav_list nav-item">
                            <a id="bs_payment" class="nav-link" data-bs-toggle="pill" href="#bs_payment_content">
                                <div class="d-flex justify-content-center align-items-center">
                                    <img id="bs_payment_img" src="<c:url value="/resources/images/payment.png"></c:url>" alt="">
                                    <h4 id="bs_details_payment_txt">Make Payment</h4>
                                </div>
                            </a>
                            <div id="bs_payment_down" class="triangle-down"></div>
                        </li>
                    </ul>
                    <div class="tab-content">
                        <form id="serviceFrom" action="saveService" method="post"></form>
                        <div class="tab-pane active mt-4" id="bs_setup_content">
                        	<form action="check_zipcode" method="post" id="zipcode_form">
	                            <label for="postal_code" style="font-size: 18px;font-family: 'Roboto',sans-serif;width: 100%;">Enter your Postal code</label>
	                            <input id="postal_code" name="zipcode" type="number" required placeholder="Postal code" style="margin-top: 10px;height: 46px;width: 300px;">
	                            <button type="submit" id="check_availability"  class="rounded-pill" style="height: 46px;margin-left: 10px;width: 200px;border: 0px;color: #FFFFFF;background-color: #1D7A8C;font-family: 'Roboto',sans-serif;">Check Availability</button>
                        	</form>
                        	<div style="color:red" id="msg"></div>
                        </div>
                        <div class="tab-pane fade mt-4" id="bs_shedule_content">
                            <div class="row" style="border-bottom: 1px solid #c9c9c9;padding-bottom: 30px;">
                                <div class="col-md-6">
                                    <label for="service_date" style="font-size: 18px;font-family: 'Roboto',sans-serif;width: 100%;">When do you need the cleaner?</label>
                                    <input type="date" form="serviceFrom" name="service_date" id="service_date" style="height: 46px;margin-top: 10px;">
                                    <input type="time" form="serviceFrom" name="service_time" id="service_time" style="height: 46px;margin-top: 10px; margin-left: 5px;">
                                	<div id="date_msg" style="color:red"></div>
                                </div>
                                <div class="col-md-6">
                                    <label for="service_req_time" style="font-size: 18px;font-family: 'Roboto',sans-serif;width: 100%;">How long do you need your cleaner to stay?</label>
                                    <select form="serviceFrom" name="service_req_time" id="service_req_time" style="height: 46px;margin-top: 10px;">
                                		<option value="3">3.0 Hrs</option>
                                		<option value="3.5">3.5 Hrs</option>
                                		<option value="4">4.0 Hrs</option>
                                		<option value="4.5">4.5 Hrs</option>
                                		<option value="5">5.0 Hrs</option>
                                		<option value="5.5">5.5 Hrs</option>
                                		<option value="6">6.0 Hrs</option>
                                		<option value="6.5">6.5 Hrs</option>
                                		<option value="7">7.0 Hrs</option>
                                		<option value="7.5">7.5 Hrs</option>
                                		<option value="8">8.0 Hrs</option>
                                		<option value="8.5">8.5 Hrs</option>
                                		<option value="9">9.0 Hrs</option>
                                		<option value="9.5">9.5 Hrs</option>
                                		<option value="10">10.0 Hrs</option>
                                		<option value="10.5">10.5 Hrs</option>
                                		<option value="11">11.0 Hrs</option>
                                		<option value="11.5">11.5 Hrs</option>
                                		<option value="12">12.0 Hrs</option>
                                	</select>
                                </div>
                            </div>
                            <h4 style="font-size: 18px;font-family: 'Roboto',sans-serif;width: 100%;margin-top: 30px;">Extra Services</h4>
                            <div class="row" style="border-bottom: 1px solid #c9c9c9;padding-bottom: 30px;">
                                <input type="checkbox" form="serviceFrom" name="cabinate" id="cb_cabinate" style="display: none;">
                                <div class="col-sm-6 col-md-4 col-lg-2">
                                    <label for="cb_cabinate" style="display: block;margin-left: auto;margin-right: auto;">
                                    <div id="bs_border1" class="mt-5">
                                        <img id="bs_img1" src="<c:url value="/resources/images/3.png"></c:url>" alt="">
                                    </div>
                                    <h4 style="font-size: 16px;font-family: 'Roboto',sans-serif;margin-top: 10px;text-align: center;">Inside cabinate</h4>
                                    </label>
                                </div>
                                
                                <input type="checkbox" form="serviceFrom" name="fridge" id="cb_fridge" style="display: none;">
                                <div class="col-sm-6 col-md-4 col-lg-2">
                                    <label for="cb_fridge" style="display: block;margin-left: auto;margin-right: auto;">
                                    <div id="bs_border2" class="mt-5">
                                        <img id="bs_img2" src="<c:url value="/resources/images/5.png"></c:url>" alt="">
                                    </div>
                                    <h4 style="font-size: 16px;font-family: 'Roboto',sans-serif;margin-top: 10px;text-align: center;">Inside fridge</h4>
                                    </label>
                                </div>
                                
                                <input type="checkbox" form="serviceFrom" name="oven" id="cb_oven" style="display: none;">
                                <div class="col-sm-6 col-md-4 col-lg-2">
                                    <label for="cb_oven" style="display: block;margin-left: auto;margin-right: auto;">
                                    <div id="bs_border3" class="mt-5">
                                        <img id="bs_img3" src="<c:url value="/resources/images/4.png"></c:url>" alt="">
                                    </div>
                                    <h4 style="font-size: 16px;font-family: 'Roboto',sans-serif;margin-top: 10px;text-align: center;">Inside oven</h4>
                                    </label>
                                </div>

                                <input type="checkbox" form="serviceFrom" name="laundry" id="cb_laundry" style="display: none;">
                                <div class="col-sm-6 col-md-4 col-lg-2">
                                    <label for="cb_laundry" style="display: block;margin-left: auto;margin-right: auto;">
                                    <div id="bs_border4" class="mt-5">
                                        <img id="bs_img4" src="<c:url value="/resources/images/2.png"></c:url>" alt="">
                                    </div>
                                    <h4 style="font-size: 16px;font-family: 'Roboto',sans-serif;margin-top: 10px;text-align: center;">Laundry wash & dry</h4>
                                    </label>
                                </div>
                                
                                <input type="checkbox" form="serviceFrom" name="windows" id="cb_windows" style="display: none;">
                                <div class="col-sm-6 col-md-4 col-lg-2">
                                    <label for="cb_windows" style="display: block;margin-left: auto;margin-right: auto;">
                                    <div id="bs_border5" class="mt-5">
                                        <img id="bs_img5" src="<c:url value="/resources/images/1.png"></c:url>" alt="">
                                    </div>
                                    <h4 style="font-size: 16px;font-family: 'Roboto',sans-serif;margin-top: 10px;text-align: center;">Interior windows</h4>
                                    </label>
                                </div>
                            </div>
                            <label for="comments" style="font-size: 18px;font-family: 'Roboto',sans-serif;width: 100%;margin-top: 30px;">Comments</label>
                            <textarea form="serviceFrom" name="comments" id="comments" placeholder="Comments" style="width: 100%;height: 100px;"></textarea>
                            <input form="serviceFrom" type="checkbox" name="have_pets" id="have_pets">
                            <label for="have_pets"> I have pets at home</label>
                            <div style="width: 100%;height: 1px;background-color: #c9c9c9;margin-top: 30px;"></div>
                            <button id="shedule_continue" class="rounded-pill" style="color: #FFFFFF;width: 200px;height: 46px;border: 0px;background-color: #1D7A8C;margin-left: auto;display: block;margin-top: 20px;">Continue</button>
                        </div>
                        <div class="tab-pane fade" id="bs_details_content">
                            <h4 style="font-size: 18px;font-family: 'Roboto',sans-serif;width: 100%;margin-top: 30px;font-weight: bold;">Enter your contect details, so we can serve you in batter way!</h4>
                            <!-- <div class="d-flex align-items-center" style="border: 1px solid #c9c9c9;padding: 10px;">
                                <input  form="serviceFrom" type="radio" value=1 name="address1" id="address1" style="width: 20px;height: 20px;cursor: pointer;margin-left: 10px;">
                                <label for="address1" style="cursor: pointer;width: 100%;padding-left: 15px;font-size: 18px;font-family: 'Roboto',sans-serif;">
                                    <div><b>Address:</b> xyz 55,abc 990452</div>
                                    <div><b>Phone number:</b> 999888777</div>
                                </label>
                            </div> -->
                            <div id="refresh_div">
                            <%
							List<Useraddress> user_addresses=null;
							if(session.getAttribute("user")!=null){
								user_addresses=(List<Useraddress>)session.getAttribute("addresses");
							}
							%>
                            <c:forEach var="address" items="<%=user_addresses %>" varStatus="status">
                            	<div class="d-flex align-items-center" style="border: 1px solid #c9c9c9;padding: 10px;">
                                <input  form="serviceFrom" type="radio" value=${address.getAddressId() } name="address1" id="address1" style="width: 20px;height: 20px;cursor: pointer;margin-left: 10px;">
                                <label for="address1" style="cursor: pointer;width: 100%;padding-left: 15px;font-size: 18px;font-family: 'Roboto',sans-serif;">
                                    <div><b>Address:</b> ${address.getAddressLine1()} ${address.getAddressLine2()} ,${address.getCity() } ${address.getPostalCode() }</div>
                                    <div><b>Phone number:</b> ${address.getMobile() }</div>
                                </label>
                            </div>
                            </c:forEach>
                            </div>
                            <div id="address_msg" style="color: red"></div>
                            <input type="radio" checked value=0 name="address1" id="address1" style="width: 20px;height: 20px;cursor: pointer;margin-left: 10px;display: none;">
                            <div class="mt-4">
                                <button id="add_btn" class="rounded-pill" style="padding: 10px 15px;font-size: 18px; font-family: 'Roboto',sans-serif;border: 1px solid #1D7A8C;background-color: transparent;color: #1D7A8C;">+Add New Address</button>
                                <div class="pb-3" id="inline_form">
                                    <form id="address_form" action="addAddress" method="post">
                                        <div class="row">
                                            <div class="col-md-6 pt-1 pb-0 p-5">
                                                <label for="street_name" class="inline_form_labels">Street name</label>
                                                <input required type="text" name="AddressLine1" id="street_name" style="width: 100%;height: 46px;">
                                            </div>
                                            <div class="col-md-6 pt-1 pb-0 p-5">
                                                <label for="house_number" class="inline_form_labels">House number</label>
                                                <input required type="text" name="AddressLine2" id="house_number" style="width: 100%;height: 46px;">
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 pt-1 pb-0 p-5">
                                                <label for="postal_code" class="inline_form_labels">Postal code</label>
                                                <input required disabled="disabled" type="text" name="PostalCode" id="postal_code1" style="width: 100%;height: 46px;">
                                            </div>
                                            <div class="col-md-6 pt-1 pb-0 p-5">
                                                <label for="city" class="inline_form_labels">City</label>
                                                <div id="city_div">
                                                <input disabled="disabled" type="text" name="City" value=<%=session.getAttribute("city") %> id="city" style="width: 100%;height: 46px;">
                                            	</div>
                                            </div>
                                        </div>
                                        <div class="row">
                                            <div class="col-md-6 pt-1 pb-0 p-5">
                                                <label for="phone_num" class="inline_form_labels" style="width: 100%;">Phone number</label>
                                                <div class="row" style="margin-left: 0px;">
                                                    <div class="col-2 p-0">
                                                        <select class="inline_form_labels" name="country_code" id="select_cc">
                                                            <option class="inline_form_labels" value="49">+49</option>
                                                            <option class="inline_form_labels" value="91">+91</option>
                                                        </select>
                                                    </div>
                                                    <div class="col-10" style="padding-left: 0px;">
                                                        <input required type="text" name="Mobile" id="phone_num" style="width: 100%;height: 46px;margin-right: 50px">
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        <div class="mt-3">
                                            <button type="submit" id="save_btn" class="rounded-pill" style="height: 46px;width: 100px;margin-left: 35px;background-color: #1D7A8C;color: #FFFFFF;border: 0px;font-family: 'Roboto',sans-serif;font-size: 18px;">Save</button>
                                            <button id="cancel_btn" class="rounded-pill" style="height: 46px;width: 100px;margin-left: 35px;background-color: #F8F8F8;color: #8a8a8a;border: 1px solid #8a8a8a;font-family: 'Roboto',sans-serif;font-size: 18px;">Cancel</button>
                                        </div>
                                    </form>
                                </div>
                                <div class="mt-3">
                                    <input form="serviceFrom" type="checkbox" name="send_invoice" id="send_invoice">
                                    <label for="send_invoice"> Send invoice on this address</label>
                                </div>
                                <div class="mt-2" style="width: 100%;height: 2px;background-color: #a0a0a0;"></div>
                            </div>
                            <button id="continue_details" class="rounded-pill" style="color: #FFFFFF;width: 200px;height: 46px;border: 0px;background-color: #1D7A8C;margin-left: auto;display: block;margin-top: 20px;">Continue</button>

                        </div>
                        <div class="tab-pane fade" id="bs_payment_content">
                            <h4 style="font-size: 18px;font-family: 'Roboto',sans-serif;width: 100%;margin-top: 30px;font-weight: bold;">Pay securely with Helperland payment gateway!</h4>
                            <label for="promocode" style="font-size: 18px;width: 100%;">Promo code (optional)</label>
                            <input form="serviceFrom" type="text" name="promocode" id="promocode" placeholder="Promo code (optional)" style="margin-top: 10px;height: 46px;width: 300px;">
                            <button class="rounded-pill" style="background-color: transparent;font-size: 18px;width: 100px;height: 46px;font-size: 18px;border: 1px solid #1D7A8C;color: #1D7A8C;margin-left: 10px;"> Apply</button>
                            <div class="mt-3" style="width: 100%;height: 2px;background-color: #c2c2c2;"></div>
                            <div class="d-flex justify-content-between mt-4 mb-4 p-2" style="box-shadow: 0px 0px 5px #bebebe;border-radius: 4px;">
                                <input form="serviceFrom" id="card_no" required type="text" name="card_number" placeholder="Card number" style="border: 0px;font-size: 18px;font-family: 'Roboto',sans-serif;height: 46px;width: 50%;">
                                <div>
                                    <input form="serviceFrom" type="text" required name="card_date" id="card_date" placeholder="MM/YY" style="border: 0px;font-size: 18px;font-family: 'Roboto',sans-serif;height: 46px;width: 100px;">
                                    <input form="serviceFrom" type="text" required name="cvc" id="cvc" placeholder="CVC" style="border: 0px;font-size: 18px;font-family: 'Roboto',sans-serif;height: 46px;width: 100px;">
                                </div>
                            </div>
                            <div class="mt-3 mb-4" style="width: 100%;height: 2px;background-color: #c2c2c2;"></div>
                            <div class="d-flex">
                                <input form="serviceFrom" type="checkbox" required name="accept_condition" id="accept_condition" style="width: 25px;height: 25px;">
                                <label for="accept_condition" style="margin-left: 10px;">I accepted <a href="#">terms and conditions</a>, the <a href="#">cancellation policy</a> and the <a href="#">privacy policy</a>. I confirm that Helperland starts to execute the contract before the expiry of the withdrawal period and I lose my right of withdrawal as a consumer with full performance of the contract.</label>
                            </div>    
                            <div class="mt-3 mb-4" style="width: 100%;height: 2px;background-color: #c2c2c2;"></div>
                            <input type="text" form="serviceFrom" id="service_hours" name="service_hours"  value="3" style="display: none;">
                            <input type="text" form="serviceFrom" id="service_extra_hours" name="service_extra_hours" value="0" style="display: none;">
                            <button form="serviceFrom" type="submit" class="rounded-pill" style="color: #FFFFFF;width: 200px;height: 46px;border: 0px;background-color: #1D7A8C;margin-left: auto;display: block;margin-top: 20px;">Complete Booking</button>
                        </div>
                    </div>
                </div>

                <div id="bs_side_content" class="col-md-4">
                    <div class="d-flex align-items-center" style="font-family: 'Roboto',sans-serif;font-size: 22px;background-color: #1D7A8C;height: 50px;padding-left: 15px;color: #FFFFFF;">Payment Summary</div>
                    <div style="padding-top: 15px;padding-left: 15px;padding-right: 15px;border-bottom: 2px solid #9e9e9e;box-shadow: 0px 5px 10px #9e9e9e;">
                        <h4 style="font-family: 'Roboto',sans-serif;font-size: 22px;">Duration</h4>
                        <div class="d-flex justify-content-between">
                            <h4 style="font-family: 'Roboto',sans-serif;font-size: 20px;">Basic</h4>
                            <h4 id="basic_time" style="font-family: 'Roboto',sans-serif;font-size: 20px;">3 Hrs</h4>
                        </div>
                        <div style="height: 2px; background-color: #c9c9c9"></div>
                        <div class="d-flex justify-content-between mt-2">
                            <h4 style="font-family: 'Roboto',sans-serif;font-size: 20px;">Total Service Time</h4>
                            <h4 id="total_time" style="font-family: 'Roboto',sans-serif;font-size: 20px;">3 Hrs</h4>
                        </div>
                        <div style="height: 2px; background-color: #c9c9c9;margin-left: -15px;margin-right: -15px;"></div>
                        <div class="d-flex justify-content-between mt-3 mb-2">
                            <h4 style="font-family: 'Roboto',sans-serif;font-size: 20px;">Per cleaning</h4>
                            <h4 id="per_clean" style="font-family: 'Roboto',sans-serif;font-size: 20px;">75,00 &#8364;</h4>
                        </div>
                        <div style="height: 2px; background-color: #c9c9c9;margin-left: -15px;margin-right: -15px;"></div>
                        <div class="d-flex justify-content-between align-items-center mt-3 mb-2">
                            <h4 style="font-family: 'Roboto',sans-serif;font-size: 20px; color: #1D7A8C;">Total Payment</h4>
                            <h4 id="total_pay" style="font-family: 'Roboto',sans-serif;font-size: 35px;color: #1D7A8C;">75,00 &#8364;</h4>
                        </div>
                        <div style="background-color: #F3F3F3;color: #8F8F8F;margin-left: -15px;margin-right: -15px;padding: 10px 15px;">
                            <img src="<c:url value="/resources/images/smiley.png"></c:url>" alt=""> See what is always included
                        </div>
                    </div>
                    <h3 style="font-family: 'Roboto',sans-serif;text-align: center;margin-top: 20px;">Questions</h3>
                    <div style="border-bottom: 1px solid #6D6D6D;padding-bottom: 10px;">
                        <a id="bs_collapse_title1" href="#bs_collapse_txt1" data-bs-toggle="collapse" style="color: #6D6D6D;">
                            <img id="bs_arrow1" src="<c:url value="/resources/images/keyboard-right-arrow-button.png"></c:url>" alt=""> What's included in a cleaning?
                        </a>
                        <div id="bs_collapse_txt1" class="collapse" style="padding-left: 10px; color: #8a8a8a;">
                            Bedroom, Living Room & Common Areas,Bathrooms,Kitchen,Extras
                        </div>
                    </div>
                    <div style="border-bottom: 1px solid #6D6D6D;padding-bottom: 10px;margin-top: 10px;">
                        <a id="bs_collapse_title2" href="#bs_collapse_txt2" data-bs-toggle="collapse" style="color: #6D6D6D;">
                            <img id="bs_arrow2" src="<c:url value="/resources/images/keyboard-right-arrow-button.png"></c:url>" alt=""> Which Helperland professional will come to my place?
                        </a>
                        <div id="bs_collapse_txt2" class="collapse" style="padding-left: 10px; color: #8a8a8a;">
                            Helperland has a vast network of experienced, top-rated cleaners. Based on the time and date of your request, we work to assign the best professional available.Like working with a specific pro? Add them to your Pro Team from the mobile app and they'll be requested first for all future bookings.You will receive an email with details about your professional prior to your appointment.
                        </div>
                    </div>
                    <div style="border-bottom: 1px solid #6D6D6D;padding-bottom: 10px;margin-top: 10px;margin-bottom: 20px;">
                        <a id="bs_collapse_title3" href="#bs_collapse_txt3" data-bs-toggle="collapse" style="color: #6D6D6D;">
                            <img id="bs_arrow3" src="<c:url value="/resources/images/keyboard-right-arrow-button.png"></c:url>" alt=""> Can I skip or reschedule bookings?
                        </a>
                        <div id="bs_collapse_txt3" class="collapse" style="padding-left: 10px; color: #8a8a8a;">
                            You can reschedule any booking for free at least 24 hours in advance of the scheduled start time. If you need to skip a booking within the minimum commitment, we will credit the value of the booking to your account. You can use this credit on future cleanings and other Helperland services.
                        </div>
                    </div>
                    <a href="faq.jsp" style="color: #1D7A8C;font-family: 'Roboto',sans-serif;font-size: 18px;">For more help</a>
                </div>
            </div>
            
        </div>
    </section>
 
    <div class="modal fade" id="exampleModal" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content" style="width: fit-content;display: block;margin-left: auto;margin-right: auto;">
              <div class="modal-header">
                <h5 class="modal-title" id="exampleModalLabel">Login to your account</h5>
                <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
              </div>
              <div class="modal-body">
                <form id="login_from" action="login" method="post">
                  <input type="email" name="email" placeholder="Email                                         &#xf007;" style="font-family:Arial, FontAwesome;margin-left: auto;display: block;margin-right: auto;width: 250px;height: 40px;" >
                  <input type="password" name="password" placeholder="Password                                  &#xf023;" style="font-family:Arial, FontAwesome;padding-right: 2px;margin-top: 15px;display: block;margin-left: auto;margin-right: auto;width: 250px;height: 40px;">
                  <div class="d-flex align-items-center" style="margin-top: 15px;">
                    <input type="checkbox" id="remember_me" name="remember_me" style="width: 15px;height: 15px;">
                    <label for="remember_me" style="color: #111111; margin-left: 5px;">Remember me</label>
                  </div>
                  <input class="rounded-pill" type="submit" value="Login" style="margin-top: 15px; width: 250px;height: 40px;background-color: #6DA9B5;border: 0px;color: #FFFFFF;">
                </form>
                <a data-bs-toggle="modal" data-bs-target="#exampleModal2" style="cursor: pointer;"><h4 style="font-family: 'Roboto',sans-serif;font-size: 14px;color: #1d7a8c;margin-top: 20px;text-align: center;">Forgot password?</h4></a>
                <h4 style="font-family: 'Roboto',sans-serif;font-size: 14px;text-align: center;">Don't have an account?<a href="user_registration.html"><h4 style="font-size: 14px;font-family: 'Roboto',sans-serif;color: #1d7a8c;display: inline;">Create an account</h4></a></h4>
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

    <script type="text/javascript">
    
    window.addEventListener( "pageshow", function ( event ) {
  	  var historyTraversal = event.persisted || 
  	                         ( typeof window.performance != "undefined" && 
  	                              window.performance.navigation.type === 2 );
  	  if ( historyTraversal ) {
  	    // Handle page restore.
  	    window.location.reload(true);
  	  }
  	});
    	
    $(document).ready(function () {
    	$('#check_avail').prop("disables",true);
    	console.log("ready")
    	 $('#address_form').on('submit', function(e) {
    	        e.preventDefault();
    	        $.ajax({
    	        	
    	            url : $(this).attr('action') || window.location.pathname,
    	            type: $(this).attr('method'),
    	            data: $(this).serialize(),
    	            success: function (data) {
    	            	$( "#refresh_div" ).load(document.URL + " #refresh_div" );
    	            },
    	            error: function (jXHR, textStatus, errorThrown) {
    	            	$( "#refresh_div" ).load(document.URL+" #refresh_div" );
    	            }
    	        });
    	    });
    	
    	 $('#login_from').on('submit', function(e) {
	        e.preventDefault();
	        $.ajax({
	        	
	            url : $(this).attr('action') || window.location.pathname,
	            type: $(this).attr('method'),
	            data: $(this).serialize(),
	            success: function (data) {
	            	location.reload();
	            },
	            error: function (jXHR, textStatus, errorThrown) {
	            }
	        });
	    });
    	 
    	 
    	  $('#zipcode_form').on('submit', function(e) {
 	        e.preventDefault();
 	        $.ajax({
 	        	
 	            url : $(this).attr('action') || window.location.pathname,
 	            type: $(this).attr('method'),
 	            contentType: "application/json",
 	            data: $('#postal_code').val(),
 	            crossDomain: true,
 	            success: function (xml,textStatus,xhr) {
 	            	if(xhr.status==200){
 	            		console.log("good");
 	            		document.getElementById("bs_shedule_plan").style.pointerEvents="visible";
 	            		document.getElementById("bs_shedule_plan").click();
 	            		document.getElementById("msg").innerHTML="";
 	            		$("#refresh_div").load(document.URL +  '  #refresh_div');
 	            		$("#postal_code1").val($('#postal_code').val());
 	            		$("#city_div").load(document.URL +  '  #city_div');
 	            		
 	            	}
 	            	else{
 	            		console.log(xhr.status,"xhr status1");
 	            		document.getElementById("msg").innerHTML="service is not available in your area";
 	            	}
 	            },
 	            error: function (xml, textStatus, xhr) {
 	            	console.log(xhr.status,"xhr status2");
 	            	document.getElementById("msg").innerHTML="service is not available in your area";
 	            	
 	            }
 	        });
 	    }); 
    });
    
		document.getElementById("check_availability").onclick=function(){
			var u_id=<%= session.getAttribute("user_id") %>
			if(u_id==null){
				document.getElementById("login_btn").click();
			}
		}
        <%-- document.getElementById("check_availability").onclick=function(){
            var val=document.getElementById("postal_code").value;
            var u_id=<%= session.getAttribute("user_id") %>
            if(val!="" && u_id !=null){
                console.log(val)
                document.getElementById("postal_code").disabled=true;
                document.getElementById("bs_shedule_plan").style.pointerEvents="visible";
                var mydate=document.getElementById("service_date");
                var mytime=document.getElementById("service_time");
                document.getElementById("bs_shedule_plan").click();
                var today=new Date();
                mydate.value=today.toISOString().substr(0, 10);
                if(today.getMinutes()<10){
                	mytime.value=today.getHours()+":0"+today.getMinutes();
                }
                else{
                	mytime.value=today.getHours()+":"+today.getMinutes();
                }       
            }
            else if(u_id==null){
            	document.getElementById("login_btn").click();
            }
        } --%>
        
        document.getElementById("shedule_continue").onclick=function(){
        	var u_id=<%= session.getAttribute("user_id")%>
            var date=document.getElementById("service_date").value;
            var service_time=document.getElementById("service_time").value;
            var service_req_time=document.getElementById("service_req_time").value;

            // var cabinate=document.getElementById("cb_cabinate").checked;
            // var fridge=document.getElementById("cb_fridge").checked;
            // var oven=document.getElementById("cb_oven").checked;
            // var laundry=document.getElementById("cb_laundry").checked;
            // var windows=document.getElementById("cb_windows").checked;

            // console.log(cabinate,fridge,oven,laundry,windows);
            
            if(date!="" && service_time!="" && service_req_time!="" && u_id!=null){
                document.getElementById("bs_details").style.pointerEvents="visible";
                document.getElementById("bs_details").click();
            }
            else if(u_id==null){
            	document.getElementById("login_btn").click();
            }
            else if(date==""){
            	document.getElementById("service_date").focus();
            }
            else if(service_time==""){
            	document.getElementById("service_time").focus();
            }
            if(date=="" || service_time==""){
            	document.getElementById("date_msg").innerHTML="date and time is required";
            	
            }
            else{
            	document.getElementById("date_msg").innerHTML="";
            }
        }
        document.getElementById("continue_details").onclick=function(){
            var add=document.querySelector('input[name="address1"]:checked').value;
            console.log(add)
            if(add>0){
                document.getElementById("bs_payment").style.pointerEvents="visible";
                document.getElementById("bs_payment").click();
                document.getElementById("address_msg").innerHTML="";
            }
            else{
            	document.getElementById("address_msg").innerHTML="address is required";
            }
        }


        document.getElementById("bs_setup_service").onclick=function(){
            document.getElementById("bs_setup_down").style.display="block";
            document.getElementById("bs_shedule_down").style.display="none";
            document.getElementById("bs_details_down").style.display="none";
            document.getElementById("bs_payment_down").style.display="none";

            document.getElementById("bs_shedule_plan").style.pointerEvents="none";
            document.getElementById("bs_details").style.pointerEvents="none";
            document.getElementById("bs_payment").style.pointerEvents="none";

            document.getElementById("bs_shedule_service_txt").style.color="#646464";
            document.getElementById("bs_shedule_plan").style.backgroundColor="#F3F3F3";
            document.getElementById("bs_shedule_img").src="<c:url value="/resources/images/schedule.png"></c:url>";

            document.getElementById("bs_details_service_txt").style.color="#646464";
            document.getElementById("bs_details").style.backgroundColor="#F3F3F3";
            document.getElementById("bs_details_img").src="<c:url value="/resources/images/details.png"></c:url>";

            document.getElementById("bs_details_payment_txt").style.color="#646464";
            document.getElementById("bs_payment").style.backgroundColor="#F3F3F3";
            document.getElementById("bs_payment_img").src="<c:url value="/resources/images/payment.png"></c:url>";
        }

        document.getElementById("bs_shedule_plan").onclick=function(){
            document.getElementById("bs_setup_down").style.display="none";
            document.getElementById("bs_shedule_down").style.display="block";
            document.getElementById("bs_details_down").style.display="none";
            document.getElementById("bs_payment_down").style.display="none";
            document.getElementById("bs_shedule_service_txt").style.color="#FFFFFF";
            document.getElementById("bs_shedule_plan").style.backgroundColor="#1D7A8C";
            document.getElementById("bs_shedule_img").src="<c:url value="/resources/images/schedule-white.png"></c:url>";

            document.getElementById("bs_details").style.pointerEvents="none";
            document.getElementById("bs_payment").style.pointerEvents="none";
            
            document.getElementById("bs_details_service_txt").style.color="#646464";
            document.getElementById("bs_details").style.backgroundColor="#F3F3F3";
            document.getElementById("bs_details_img").src="<c:url value="/resources/images/details.png"></c:url>"

            document.getElementById("bs_details_payment_txt").style.color="#646464";
            document.getElementById("bs_payment").style.backgroundColor="#F3F3F3";
            document.getElementById("bs_payment_img").src="<c:url value="/resources/images/payment.png"></c:url>";
        }

        document.getElementById("bs_details").onclick=function(){
            document.getElementById("bs_setup_down").style.display="none";
            document.getElementById("bs_shedule_down").style.display="none";
            document.getElementById("bs_details_down").style.display="block";
            document.getElementById("bs_payment_down").style.display="none";
            document.getElementById("bs_details_service_txt").style.color="#FFFFFF";
            document.getElementById("bs_details").style.backgroundColor="#1D7A8C";
            document.getElementById("bs_details_img").src="<c:url value="/resources/images/details-white.png"></c:url>";

            document.getElementById("bs_payment").style.pointerEvents="none";

            document.getElementById("bs_details_payment_txt").style.color="#646464";
            document.getElementById("bs_payment").style.backgroundColor="#F3F3F3";
            document.getElementById("bs_payment_img").src="<c:url value="/resources/images/payment.png"></c:url>";
        }

        document.getElementById("bs_payment").onclick=function(){
            document.getElementById("bs_setup_down").style.display="none";
            document.getElementById("bs_shedule_down").style.display="none";
            document.getElementById("bs_details_down").style.display="none";
            document.getElementById("bs_payment_down").style.display="block";
            document.getElementById("bs_details_payment_txt").style.color="#FFFFFF";
            document.getElementById("bs_payment").style.backgroundColor="#1D7A8C";
            document.getElementById("bs_payment_img").src="<c:url value="/resources/images/payment-white.png"></c:url>";
        }

        var num1=0;
        document.getElementById("bs_collapse_title1").onclick=function(){
            num1=(num1+1)%2;
            if(num1&1){
                document.getElementById("bs_arrow1").style.transform='rotate(0deg)';
                document.getElementById("bs_arrow1").style.transition='0.5s';
            }
            else{
                document.getElementById("bs_arrow1").style.transform='rotate(-90deg)';
            }
        }
        var num2=0;
        document.getElementById("bs_collapse_title2").onclick=function(){
            num2=(num2+1)%2;
            if(num2&1){
                document.getElementById("bs_arrow2").style.transform='rotate(0deg)';
                document.getElementById("bs_arrow2").style.transition='0.5s';
            }
            else{
                document.getElementById("bs_arrow2").style.transform='rotate(-90deg)';
            }
        }
        var num3=0;
        document.getElementById("bs_collapse_title3").onclick=function(){
            num3=(num3+1)%2;
            if(num3&1){
                document.getElementById("bs_arrow3").style.transform='rotate(0deg)';
                document.getElementById("bs_arrow3").style.transition='0.5s';
            }
            else{
                document.getElementById("bs_arrow3").style.transform='rotate(-90deg)';
            }
        }
        
        /* $("#service_req_time").change(function(event){
        	$("#total_pay").html(($("#total_time").html+$("#service_req_time").val()-3)*25+' &#8364;');
        	$("#per_clean").html($("#service_req_time").val()*25+' &#8364;');
        	$("#total_time").html($("#service_req_time").val()+' Hrs');
        	$("#basic_time").html($("#service_req_time").val()+' Hrs');
        }); */
        document.getElementById("service_req_time").onchange=function(){
        	var time=document.getElementById("total_time").innerHTML.split(' ');
        	document.getElementById("total_time").innerText=String(Number(time[0])+Number(document.getElementById("service_req_time").value)-3)+' Hrs';
        	document.getElementById("basic_time").innerText=String(Number(time[0])+Number(document.getElementById("service_req_time").value)-3)+' Hrs';
        	var time=document.getElementById("total_time").innerHTML.split(' ');
        	document.getElementById("total_pay").innerHTML=String(Number(time[0])*Number(25))+" &#8364;";
        	document.getElementById("per_clean").innerHTML=String(Number(time[0])*Number(25))+" &#8364;";
        }

        var count1=0;
        document.getElementById("bs_border1").onclick=function(){
            count1=(count1+1)%2;
            if (count1){
            	var time=document.getElementById("total_time").innerHTML.split(' ');
            	document.getElementById("total_time").innerText=String(Number(time[0])+Number(0.5))+' Hrs';
            	document.getElementById("basic_time").innerText=String(Number(time[0])+Number(0.5))+' Hrs';
            	document.getElementById("service_hours").value=String(Number(time[0])+Number(0.5));
            	document.getElementById("service_extra_hours").value=String(Number(document.getElementById("service_extra_hours").value)+Number(0.5));
            	var time=document.getElementById("total_time").innerHTML.split(' ');
            	document.getElementById("total_pay").innerHTML=String(Number(time[0])*Number(25))+" &#8364;";
            	document.getElementById("per_clean").innerHTML=String(Number(time[0])*Number(25))+" &#8364;";
                document.getElementById("bs_border1").style.border="2px solid #1D7A8C";
                document.getElementById("bs_img1").src="<c:url value="/resources/images/3-green.png"></c:url>";
            }
            else{
            	var time=document.getElementById("total_time").innerHTML.split(' ');
            	document.getElementById("total_time").innerText=String(Number(time[0])-Number(0.5))+' Hrs';
            	document.getElementById("basic_time").innerText=String(Number(time[0])-Number(0.5))+' Hrs';
            	document.getElementById("service_hours").value=String(Number(time[0])-Number(0.5));
            	document.getElementById("service_extra_hours").value=String(Number(document.getElementById("service_extra_hours").value)-Number(0.5));
            	var time=document.getElementById("total_time").innerHTML.split(' ');
            	document.getElementById("total_pay").innerHTML=String(Number(time[0])*Number(25))+" &#8364;";
            	document.getElementById("per_clean").innerHTML=String(Number(time[0])*Number(25))+" &#8364;";
                document.getElementById("bs_border1").style.border="2px solid #646464";
                document.getElementById("bs_img1").src="<c:url value="/resources/images/3.png"></c:url>";
            }
        }
        var count2=0;
        document.getElementById("bs_border2").onclick=function(){
            count2=(count2+1)%2;
            if (count2){
            	var time=document.getElementById("total_time").innerHTML.split(' ');
            	document.getElementById("total_time").innerText=String(Number(time[0])+Number(0.5))+' Hrs';
            	document.getElementById("basic_time").innerText=String(Number(time[0])+Number(0.5))+' Hrs';
            	document.getElementById("service_hours").value=String(Number(time[0])+Number(0.5));
            	document.getElementById("service_extra_hours").value=String(Number(document.getElementById("service_extra_hours").value)+Number(0.5));
            	var time=document.getElementById("total_time").innerHTML.split(' ');
            	document.getElementById("total_pay").innerHTML=String(Number(time[0])*Number(25))+" &#8364;";
            	document.getElementById("per_clean").innerHTML=String(Number(time[0])*Number(25))+" &#8364;";
                document.getElementById("bs_border2").style.border="2px solid #1D7A8C";
                document.getElementById("bs_img2").src="<c:url value="/resources/images/5-green.png"></c:url>";
            }
            else{
            	var time=document.getElementById("total_time").innerHTML.split(' ');
            	document.getElementById("total_time").innerText=String(Number(time[0])-Number(0.5))+' Hrs';
            	document.getElementById("basic_time").innerText=String(Number(time[0])-Number(0.5))+' Hrs';
            	document.getElementById("service_hours").value=String(Number(time[0])-Number(0.5));
            	document.getElementById("service_extra_hours").value=String(Number(document.getElementById("service_extra_hours").value)-Number(0.5));
            	var time=document.getElementById("total_time").innerHTML.split(' ');
            	document.getElementById("total_pay").innerHTML=String(Number(time[0])*Number(25))+" &#8364;";
            	document.getElementById("per_clean").innerHTML=String(Number(time[0])*Number(25))+" &#8364;";
                document.getElementById("bs_border2").style.border="2px solid #646464";
                document.getElementById("bs_img2").src="<c:url value="/resources/images/5.png"></c:url>";
            }
        }
        var count3=0;
        document.getElementById("bs_border3").onclick=function(){
            count3=(count3+1)%2;
            if (count3){
            	var time=document.getElementById("total_time").innerHTML.split(' ');
            	document.getElementById("total_time").innerText=String(Number(time[0])+Number(0.5))+' Hrs';
            	document.getElementById("basic_time").innerText=String(Number(time[0])+Number(0.5))+' Hrs';
            	document.getElementById("service_hours").value=String(Number(time[0])+Number(0.5));
            	document.getElementById("service_extra_hours").value=String(Number(document.getElementById("service_extra_hours").value)+Number(0.5));
            	var time=document.getElementById("total_time").innerHTML.split(' ');
            	document.getElementById("total_pay").innerHTML=String(Number(time[0])*Number(25))+" &#8364;";
            	document.getElementById("per_clean").innerHTML=String(Number(time[0])*Number(25))+" &#8364;";
                document.getElementById("bs_border3").style.border="2px solid #1D7A8C";
                document.getElementById("bs_img3").src="<c:url value="/resources/images/4-green.png"></c:url>";
            }
            else{
            	var time=document.getElementById("total_time").innerHTML.split(' ');
            	document.getElementById("total_time").innerText=String(Number(time[0])-Number(0.5))+' Hrs';
            	document.getElementById("basic_time").innerText=String(Number(time[0])-Number(0.5))+' Hrs';
            	document.getElementById("service_hours").value=String(Number(time[0])-Number(0.5));
            	document.getElementById("service_extra_hours").value=String(Number(document.getElementById("service_extra_hours").value)-Number(0.5));
            	var time=document.getElementById("total_time").innerHTML.split(' ');
            	document.getElementById("total_pay").innerHTML=String(Number(time[0])*Number(25))+" &#8364;";
            	document.getElementById("per_clean").innerHTML=String(Number(time[0])*Number(25))+" &#8364;";
                document.getElementById("bs_border3").style.border="2px solid #646464";
                document.getElementById("bs_img3").src="<c:url value="/resources/images/4.png"></c:url>";
            }
        }
        var count4=0;
        document.getElementById("bs_border4").onclick=function(){
            count4=(count4+1)%2;
            if (count4){
            	var time=document.getElementById("total_time").innerHTML.split(' ');
            	document.getElementById("total_time").innerText=String(Number(time[0])+Number(0.5))+' Hrs';
            	document.getElementById("basic_time").innerText=String(Number(time[0])+Number(0.5))+' Hrs';
            	document.getElementById("service_hours").value=String(Number(time[0])+Number(0.5));
            	document.getElementById("service_extra_hours").value=String(Number(document.getElementById("service_extra_hours").value)+Number(0.5));
            	var time=document.getElementById("total_time").innerHTML.split(' ');
            	document.getElementById("total_pay").innerHTML=String(Number(time[0])*Number(25))+" &#8364;";
            	document.getElementById("per_clean").innerHTML=String(Number(time[0])*Number(25))+" &#8364;";
                document.getElementById("bs_border4").style.border="2px solid #1D7A8C";
                document.getElementById("bs_img4").src="<c:url value="/resources/images/2-green.png"></c:url>";
            }
            else{
            	var time=document.getElementById("total_time").innerHTML.split(' ');
            	document.getElementById("total_time").innerText=String(Number(time[0])-Number(0.5))+' Hrs';
            	document.getElementById("basic_time").innerText=String(Number(time[0])-Number(0.5))+' Hrs';
            	document.getElementById("service_hours").value=String(Number(time[0])-Number(0.5));
            	document.getElementById("service_extra_hours").value=String(Number(document.getElementById("service_extra_hours").value)-Number(0.5));
            	var time=document.getElementById("total_time").innerHTML.split(' ');
            	document.getElementById("total_pay").innerHTML=String(Number(time[0])*Number(25))+" &#8364;";
            	document.getElementById("per_clean").innerHTML=String(Number(time[0])*Number(25))+" &#8364;";
                document.getElementById("bs_border4").style.border="2px solid #646464";
                document.getElementById("bs_img4").src="<c:url value="/resources/images/2.png"></c:url>";
            }
        }
        var count5=0;
        document.getElementById("bs_border5").onclick=function(){
            count5=(count5+1)%2;
            if (count5){
            	var time=document.getElementById("total_time").innerHTML.split(' ');
            	document.getElementById("total_time").innerText=String(Number(time[0])+Number(0.5))+' Hrs';
            	document.getElementById("basic_time").innerText=String(Number(time[0])+Number(0.5))+' Hrs';
            	document.getElementById("service_hours").value=String(Number(time[0])+Number(0.5));
            	document.getElementById("service_extra_hours").value=String(Number(document.getElementById("service_extra_hours").value)+Number(0.5));
            	var time=document.getElementById("total_time").innerHTML.split(' ');
            	document.getElementById("total_pay").innerHTML=String(Number(time[0])*Number(25))+" &#8364;";
            	document.getElementById("per_clean").innerHTML=String(Number(time[0])*Number(25))+" &#8364;";
                document.getElementById("bs_border5").style.border="2px solid #1D7A8C";
                document.getElementById("bs_img5").src="<c:url value="/resources/images/1-green.png"></c:url>";
            }
            else{
            	var time=document.getElementById("total_time").innerHTML.split(' ');
            	document.getElementById("total_time").innerText=String(Number(time[0])-Number(0.5))+' Hrs';
            	document.getElementById("basic_time").innerText=String(Number(time[0])-Number(0.5))+' Hrs';
            	document.getElementById("service_hours").value=String(Number(time[0])-Number(0.5));
            	document.getElementById("service_extra_hours").value=String(Number(document.getElementById("service_extra_hours").value)-Number(0.5));
            	var time=document.getElementById("total_time").innerHTML.split(' ');
            	document.getElementById("total_pay").innerHTML=String(Number(time[0])*Number(25))+" &#8364;";
            	document.getElementById("per_clean").innerHTML=String(Number(time[0])*Number(25))+" &#8364;";
                document.getElementById("bs_border5").style.border="2px solid #646464";
                document.getElementById("bs_img5").src="<c:url value="/resources/images/1.png"></c:url>";
            }
        }

        document.getElementById("add_btn").onclick=function(){
            document.getElementById("inline_form").style.display="block";
            document.getElementById("add_btn").style.display="none";
            document.getElementById("address_msg").innerHTML="";
        }
        document.getElementById("save_btn").onclick=function(){
            var sn=document.getElementById("street_name").value;
            var hn=document.getElementById("house_number").value;
            var pc=document.getElementById("postal_code").value;
            var pn=document.getElementById("phone_num").value;
            var city=document.getElementById("city").value;

            if(sn!="" && hn!="" && pc!="" && pn!="" && city!=""){
                document.getElementById("inline_form").style.display="none";
                document.getElementById("add_btn").style.display="block";
            }
        }
        document.getElementById("cancel_btn").onclick=function(){
            document.getElementById("inline_form").style.display="none";
            document.getElementById("add_btn").style.display="block";
        }
        function preventBack() { window.history.forward(); }  
        setTimeout("preventBack()", 0);  
        window.onunload = function () { null };
        
    </script>

    
  <script src="<c:url value="/resources/js/bootstrap.min.js"></c:url>"></script>
</body>
</html>