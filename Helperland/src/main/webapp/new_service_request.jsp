<%@page import="helperland.model.User"%>
<%@page import="helperland.model.Servicerequest"%>
<%@page import="helperland.model.Servicerequestaddress"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page isELIgnored ="false" %> 
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>New Service Requests</title>

    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="<c:url value="/resources/css/style.css"></c:url>">

    <link rel="preconnect" href="https://fonts.googleapis.com">
    <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@500&display=swap" rel="stylesheet">

    <script src="https://kit.fontawesome.com/5602f8a8c9.js" crossorigin="anonymous"></script>

</head>
<body>
<%
List<Servicerequest> services = null;
if (session.getAttribute("new_services") != null) {
	services = (List<Servicerequest>) session.getAttribute("new_services");
}
List<User> customers=null;
if (session.getAttribute("customers") != null) {
	customers = (List<User>) session.getAttribute("customers");
}
Map<Integer,Double> rating=(Map<Integer,Double>)session.getAttribute("rating");
List<Servicerequestaddress> service_address=null;
if(session.getAttribute("new_service_address")!=null){
	service_address=(List<Servicerequestaddress>)session.getAttribute("new_service_address");
}
List<String> extra_services=null;
if(session.getAttribute("extra_services")!=null){
	extra_services=(List<String>)session.getAttribute("extra_services");
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
                        <h4 class="dropdown-item ups_admin_fs"><b>${user.getFirstName() } ${user.getLastName() }</b></h4>
                        <div style="width: 100%; height: 1px; background-color: #F2F2F2;"></div>
                        <a class="dropdown-item" href="new-service-request" style="font-size: 18px;">To overview</a>
                        <a class="dropdown-item" href="sp-settings" style="font-size: 18px;">My settings</a>
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
                        <h4 class="dropdown-item ups_admin_fs"><b>${user.getFirstName() } ${user.getLastName() }</b></h4>
                        <div style="width: 100%; height: 1px; background-color: #F2F2F2;"></div>
                        <a class="dropdown-item" href="#" style="font-size: 18px;font-family: 'Roboto',sans-serif;">Overview</a>
                        <a class="dropdown-item" href="#" style="font-size: 18px;font-family: 'Roboto',sans-serif;color: #1D7A8C;">New Service Requests</a>    
                        <a class="dropdown-item" href="upcomig-service" style="font-size: 18px;font-family: 'Roboto',sans-serif;">Upcoming Services</a>
                        <a class="dropdown-item" href="sp-service-history" style="font-size: 18px;font-family: 'Roboto',sans-serif;">Service History</a>
                        <a class="dropdown-item" href="my-ratings" style="font-size: 18px;font-family: 'Roboto',sans-serif;">My Ratings</a>
                        <a class="dropdown-item" href="block-customer" style="font-size: 18px;font-family: 'Roboto',sans-serif;">Block Customer</a>   
                        <a class="dropdown-item" href="#" style="font-size: 18px;font-family: 'Roboto',sans-serif;">Calender View</a>
                        <a class="dropdown-item" href="sp-settings" style="font-size: 18px;font-family: 'Roboto',sans-serif;">My settings</a>
                        <a class="dropdown-item" href="logout" style="font-size: 18px;font-family: 'Roboto',sans-serif;">Logout</a>
                        <div style="width: 100%; height: 2px; background-color: #F2F2F2;"></div>
                        <a class="dropdown-item" href="prices.jsp" style="font-size: 18px;font-family: 'Roboto',sans-serif;">Prices & services</a>
                        <a class="dropdown-item" href="#" style="font-size: 18px;font-family: 'Roboto',sans-serif;">Warranty</a>
                        <a class="dropdown-item" href="#" style="font-size: 18px;font-family: 'Roboto',sans-serif;">Blog</a>
                        <a class="dropdown-item" href="contact.jsp" style="font-size: 18px;font-family: 'Roboto',sans-serif;">Contact</a>
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
        <h3 style="padding: 40px 0px;text-align: center; font-family: 'Roboto',sans-serif;font-size: 30px;">Welcome, <b>${user.getFirstName() }!</b></h3>
    </div>


    <section id="ups_fs_main_content" class="container" style="margin-top: 30px;">
        <div class="row">
            <div id="sidebar_content" class="col-lg-3" style="background-color: #1D7A8C;">
                    <a id="" class="ups_navitems" href="">Dashboard</a>
                    <a id="sh_item2" class="ups_navitems" href="">New Service Requests</a> 
                    <a id="" class="ups_navitems" href="upcomig-service">Upcoming Servies</a>
                    <a id="" class="ups_navitems" href="sp-service-history">Service History</a>        
                    <a id="" class="ups_navitems" href="my-ratings">My Ratings</a>
                    <a id="" class="ups_navitems" href="block-customer">Block Customer</a>
                    <a id="" class="ups_navitems" href="">Notifications</a>
                
            </div>
            <div class="col-lg-9">
                <div class="d-flex align-items-center mb-3 mt-2 justify-content-sm-center justify-content-md-start" style="z-index: -2;">
                    <span style="font-size: 18px;font-family: 'Roboto',sans-serif;">redius</span> 
                    <form class="d-flex align-items-center" action="" style="margin-left: 5px;">
                        <select name="redius" id="redius" style="padding: 10px;border-radius: 5px;font-size: 14px;">
                          <option value="2">2 Km</option>
                          <option value="5">5 Km</option>
                          <option value="10">10 Km</option>
                          <option value="20">20 Km</option>
                          <option value="25">25 Km</option>
                        </select>
                        <div class="d-flex align-items-center" style="margin-left: 10px;">
                            <input type="checkbox" id="pet" name="pet" value="1" style="width: 25px;height: 25px;">
                            <label for="pet" style="font-size: 16px;font-family: 'Roboto',sans-serif;margin-left: 5px;z-index: -1;"> Show orders with pet owners</label><br>
                        </div>
                    </form>
                </div>
                <div id="sidebar_content" class="row"  style="background-color: #F9F9F9;padding: 15px 0px;border: 2px solid #ECECEC;">
                    <div class="col-md-10">
                        <div class="row">
                            <div id="ups_content_header" class="col-2 ">Service Id</div>
                            <div id="ups_content_header" class="col-3 ">Service date</div>
                            <div id="ups_content_header" class="col-5 ">Customer details </div>
                            <div id="ups_content_header" class="col-2 ">Payment</div>
                        </div>
                    </div>
                    <div class="col-2" style="padding-left: 50px;">
                        <div class="row">
                            <div id="ups_content_header" class="col" style="text-align: center;">Action</div>
                        </div>
                    </div>
                </div>
                <% 
               	for(int i=0;i<services.size();i++){
               		Servicerequest service=services.get(i);
               		User customer=customers.get(i);
               		Servicerequestaddress sra=service_address.get(i);
                %>
                <div id="main_item_container" class="row my-2" >
                    <a data-bs-toggle="modal" data-bs-target="#exampleModal<%=service.getServiceRequestId() %>" class="col-md-10" style="cursor: pointer">
                        <div class="row">
                            <div href="#" id="ups_content_items1" class="ups_content_items col-md-2 d-flex align-items-center justify-content-center"><%=service.getServiceRequestId() %></div>
                            <div class="linebreak"></div>
                            <div href="#" id="ups_content_items2" class="ups_content_items col-md-3 d-flex align-items-center">
                                <div id="time_col" class="row justify-content-center">
                                    <div id="ups_content_items3" class="ups_content_items col-6 col-md-12" style="width: fit-content;">
                                        <img src="<c:url value="/resources/images/calendar2.png"></c:url>" alt="" style="margin-right: 5px;z-index: -2;"><b><%=service.getServiceStartDate().toString().substring(0, 10)%></b>
                                    </div>
                                    <div id="ups_content_items4" class="ups_content_items col-6 col-md-12" style="width: fit-content;">
                                    <%
										int hours = Integer.parseInt(service.getServiceStartDate().toString().substring(11, 13));
										int min = Integer.parseInt(service.getServiceStartDate().toString().substring(14, 16));

										int sh = (int) service.getServiceHours();
										int hours1 = hours + sh;
										int min1 = min;
										double diff = service.getServiceHours() - sh;
										if (diff > 0) {
											min1 += 30;
											if (min1 >= 60) {
												hours1++;
												min1 = min1 % 60;
											}
										}
										String h1 = String.valueOf(hours);
										String m1 = String.valueOf(min);
										String h2 = String.valueOf(hours1);
										String m2 = String.valueOf(min1);
										if (hours < 10) {
											h1 = "0" + String.valueOf(hours);
										}
										if (min < 10) {
											m1 = "0" + String.valueOf(min);
										}
										if (hours1 < 10) {
											h2 = "0" + String.valueOf(hours1);
										}
										if (min1 < 10) {
											m2 = "0" + String.valueOf(min1);
										}
										%>
                                        <img src="<c:url value="/resources/images/layer-712.png"></c:url>" alt="" style="margin-right: 5px;"><%=h1%>:<%=m1%>-<%=h2%>:<%=m2%>
                                    </div>
                                </div>
                            </div>
                            <div class="linebreak"></div>
                            <div href="" id="ups_content_items5" class="col-md-5 justify-content-center">
                                <div style="width: fit-content;margin-left: auto;margin-right: auto;">
                                <div id="ups_content_items">
                                    <h4 class="ups_content_items" style="margin: 0px;padding-left: 26px;"><%=customer.getFirstName() %> <%=customer.getLastName() %></h4>
                                </div>
                                <div id=""  class="d-flex align-items-center">
                                    <img src="<c:url value="/resources/images/layer-719.png"></c:url>" alt="" style="margin-right: 5px;">
                                    <div class="d-flex align-items-center ups_content_items mt-1">
                                        <%=sra.getAddressLine1() %> <%=sra.getAddressLine2() %>,<%=sra.getPostalCode() %> <%=sra.getCity() %>
                                    </div>
                                </div>
                            </div>
                            </div>
                            <div class="linebreak"></div>
                            <div id="" class="ups_content_items col-md-2 d-flex align-items-center justify-content-center" style="text-align: center;"><%=service.getTotalCost() %> &#8364;</div>
                        </div>
                    </a>
                    <div class="linebreak"></div>
                   <div id="action_col" class="col-md-2">
                       <div class="row" style="height: 100%;">
                            <div id="ups_content_items10" class="ups_content_items col d-flex align-items-center justify-content-center" style="text-align: center;">
                            	<form action="acceptService" method="post">
                            		<input type="number" name="service_req_id" value=<%=service.getServiceRequestId() %> style="display: none">
                            		<button type="submit" class="rounded-pill" style="background-color: #1D7A8C;padding: 7px 16px;color: #FFFFFF;border: 0px">Accept</a>
                            	</form>
                            </div> 
                       </div>
                   </div>
                     
                </div>
                <%} %>
                <div class="row d-flex justify-content-between align-items-center mt-3">
                    <div class="col-md-6 d-flex justify-content-center align-items-center justify-content-md-start">
                        <h4 style="font-size: 18px;font-family: 'Roboto',sans-serif;">show</h4> 
                        <form class="d-flex align-items-center" action="" style="margin-left: 5px;">
                            <select name="show_entery" id="show_entery" style="padding: 10px;border-radius: 5px;font-size: 14px;">
                            <option value="10">10</option>
                            <option value="20">20</option>
                            <option value="50">50</option>
                            <option value="100">100</option>
                            </select>
                        </form>
                        <h4 style="font-size: 18px;font-family: 'Roboto',sans-serif;margin-left: 10px;">Entries total: 0</h4> 
                    </div>
                    <div class="col-md-6 d-flex align-items-center justify-content-center justify-content-md-end mt-md-0 mt-2" style="z-index: -2;">
                        <a href="#"><img src="<c:url value="/resources/images/first-page.png"></c:url>" alt="" style="border: 1px solid #9c9c9c; padding: 10px;border-radius: 50%;margin: 0px 5px;"></a>
                        <a href="#"><img src="<c:url value="/resources/images/keyboard-right-arrow-button-copy.png"></c:url>" alt="" style="border: 1px solid #9c9c9c; padding: 10px 11px;border-radius: 50%;"></a>
                        <a href="#" style="color: #FFFFFF;background-color: #1D7A8C;padding: 6px 12px;border-radius: 50%;margin: 0px 5px;">1</a>
                        <a href="#"><img src="<c:url value="/resources/images/keyboard-right-arrow-button-copy.png"></c:url>" alt="" style="border: 1px solid #9c9c9c; padding: 10px 11px;border-radius: 50%;transform: rotate(180deg);"></a>
                        <a href="#"><img src="<c:url value="/resources/images/first-page.png"></c:url>" alt="" style="border: 1px solid #9c9c9c; padding: 10px;border-radius: 50%;margin: 0px 5px;transform: rotate(180deg);"></a>
                    </div>
                </div>
            </div>
        </div>
    </section>
	<%
	for(int i=0;i<services.size();i++){
		Servicerequest service=services.get(i);
		User customer=customers.get(i);
		Servicerequestaddress address=service_address.get(i);
		String extra=extra_services.get(i);
	%>
    <div class="modal fade" id="exampleModal<%=service.getServiceRequestId() %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered modal-lg">
          <div class="modal-content">
            <div class="modal-header">
              <h5 class="modal-title">Service Details</h5>
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="row" style="margin-top: 20px;">
                    <div id="popup_content1" class="col-md-7" style="padding-left: 20px;">
                        <div style="border-bottom: 2px solid #ECECEC;margin-bottom: 10px;">
                        <%
						int hours = Integer.parseInt(service.getServiceStartDate().toString().substring(11, 13));
						int min = Integer.parseInt(service.getServiceStartDate().toString().substring(14, 16));

						int sh = (int) service.getServiceHours();
						int hours1 = hours + sh;
						int min1 = min;
						double diff = service.getServiceHours() - sh;
						if (diff > 0) {
							min1 += 30;
							if (min1 >= 60) {
								hours1++;
								min1 = min1 % 60;
							}
						}
						String h1 = String.valueOf(hours);
						String m1 = String.valueOf(min);
						String h2 = String.valueOf(hours1);
						String m2 = String.valueOf(min1);
						if (hours < 10) {
							h1 = "0" + String.valueOf(hours);
						}
						if (min < 10) {
							m1 = "0" + String.valueOf(min);
						}
						if (hours1 < 10) {
							h2 = "0" + String.valueOf(hours1);
						}
						if (min1 < 10) {
							m2 = "0" + String.valueOf(min1);
						}
						%>
                            <h3 style="font-family: 'Roboto',sans-serif;font-size: 18px;font-weight: bold;"><%=service.getServiceStartDate().toString().substring(0, 10)%> <%=h1%>:<%=m1%>-<%=h2%>:<%=m2%></h3>
                            <h4 style="font-family: 'Roboto',sans-serif;font-size: 18px;">Duration: <%=service.getServiceHours()%>Hrs</h4>
                        </div>
                        <div style="border-bottom: 2px solid #ECECEC;margin-bottom: 10px;">
                            <h4 style="font-family: 'Roboto',sans-serif;font-size: 18px;">Service Id: <%=service.getServiceRequestId() %></h4>
                            <h4 style="font-family: 'Roboto',sans-serif;font-size: 18px;">Extras: <%=extra %></h4>
                            <h4 style="font-family: 'Roboto',sans-serif;font-size: 18px;display: inline-block;">Total Payment: </h4><h4 style="display: inline-block;margin-left: 5px;color: #146371;"><%=service.getTotalCost() %> &#8364;</h4> 
                        </div>
                        <div style="border-bottom: 2px solid #ECECEC;margin-bottom: 10px;">
                            <h4 style="font-family: 'Roboto',sans-serif;font-size: 18px;">Customer Name: <%=customer.getFirstName() %> <%=customer.getLastName() %></h4>
                            <h4 style="font-family: 'Roboto',sans-serif;font-size: 18px;">Service Address: <%=address.getAddressLine1() %> <%=address.getAddressLine2() %>, <%=address.getPostalCode() %> <%=address.getCity() %></h4>
                            
                        </div>
                        <div style="border-bottom: 2px solid #ECECEC;margin-bottom: 10px;">
                            <h4 style="font-family: 'Roboto',sans-serif;font-size: 20px;">Comments : <%=service.getComments() %></h4>
                            <h4 style="font-family: 'Roboto',sans-serif;font-size: 18px;">
                            <% if(service.getHasPets()==false){ %>
							<i class="fas fa-times"
								style="color: #FFFFFF; background-color: red; padding: 7px 8px 6px 8px; border-radius: 50%; margin-right: 5px;"></i>I
							don't have pets at home
							<%}
							else{
							%>
							<i class="fas fa-check"
								style="color: #FFFFFF; background-color: green; padding: 7px 8px 6px 8px; border-radius: 50%; margin-right: 5px;"></i>I
							have pets at home
							<%} %>
                            </h4>
                        </div>
                        <div style="margin-bottom: 20px;margin-top: 20px;">
                        	<form action="acceptService" method="post">
                        		<input type="number" name="service_req_id" value=<%=service.getServiceRequestId() %> style="display: none">
                            	<button type="submit" class="rounded-pill" style="background-color: #1D7A8C;padding: 7px 16px;color: #FFFFFF;border: 0px"><i class="fas fa-check"></i> Accept</button>
                        	</form>
                        </div>
                    </div>
                    <div id="popup_content2" class="col-md-5">
                        <div id="sevice_map" style="width: 100%;height:400px"></div>
                    </div>
                </div>
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
        function initMap() {
        	console.log()
        // The location of Uluru
        const uluru = { lat: 23.0349, lng: 72.5004 };
        // The map, centered at Uluru
        const map = new google.maps.Map(document.getElementById("sevice_map"), {
          zoom: 20,
          center: uluru,
          disableDefaultUI: true,
        });
        // The marker, positioned at Uluru
        const marker = new google.maps.Marker({
          position: uluru,
          map: map,
        });
      }
    </script>
<script
src="https://maps.googleapis.com/maps/api/js?key=AIzaSyCZ09daqNuvwBpzBRGWwFvcF_3rTwlA4jc&callback=initMap&libraries=&v=weekly"
async
></script>
<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>