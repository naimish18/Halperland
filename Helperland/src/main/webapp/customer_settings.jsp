<%@page import="helperland.model.User"%>
<%@page import="helperland.model.Useraddress"%>
<%@page import="java.util.List"%>
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
    <title>Customer Settings</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
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
%>
    <header>
        <div class="d-flex justify-content-between align-items-center" id="ups_navbar">
            <div style="padding: 5px 15px">
                <a href="">
                    <img src="<c:url value="/resources/images/logo-small.png"></c:url>" alt="">
                </a>
            </div>
            <div class="d-flex align-items-center" id="ups_nav_content">
                <div id="ups_fs_nav">
                    <a class="ups_nav_items rounded-pill" href="prices.jsp" style="font-size: 17px;font-family: 'Roboto',sans-serif;">Prices & services</a>
                    <a class="ups_nav_items rounded-pill" href="#" style="font-size: 17px;font-family: 'Roboto',sans-serif;">Warranty</a>
                    <a class="ups_nav_items rounded-pill" href="#" style="font-size: 17px;font-family: 'Roboto',sans-serif;">Blog</a>
                    <a class="ups_nav_items rounded-pill" href="contact.jsp" style="font-size: 17px;font-family: 'Roboto',sans-serif;">Contact</a>
                </div>
                <div id="ups_noti_icon" class="nav-item">
                    <i id="ups_notification" class="fas fa-bell" style="color: white;font-size: 25px; padding: 15px 15px;margin-left: 10px;"></i>
                </div>
                <div id="ups_fs_dropdown" class="dropdown" style="margin-left: 5px;">
                    <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuButton" data-bs-toggle="dropdown" aria-expanded="false" style="background-color: transparent;">
                        <img src="<c:url value="/resources/images/admin-user.png"></c:url>" alt="" style="width: 36px;height: 36px;">
                    </a>
                  
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                        <h4 class="dropdown-item ups_admin_fs">Warm Welcome,</h4> 
                        <h4 class="dropdown-item ups_admin_fs"><b><%=u_id.getFirstName() %> <%=u_id.getLastName() %></b></h4>
                        <div style="width: 100%; height: 1px; background-color: #F2F2F2;"></div>
                        <a class="dropdown-item" href="customer_dashboard.jsp" style="font-size: 18px;">To overview</a>
                        <a class="dropdown-item" href="#" style="font-size: 18px;">My settings</a>
                        <a class="dropdown-item" href="logout" style="font-size: 18px;">Logout</a>
                    </ul>
                  </div>
            </div>
            <div id="ups_ss_dropdowm">
                <div class="dropdown">
                    <a class="btn btn-secondary dropdown-toggle" href="#" role="button" id="dropdownMenuLink" data-bs-toggle="dropdown" aria-expanded="false" style="background-color: transparent;">
                        <img src="<c:url value="/resources/images/menu_icon.png"></c:url>" alt="" style="width: 30px;height: 25px;">
                    </a>
                  
                    <ul class="dropdown-menu" aria-labelledby="dropdownMenuLink">
                        <h4 class="dropdown-item ups_admin_fs">Warm Welcome,</h4> 
                        <h4 class="dropdown-item ups_admin_fs"><b><%=u_id.getFirstName() %> <%=u_id.getLastName() %></b></h4>
                        <div style="width: 100%; height: 1px; background-color: #F2F2F2;"></div>
                        <a class="dropdown-item" href="customer_dashboard.jsp" style="font-size: 18px;font-family: 'Roboto',sans-serif;">Overview</a>    
                        <a class="dropdown-item" href="service_history.jsp" style="font-size: 18px;font-family: 'Roboto',sans-serif;">Service History</a>
                        <a class="dropdown-item" href="#" style="font-size: 18px;font-family: 'Roboto',sans-serif;">Calender View</a>
                        <a class="dropdown-item" href="#" style="font-size: 18px;font-family: 'Roboto',sans-serif;">My favourites</a>
                        <a class="dropdown-item" href="#" style="font-size: 18px;font-family: 'Roboto',sans-serif;">bills</a>
                        <a class="dropdown-item" href="#" style="font-size: 18px;font-family: 'Roboto',sans-serif;">My settings</a>
                        <a class="dropdown-item" href="logout" style="font-size: 18px;font-family: 'Roboto',sans-serif;">Logout</a>
                        <div style="width: 100%; height: 2px; background-color: #F2F2F2;"></div>
                        <a class="dropdown-item" href="prices.html" style="font-size: 18px;font-family: 'Roboto',sans-serif;">Prices & services</a>
                        <a class="dropdown-item" href="#" style="font-size: 18px;font-family: 'Roboto',sans-serif;">Warranty</a>
                        <a class="dropdown-item" href="#" style="font-size: 18px;font-family: 'Roboto',sans-serif;">Blog</a>
                        <a class="dropdown-item" href="contact.html" style="font-size: 18px;font-family: 'Roboto',sans-serif;">Contact</a>
                        <div style="width: 100%; height: 2px; background-color: #F2F2F2;"></div>
                        <div class="d-flex mt-3 mb-3">
                            <a href="#" style="display: block;width: fit-content;margin-left: auto;margin-right: auto;"><i class="fab fa-facebook-f" style="color: #111111;font-size: 20px;"></i></a>
                            <a href="#" style="display: block;width: fit-content;margin-left: auto;margin-right: auto;"><i class="fab fa-instagram" style="color: #111111;font-size: 25px;"></i></a>

                        </div>
                    </ul>
                  </div>
                
            </div>
        </div>    
    </header>
    <div class="container-fluid" style="background-color: #F9F9F9;border: 5px solid #F2F2F2;">
        <h3 style="padding: 40px 0px;text-align: center; font-family: 'Roboto',sans-serif;font-size: 30px;">Welcome, <b><%=u_id.getFirstName() %>!</b></h3>
    </div>


    <section id="ups_fs_main_content" class="container" style="margin-top: 30px;">
        <div class="row">
            <div id="sidebar_content" class="col-lg-3" style="background-color: #1D7A8C;">
                    <a id="" class="ups_navitems" href="customer_dashboard.jsp">Dashboard</a>
                    <a id="" class="ups_navitems" href="service_history.jsp">Service History</a>
                    <a id="" class="ups_navitems" href="">Service Schedule</a>        
                    <a id="" class="ups_navitems" href="">Favourite Pros</a>
                    <a id="" class="ups_navitems" href="">Invoices</a>
                    <a id="" class="ups_navitems" href="">Notifications</a>
                
            </div>
            <div class="col-lg-9">
                <ul class="nav nav-tabs" role="tablist">
                    <li class="nav_list nav-item" >
                        <a id="" class="nav-link active" data-bs-toggle="tab" href="#my_details" style="text-align: center;font-size: 17px;font-family: 'Roboto',sans-serif;">
                            My Details
                        </a>
                    </li>
                    <li class="nav_list nav-item">
                        <a id="" class="nav-link" data-bs-toggle="tab" href="#my_addresses" style="text-align: center;font-size: 17px;font-family: 'Roboto',sans-serif;">
                            My Addresses
                        </a>
                    </li>
                    <li class="nav_list nav-item">
                        <a id="" class="nav-link" data-bs-toggle="tab" href="#change_password" style="text-align: center;font-size: 17px;font-family: 'Roboto',sans-serif;">
                            Change Password
                        </a>
                    </li>
                </ul>

                <div class="tab-content">
                    <div id="my_details" class="tab-pane active mt-3">
                        <form action="updateDetails" method="post">
                            <div class="d-flex flex-wrap">
                                <div style="margin: 5px;">
                                    <label for="first_name" class="inline_form_labels">First Name</label>
                                    <input required type="text" value="<%=u_id.getFirstName() %>" name="FirstName" id="first_name" style="width: 100%;height: 46px;">
                                </div>
                                <div style="margin: 5px;">
                                    <label for="last_name" class="inline_form_labels">Last Name</label>
                                    <input required type="text" value="<%=u_id.getLastName() %>" name="LastName" id="last_name" style="width: 100%;height: 46px;">
                                </div>
                                <div style="margin: 5px;">
                                    <label for="email1" class="inline_form_labels">Email Address</label>
                                    <input disabled value="<%=u_id.getEmail() %>" type="email" name="Email" id="email1" style="width: 100%;height: 46px;">
                                </div>
                                <div style="margin: 5px;">
                                    <label for="phone_num" class="inline_form_labels" style="width: 100%;">Phone number</label>
                                    <div class="row" style="margin-left: 0px;">
                                        <div class="col-2 p-0">
                                            <select class="inline_form_labels" name="country_code" id="select_cc">
                                                <option class="inline_form_labels" value="49">+49</option>
                                                <option class="inline_form_labels" value="91">+91</option>
                                            </select>
                                        </div>
                                        <div class="col-10" style="padding-left: 0px;">
                                            <input required type="text" value="<%=u_id.getMobile() %>" name="Mobile" id="phone_num" style="width: 100%;height: 46px;margin-right: 50px">
                                        </div>
                                    </div>
                                </div>
                                <div style="margin: 5px;">
                                    <label for="dob" class="inline_form_labels">Date of Borth</label>
                                    <input required type="date" value=<%=u_id.getDateOfBirth() %> name="DateOfBirth" id="dob" style="width: 100%;height: 46px;">
                                </div>
                            </div>
                            <div class="mt-3 mb-3" style="width: 100%;height: 2px;background-color: #eeecec;"></div>
                            <input class="mx-1 rounded-pill" type="submit" value="Save" style="background-color: #1D7A8C;color: #FFFFFF;padding: 5px 15px;border: 0px;font-size: 17px;">
                        </form>
                    </div>
                    <div id="my_addresses" class="tab-pane fade mt-3" style="margin-left: 5px;">
                        <div class="row" id="address_header" style="background-color: #F3F3F3;font-size: 17px;font-family: 'Roboto',sans-serif;padding: 5px;">
                            <div class="col-lg-10" style="padding-left: 30px;">
                                Addresses
                            </div>
                            <div class="col-lg-2 d-flex justify-content-center">
                                Action
                            </div>
                        </div>
                        <%
							List<Useraddress> user_addresses=null;
							if(session.getAttribute("user")!=null){
								user_addresses=(List<Useraddress>)session.getAttribute("userAddress");
							}
						%>
						<%
							for(Useraddress address:user_addresses){
						%>
                        <div class="row d-flex align-items-center" style="font-size: 17px;font-family: 'Roboto',sans-serif;padding: 5px;border: 1px solid #e6e6e6;">
                            <div class="col-lg-10 address_align" style="padding-left: 30px;">
                                <div>
                                    Address: <%=address.getAddressLine1() %> <%=address.getAddressLine2() %>,<%=address.getPostalCode() %> <%=address.getCity() %>
                                </div>
                                <div>
                                    Phone Number: <%=address.getMobile() %>
                                </div>
                            </div>
                            <div class="address_sep my-2" style="width: 90%;height: 2px;background-color: #eeecec;margin-left: auto;margin-right: auto;"></div>
                            <div class="col-lg-2 d-flex justify-content-center">
                                <a data-bs-toggle="modal" data-bs-target="#editAddress<%=address.getAddressId()%>"><i class="fas fa-edit" style="color: #c4c4c4;padding: 0px 10px;cursor: pointer;"></i></a>
                                <form action="deleteAddress" method="post">
                                	<input type="number" value="<%=address.getAddressId()%>" name="AddressId" style="display: none;">
                                	<button type="submit" style="background-color: transparent;border:0px"><i class="far fa-trash-alt" style="color: #c4c4c4;padding: 0px 10px;"></i></button>
                            	</form>
                            </div>
                        </div>
                        <%} %>
                    </div>
                    <div id="change_password" class="tab-pane fade mt-3">
                        <div style="margin: 10px;">
                        	<input type="text" id="hide_pass" value="<%=u_id.getPassword()%>" style="display: none;">
                            <label for="current_pass" class="inline_form_labels" style="display: block;">Old Password</label>
                            <input required type="password" name="CurrentPassword" id="current_pass" placeholder="Current Password" style="width: 250px;height: 46px;">
                        </div>
                        <form action="updatePassword" method="post" id="password_form" onsubmit="return myFunction()">
                            <div style="margin: 10px;">
                                <label for="new_pass" class="inline_form_labels" style="display: block;">New Password</label>
                                <input required type="password" name="NewPassword" id="new_pass" pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{8,12}$" placeholder="Password" style="width: 250px;height: 46px;">
                            </div>
                            <div style="margin: 10px;">
                                <label for="conf_new_pass" class="inline_form_labels" style="display: block;">Confirm Password</label>
                                <input required type="password" name="ConfNewPassword" id="conf_new_pass" placeholder="Confirm Password" style="width: 250px;height: 46px;">
                            </div>
                            <div id="error" style="color: #ff3860;font-size: 12px;margin-left: 10px;"></div>
                            <input type="submit" class="rounded-pill" value="Save" style="margin-left: 10px;background-color: #1D7A8C;color: #FFFFFF;padding: 5px 15px;border: 0px;">
                        </form>
                    </div>
                </div>

            </div>
        </div>
    </section>
	
	<%
	for(Useraddress address:user_addresses){
	%>
    <div class="modal fade" id="editAddress<%=address.getAddressId() %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title" id="exampleModalLabel">Edit Address</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <form action="updateAddress" method="post">
                	<input type="number" name="AddressId" value="<%=address.getAddressId()%>" style="display: none;">
                	<input type="number" name="UserId" value="<%=u_id.getUserId()%>" style="display: none;">
                    <div class="row">
                        <div class="col-md-6 pt-1 pb-0 p-5">
                            <label for="street_name" class="inline_form_labels">Street name</label>
                            <input required type="text" value="<%=address.getAddressLine1() %>" name="AddressLine1" id="street_name" style="width: 100%;height: 46px;">
                        </div>
                        <div class="col-md-6 pt-1 pb-0 p-5">
                            <label for="house_number" class="inline_form_labels">House number</label>
                            <input required type="text" value="<%=address.getAddressLine2() %>" name="AddressLine2" id="house_number" style="width: 100%;height: 46px;">
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-6 pt-1 pb-0 p-5">
                            <label for="postal_code" class="inline_form_labels">Postal code</label>
                            <input required type="text" value="<%=address.getPostalCode() %>" name="PostalCode" id="postal_code" style="width: 100%;height: 46px;">
                        </div>
                        <div class="col-md-6 pt-1 pb-0 p-5">
                            <label for="city" class="inline_form_labels">City</label>
                            <input required type="text" value="<%=address.getCity() %>" name="city" id="City" style="width: 100%;height: 46px;">
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
                                    <input required type="text" value="<%=address.getMobile() %>" name="Mobile" id="phone_num" style="width: 100%;height: 46px;margin-right: 50px">
                                </div>
                            </div>
                        </div>
                    </div>
                    <div class="mt-3">
                        <button type="submit" id="save_btn" class="rounded-pill" style="height: 46px;width: 90%;margin-left: 35px;background-color: #1D7A8C;color: #FFFFFF;border: 0px;font-family: 'Roboto',sans-serif;font-size: 18px;">Edit</button>
                    </div>
                </form>
            </div>
          </div>
        </div>
      </div>
      <%} %>

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
    	function myFunction(){
    		var hide_pass=document.getElementById("hide_pass").value;
    		var current_pass=document.getElementById("current_pass").value;
    		var new_pass=document.getElementById("new_pass").value;
    		var conf_new_pass=document.getElementById("conf_new_pass").value;
    		const msg=document.getElementById("error");
    		console.log(current_pass,new_pass,conf_new_pass,hide_pass);
    		
    		if(new_pass==conf_new_pass && hide_pass==current_pass){
    			msg.innerText=""
    			return true;
    		}
    		else if(new_pass!=conf_new_pass){
    			msg.innerText="password does not match"
    			return false;	
    		}
    		else{
    			msg.innerText="current password does not match"
    			return false;
    		}
    	}
    </script>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>