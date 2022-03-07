<%@page import="javax.persistence.criteria.CriteriaBuilder.In"%>
<%@page import="helperland.model.User"%>
<%@page import="helperland.model.Servicerequest"%>
<%@page import="java.util.List"%>
<%@page import="java.util.Map"%>
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
    <title>Service History</title>

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
int user_type=-1;
if(session.getAttribute("user_type")!=null){
	user_type=(Integer)session.getAttribute("user_type");
}
List<Servicerequest> services = null;
if (session.getAttribute("services") != null) {
	services = (List<Servicerequest>) session.getAttribute("services");
}
Map<Integer,User> providers=(Map<Integer,User>)session.getAttribute("providers");
Map<Integer,Double> rating=(Map<Integer,Double>)session.getAttribute("rating");

%>
<c:set var="id" value="<%= u_id.getUserId() %>" scope="session"></c:set>
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
                        <h4 class="dropdown-item ups_admin_fs"><b><%= u_id.getFirstName() %><%=" " %><%= u_id.getLastName() %></b></h4>
                        <div style="width: 100%; height: 1px; background-color: #F2F2F2;"></div>
                        <a class="dropdown-item" href="customer_dashboard.jsp" style="font-size: 18px;">My Dashboard</a>
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
                        <h4 class="dropdown-item ups_admin_fs"><b><%= u_id.getFirstName() %><%=" " %><%= u_id.getLastName() %></b></h4>
                        <div style="width: 100%; height: 1px; background-color: #F2F2F2;"></div>
                        <a class="dropdown-item" href="customer_dashboard.jsp" style="font-size: 18px;font-family: 'Roboto',sans-serif;">My Dashboard</a>    
                        <a class="dropdown-item" href="#" style="font-size: 18px;font-family: 'Roboto',sans-serif;color: #1D7A8C;">Service History</a>
                        <a class="dropdown-item" href="#" style="font-size: 18px;font-family: 'Roboto',sans-serif;">Calender View</a>
                        <a class="dropdown-item" href="#" style="font-size: 18px;font-family: 'Roboto',sans-serif;">My favourites</a>
                        <a class="dropdown-item" href="#" style="font-size: 18px;font-family: 'Roboto',sans-serif;">bills</a>
                        <a class="dropdown-item" href="#" style="font-size: 18px;font-family: 'Roboto',sans-serif;">My settings</a>
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
        <h3 style="padding: 40px 0px;text-align: center; font-family: 'Roboto',sans-serif;font-size: 30px;">Welcome, <b><%= u_id.getFirstName() %><%=" " %>!</b></h3>
    </div>


    <section id="ups_fs_main_content" class="container" style="margin-top: 30px;">
        <div class="row">
            <div id="sidebar_content" class="col-lg-3" style="background-color: #1D7A8C;">
                    <a id="" class="ups_navitems" href="customer_dashboard.jsp">Dashboard</a>
                    <a id="sh_item2" class="ups_navitems" href="">Service History</a>
                    <a id="" class="ups_navitems" href="">Service Schedule</a>        
                    <a id="" class="ups_navitems" href="">Favourite Pros</a>
                    <a id="" class="ups_navitems" href="">Invoices</a>
                    <a id="" class="ups_navitems" href="">Notifications</a>
                
            </div>
            <div class="col-lg-9">
                <div class="row d-flex align-items-center mb-3 mt-2 justify-content-md-between" style="z-index: -2;">
                    <div class="col-md-6 d-flex justify-content-md-start justify-content-center">
                        <h4 style="font-size: 18px;font-family: 'Roboto',sans-serif;">Service History</h4> 
                    </div>
                    <div class="col-md-6 d-flex justify-content-md-end justify-content-center mt-md-0 mt-2">
                        <a class="rounded-pill" href="#" style="font-family: 'Roboto',sans-serif;background-color: #1C7789;padding: 5px 7px;color: #FFFFFF;">export</a>
                    </div>

                </div>
                <div id="sidebar_content" class="row"  style="background-color: #F9F9F9;padding: 15px 0px;border: 2px solid #ECECEC;">
                    
                    <div class="col-md-4">
                        <div class="row">
                            <div id="ups_content_header" class="col-5 ">Service Id</div>
                            <div id="ups_content_header" class="col-7 ">Service date</div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="row">
                            <div id="ups_content_header" class="col-6 ">Service Provider</div>
                            <div id="ups_content_header" class="col-3 ">Payment</div>
                            <div id="ups_content_header" class="col-3 ">Status</div>
                        </div>
                    </div>
                    <div class="col-2" style="padding-left: 50px;">
                        <div class="row">
                            <div id="ups_content_header" class="col " style="text-align: center;">Rate SP</div>
                        </div>
                    </div>
                </div>
                <div id="main_item_container" class="row" >
                	<%
					for (Servicerequest service : services) {
						if (service.getStatus().equals("cancelled") || service.getStatus().equals("completed")) {
					%>
                    <div class="col-md-4" style="cursor: pointer">
                        <div class="row">
                            <div href="#" id="ups_content_items1" class="ups_content_items col-md-5 d-flex align-items-center justify-content-center"><%=service.getServiceRequestId()%></div>
                            <div class="linebreak"></div>
                            <div href="#" id="ups_content_items2" class="ups_content_items col-md-7 d-flex align-items-center justify-content-center">
                                <div id="time_col" class="row" style="display: block;">
                                    <div id="ups_content_items3" class="ups_content_items col-6 col-md-12 d-flex justify-content-center align-items-center" style="width: 100%">
                                        <img src="<c:url value="/resources/images/calendar2.png"></c:url>" alt="" style="margin-right: 5px;z-index: -2;"><b><%=service.getServiceStartDate().toString().substring(0, 10)%></b>
                                    </div>
                                    <div id="ups_content_items4" class="ups_content_items col-6 col-md-12 d-flex justify-content-center align-items-center" style="width: 100%">
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
                           </div>
                    </div>
                    <div class="col-md-6" >
                        <div class="row d-flex" style="height: 100%">
                            <div href="" id="ups_content_items5" class="col-md-6 d-flex align-items-center justify-content-center" style="z-index: -2;">
                            	<%
								if (service.getServiceProviderId() != null) {
									User provider=providers.get(Integer.parseInt(service.getServiceProviderId()));
									double ratings=rating.get(Integer.parseInt(service.getServiceProviderId()));
								%>
                                <div style="margin-right: 5px;">
                                    <img src="<c:url value="/resources/images/cap.png"></c:url>" alt="" style="border: 1px solid #9C9C9C;padding: 8px 3px;border-radius: 50%;">
                                </div>
                                <div>
                                    <div style="font-family: 'Roboto',sans-serif;font-size: 16px;">
                                        <%=provider.getFirstName() %> <%=provider.getLastName() %>
                                    </div>
                                    <div>
                                        <%if(ratings>=0.5){ %>
											<img src="<c:url value="/resources/images/star1.png"></c:url>"alt="">
										<%}else{ %>
											<img src="<c:url value="/resources/images/star2.png"></c:url>"alt="">
										<%} %>
										<%if(ratings>=1.5){ %>
											<img src="<c:url value="/resources/images/star1.png"></c:url>"alt="">
										<%}else{ %>
											<img src="<c:url value="/resources/images/star2.png"></c:url>"alt="">
										<%} %>
										<%if(ratings>=2.5){ %>
											<img src="<c:url value="/resources/images/star1.png"></c:url>"alt="">
										<%}else{ %>
											<img src="<c:url value="/resources/images/star2.png"></c:url>"alt="">
										<%} %>
										<%if(ratings>=3.5){ %>
											<img src="<c:url value="/resources/images/star1.png"></c:url>"alt="">
										<%}else{ %>
											<img src="<c:url value="/resources/images/star2.png"></c:url>"alt="">
										<%} %>
										<%if(ratings>=4.5){ %>
											<img src="<c:url value="/resources/images/star1.png"></c:url>"alt="">
										<%}else{ %>
											<img src="<c:url value="/resources/images/star2.png"></c:url>"alt="">
										<%} %>
                                        <%=ratings %>
                                    </div>
                                </div>
                                <%} %>
                            </div>
                            <%
							if (service.getServiceProviderId() != null) {
							%>
                            <div class="linebreak"></div>
                            <%} %>
                            <div id="ups_content_items7" class="ups_content_items  col-md-3 d-flex align-items-center justify-content-center" style="display: block;"><%=service.getTotalCost()%> &#8364;</div>
                            <%if(service.getStatus().equals("completed")){ %>
                            <div id="ups_content_items8" class="ups_content_items  col-md-3 d-flex align-items-center justify-content-center" style="background-color: #39c900;color: #FFFFFF;display: block;margin-top: 10px;margin-bottom: 10px">Completed</div>
                        	<%}else{ %>
                        	<div id="ups_content_items8" class="ups_content_items  col-md-3 d-flex align-items-center justify-content-center" style="background-color: #FF6C6C;color: #FFFFFF;display: block;margin-top: 10px;margin-bottom: 10px">Cancelled</div>
                        	<%} %>
                        </div>
                    </div>
                    <div class="linebreak"></div>
                   <div id="action_col" class="col-md-2">
                       <div class="row" style="height: 100%;">
                       		<%if(service.getStatus().equals("completed")){ %>
                            <div id="ups_content_items10" class="ups_content_items col d-flex align-items-center justify-content-center" style="text-align: center;"><button class="rounded-pill" data-bs-toggle="modal" data-bs-target="#exampleModal<%=service.getServiceRequestId() %>" style="background-color: #1D7A8C;padding: 7px 16px;color: #FFFFFF;border: 0px">Rate SP</button></div> 
                       		<%}else{ %>
                       		<div id="ups_content_items10" class="ups_content_items col d-flex align-items-center justify-content-center" style="text-align: center;"><button class="rounded-pill" data-bs-toggle="modal" data-bs-target="#exampleModal" disabled="disabled" style="background-color: #1D7A8C;padding: 7px 16px;color: #FFFFFF;border: 0px">Rate SP</button></div>
                       		<%} %>
                       </div>
                   </div>
                   <%}} %>
                </div>
                <div class="row d-flex justify-content-between align-items-center mt-3">
                    <div class="col-md-6 d-flex justify-content-center justify-content-md-start align-items-center">
                        <h4 style="font-size: 18px;font-family: 'Roboto',sans-serif;">show</h4> 
                        <form class="d-flex align-items-center" action="" style="margin-left: 5px;">
                            <select name="show_entery" id="show_entery" style="padding: 10px;border-radius: 5px;font-size: 14px;">
                            <option value="10">10</option>
                            <option value="20">20</option>
                            <option value="50">50</option>
                            <option value="100">100</option>
                            </select>
                        </form>
                        <h4 style="font-size: 18px;font-family: 'Roboto',sans-serif;margin-left: 10px;z-index: -2;">Entries total: 0</h4> 
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
		for (int i=0;i<services.size();i++) {
			Servicerequest service=services.get(i);
			if (service.getStatus().equals("completed")) {
		%>
      <div class="modal fade" id="exampleModal<%=service.getServiceRequestId() %>" tabindex="-1" aria-labelledby="exampleModalLabel" aria-hidden="true">
        <div class="modal-dialog modal-dialog-centered">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
            </div>
            <div class="modal-body">
                <div class="d-flex align-items-center mt-3 mb-4">
                	<% if (service.getServiceProviderId() != null) {
						User provider=providers.get(Integer.parseInt(service.getServiceProviderId()));
						double ratings=rating.get(Integer.parseInt(service.getServiceProviderId()));
					%>
                    <div style="margin-right: 5px;">
                        <img src="<c:url value="/resources/images/cap.png"></c:url>" alt="" style="border: 1px solid #9C9C9C;padding: 8px 3px;border-radius: 50%;">
                    </div>
                    <div>
                        <div style="font-family: 'Roboto',sans-serif;font-size: 16px;">
                            <%=provider.getFirstName() %> <%=provider.getLastName() %>
                        </div>
                        <div>
                            <%if(ratings>=0.5){ %>
								<img src="<c:url value="/resources/images/star1.png"></c:url>"alt="">
							<%}else{ %>
								<img src="<c:url value="/resources/images/star2.png"></c:url>"alt="">
							<%} %>
							<%if(ratings>=1.5){ %>
								<img src="<c:url value="/resources/images/star1.png"></c:url>"alt="">
							<%}else{ %>
								<img src="<c:url value="/resources/images/star2.png"></c:url>"alt="">
							<%} %>
							<%if(ratings>=2.5){ %>
								<img src="<c:url value="/resources/images/star1.png"></c:url>"alt="">
							<%}else{ %>
								<img src="<c:url value="/resources/images/star2.png"></c:url>"alt="">
							<%} %>
							<%if(ratings>=3.5){ %>
								<img src="<c:url value="/resources/images/star1.png"></c:url>"alt="">
							<%}else{ %>
								<img src="<c:url value="/resources/images/star2.png"></c:url>"alt="">
							<%} %>
							<%if(ratings>=4.5){ %>
								<img src="<c:url value="/resources/images/star1.png"></c:url>"alt="">
							<%}else{ %>
								<img src="<c:url value="/resources/images/star2.png"></c:url>"alt="">
							<%} %>
                            <%=ratings %>
                        </div>
                    </div>
                    
                </div>
                <h3>Rate your service provider</h3>
                <form action="saveRatings" method="post">
                <div style="width: 100%; height: 2px;background-color: #ECECEC;"></div>
                <div class="d-flex align-items-center mt-3" style="font-size: 16px;font-family: 'Roboto',sans-serif;">
                    On time arrival
                    <div class="rating" style="margin-left: 22px;">
                        <label>
                            <input type="radio" name="OnTimeArrival" value="1" />
                            <span class="icon"><i class="fas fa-star"></i></span>
                          </label>
                          <label>
                            <input type="radio" name="OnTimeArrival" value="2" />
                            <span class="icon"><i class="fas fa-star"></i></span>
                            <span class="icon"><i class="fas fa-star"></i></span>
                          </label>
                          <label>
                            <input type="radio" name="OnTimeArrival" value="3" />
                            <span class="icon"><i class="fas fa-star"></i></span>
                            <span class="icon"><i class="fas fa-star"></i></span>
                            <span class="icon"><i class="fas fa-star"></i></span> 
                          </label>
                          <label>
                            <input type="radio" name="OnTimeArrival" value="4" />
                            <span class="icon"><i class="fas fa-star"></i></span>
                            <span class="icon"><i class="fas fa-star"></i></span>
                            <span class="icon"><i class="fas fa-star"></i></span>
                            <span class="icon"><i class="fas fa-star"></i></span>
                          </label>
                          <label>
                            <input type="radio" name="OnTimeArrival" value="5" />
                            <span class="icon"><i class="fas fa-star"></i></span>
                            <span class="icon"><i class="fas fa-star"></i></span>
                            <span class="icon"><i class="fas fa-star"></i></span>
                            <span class="icon"><i class="fas fa-star"></i></span>
                            <span class="icon"><i class="fas fa-star"></i></span>
                          </label>
                    </div>
                </div>
                <div class="d-flex align-items-center mt-3" style="font-size: 16px;font-family: 'Roboto',sans-serif;">
                    Friendly
                    <div class="rating" style="margin-left: 70px;">
                        <label>
                            <input type="radio" name="Friendly" value="1" />
                            <span class="icon"><i class="fas fa-star"></i></span>
                          </label>
                          <label>
                            <input type="radio" name="Friendly" value="2" />
                            <span class="icon"><i class="fas fa-star"></i></span>
                            <span class="icon"><i class="fas fa-star"></i></span>
                          </label>
                          <label>
                            <input type="radio" name="Friendly" value="3" />
                            <span class="icon"><i class="fas fa-star"></i></span>
                            <span class="icon"><i class="fas fa-star"></i></span>
                            <span class="icon"><i class="fas fa-star"></i></span>   
                          </label>
                          <label>
                            <input type="radio" name="Friendly" value="4" />
                            <span class="icon"><i class="fas fa-star"></i></span>
                            <span class="icon"><i class="fas fa-star"></i></span>
                            <span class="icon"><i class="fas fa-star"></i></span>
                            <span class="icon"><i class="fas fa-star"></i></span>
                          </label>
                          <label>
                            <input type="radio" name="Friendly" value="5" />
                            <span class="icon"><i class="fas fa-star"></i></span>
                            <span class="icon"><i class="fas fa-star"></i></span>
                            <span class="icon"><i class="fas fa-star"></i></span>
                            <span class="icon"><i class="fas fa-star"></i></span>
                            <span class="icon"><i class="fas fa-star"></i></span>
                          </label>
                    </div>
                </div>
                <div class="d-flex align-items-center mt-3 mb-3" style="font-size: 16px;font-family: 'Roboto',sans-serif;">
                    Quality of service
                    <div class="rating" style="margin-left: 5px;">
                        <label>
                            <input type="radio" name="QualityOfService" value="1" />
                            <span class="icon"><i class="fas fa-star"></i></span>
                          </label>
                          <label>
                            <input type="radio" name="QualityOfService" value="2" />
                            <span class="icon"><i class="fas fa-star"></i></span>
                            <span class="icon"><i class="fas fa-star"></i></span>
                          </label>
                          <label>
                            <input type="radio" name="QualityOfService" value="3" />
                            <span class="icon"><i class="fas fa-star"></i></span>
                            <span class="icon"><i class="fas fa-star"></i></span>
                            <span class="icon"><i class="fas fa-star"></i></span>   
                          </label>
                          <label>
                            <input type="radio" name="QualityOfService" value="4" />
                            <span class="icon"><i class="fas fa-star"></i></span>
                            <span class="icon"><i class="fas fa-star"></i></span>
                            <span class="icon"><i class="fas fa-star"></i></span>
                            <span class="icon"><i class="fas fa-star"></i></span>
                          </label>
                          <label>
                            <input type="radio" name="QualityOfService" value="5" />
                            <span class="icon"><i class="fas fa-star"></i></span>
                            <span class="icon"><i class="fas fa-star"></i></span>
                            <span class="icon"><i class="fas fa-star"></i></span>
                            <span class="icon"><i class="fas fa-star"></i></span>
                            <span class="icon"><i class="fas fa-star"></i></span>
                          </label>
                    </div>
                </div>
                <div style="width: 100%; height: 2px;background-color: #ECECEC;"></div>
                <h3 class="mt-3">Feedback on service Provider</h3>
                <input type="text" name="RatingFrom" value=<%=u_id.getUserId()%> style="display: none">
                <input type="text" name="RatingTo" value=<%=provider.getUserId() %> style="display: none">	
                <input type="text" name="ServiceRequestId" value=<%=service.getServiceRequestId() %> style="display: none">
                <input id="sh_feedback_input" type="text" name="Comments" style="width: 100%;">
                <input class="rounded-pill mt-3" type="submit" style="background-color: #1D7A8C;color: #FFFFFF;border: 0px;padding: 5px 10px;">
                </form>
            </div>
            <%} %>
          </div>
        </div>
      </div>
      <%}} %>

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
        
    </script>

<!-- jQuery library -->
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>

<!-- Latest compiled JavaScript -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p" crossorigin="anonymous"></script>
</body>
</html>