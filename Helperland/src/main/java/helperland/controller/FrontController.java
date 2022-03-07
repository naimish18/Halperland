package helperland.controller;

import java.net.MalformedURLException;
import java.net.URL;
import java.net.http.HttpRequest;
import java.sql.Timestamp;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.hibernate.SQLQuery;
import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import helperland.dao.UpdateServiceDao;
import helperland.model.City;
import helperland.model.Contactus;
import helperland.model.Rating;
import helperland.model.Servicerequest;
import helperland.model.Servicerequestaddress;
import helperland.model.Servicerequestextra;
import helperland.model.User;
import helperland.model.Useraddress;
import helperland.model.Zipcode;
import helperland.other.AES;
import helperland.service.CancelServiceService;
import helperland.service.CityService;
import helperland.service.ContactusService;
import helperland.service.RatingService;
import helperland.service.ServicerequestService;
import helperland.service.ServicerequestaddressService;
import helperland.service.ServicerequestextraService;
import helperland.service.UpdateServiceService;
import helperland.service.UserService;
import helperland.service.UseraddressService;
import helperland.service.ZipcodeService;

@Controller
public class FrontController {
	
	@Autowired
	private UserService userService;
	
	@Autowired
	private ContactusService contactusService;
	
	@Autowired
	private UseraddressService useraddressService;
	
	@Autowired
	private ZipcodeService zipcodeService;
	
	@Autowired
	private CityService cityService;
	
	@Autowired
	private ServicerequestService servicerequestService;
	
	@Autowired
	private ServicerequestaddressService servicerequestaddressService;
	
	@Autowired
	private ServicerequestextraService servicerequestextraService;
	
	@Autowired
	private CancelServiceService cancelServiceService;
	
	@Autowired
	private UpdateServiceService updateServiceService;
	
	@Autowired
	private RatingService ratingService;
	
	Timestamp date=new Timestamp(new Date().getTime());
	@RequestMapping(path = "/create_user",method = RequestMethod.POST)
	public String createUser(@ModelAttribute User user,HttpServletRequest request) {
		user.setUserTypeId(1);
		user.setCreatedDate(date);
		user.setModifiedDate(date);
		user.setModifiedBy(0);
		user.setIsApproved(0);
		List<User> users=userService.getUsers();
		boolean flag=true;
		for (User user1 : users) {
			if (user1.getEmail().equals(user.getEmail())) {
				flag=false;
				break;
			}
		}
		if(flag) {
			HttpSession session=request.getSession();
			session.setAttribute("user", user);
			userService.saveUser(user);
			System.out.println(user);
		}
		else if(!flag) {
			System.out.println("email already registered");
		}
		return "redirect:/index.jsp";
	}
	
	@RequestMapping(path = "/login",method = RequestMethod.POST)
	public String Userlist(@RequestParam("email") String email,@RequestParam("password") String password,HttpServletRequest request) {
		Map<Integer, String> user_type= new HashMap<Integer, String>();
		user_type.put(0, "Admin");
		user_type.put(1, "Customer");
		user_type.put(2, "Service Provider");
		List<User> users=userService.getUsers();
		Map<Integer, User> providers=new HashMap<Integer, User>();
		Map<Integer, Double> rating=new HashMap<Integer, Double>();
		for (User user : users) {
			if(user.getUserTypeId()==2) {
				providers.put(user.getUserId(), user);
				rating.put(user.getUserId(), ratingService.getRatings(user.getUserId()));
			}
		}
		for (User user : users) {
			if(user.getEmail().equals(email) && user.getPassword().equals(password)) {
				if(user.getUserTypeId()==1 || user.getIsApproved()==1) {
//					List<Useraddress> useraddresses=useraddressService.getAddresses();
//					List<Useraddress> u_addresses= new ArrayList<Useraddress>();
//					for (Useraddress useraddress : useraddresses) {
//						if(useraddress.getUserId()==user.getUserId()) {
//							u_addresses.add(useraddress);
//						}
//					}
					HttpSession session=request.getSession();
					session.setAttribute("user", user);
					session.setAttribute("user_id", user.getUserId());
					session.setAttribute("user_type", user.getUserTypeId());
					List<Useraddress> useraddress=new ArrayList<Useraddress>();
					List<Useraddress> u_addresses=useraddressService.getAddresses();
					for (Useraddress address : u_addresses) {
						if(address.getUserId()==user.getUserId() && address.isIsDeleted()==false) {
							useraddress.add(address);
						}
					}
					session.setAttribute("userAddress", useraddress);
					session.setAttribute("service_avail",null);
					session.setAttribute("city", null);
					session.setAttribute("postalcode", null);
					List<Servicerequest> servicerequests=servicerequestService.getServiceRequests(user.getUserId());
					List<Servicerequestaddress> servicerequestaddresses=new ArrayList<Servicerequestaddress>();
					List<String> extra_services=new ArrayList<String>();
					for (Servicerequest servicerequest : servicerequests) {
						servicerequestaddresses.add(servicerequestaddressService.getServiceaddresses(servicerequest.getServiceRequestId()).get(0));
						extra_services.add(servicerequestextraService.getExtraServices(servicerequest.getServiceRequestId()));
					}
					session.setAttribute("service_addresses", servicerequestaddresses);
					session.setAttribute("services", servicerequests);
					session.setAttribute("providers", providers);
					session.setAttribute("extra_services", extra_services);
					session.setAttribute("rating", rating);
					System.out.println(user);
					System.out.println("Success"+" UserType: "+user_type.get(user.getUserTypeId()));
					return "redirect:/index.jsp";
				}
				else {
					System.out.println("Unsuccess UserType :"+user_type.get(user.getUserTypeId())+" User is not Approved");
					return "redirect:/index.jsp";
				}
			}
		}
		System.out.println("Unsuccess");
		return "redirect:/index.jsp";
	}
	
	@RequestMapping(path = "/savecontact",method = RequestMethod.POST)
	public String saveContact(@ModelAttribute Contactus contactus) {
		contactusService.saveContactus(contactus);
		System.out.println(contactus);
		return "redirect:/contact.jsp";
	}
	
	@RequestMapping(path = "/save_provider",method = RequestMethod.POST)
	public String saveServiceProvider(@ModelAttribute User serviceProvider) {
		serviceProvider.setUserTypeId(2);
		serviceProvider.setCreatedDate(date);
		serviceProvider.setModifiedDate(date);
		serviceProvider.setModifiedBy(0);
		serviceProvider.setIsApproved(0);
		List<User> users=userService.getUsers();
		boolean flag=true;
		for (User user1 : users) {
			if (user1.getEmail().equals(serviceProvider.getEmail())) {
				flag=false;
				break;
			}
		}
		if(flag) {
			System.out.println("Save Provider in db");
			userService.saveUser(serviceProvider);
		}
		else if (!flag) {
			System.out.println("Email already exists");
		}
		return "redirect:/index.jsp";
	}
	
	@RequestMapping(path = "/forgotPassword",method = RequestMethod.POST)
	public String resetPassword(HttpServletRequest req) throws MalformedURLException {
		
//		sending mail
		
		
		List<User> users=userService.getUsers();
		for (User user : users) {
			if(user.getEmail().equals(req.getParameter("email"))) {
				AES aes=new AES();
				String encrypt_email=aes.encrypt(req.getParameter("email"));
				URL url=new URL("http://localhost:8080/HelperLand/new_password.jsp?email="+encrypt_email);
				String message="Link to set new Password  "+url;
				String subject="Change Password";
				String to=req.getParameter("email");
				String from="naimish.mulani18@gmail.com";
				
				String host="smtp.gmail.com";
				
				Properties properties= System.getProperties();
				
				properties.put("mail.smtp.host", host);
				properties.put("mail.smtp.port", "465");
				properties.put("mail.smtp.ssl.enable", "true");
				properties.put("mail.smtp.auth", "true");
				
				Session session= Session.getInstance(properties, new Authenticator() {

					@Override
					protected PasswordAuthentication getPasswordAuthentication() {
						
						return new PasswordAuthentication("naimish.mulani18@gmail.com", "your password");
					}
					
				});
				
				session.setDebug(true);
				
				MimeMessage msg=new MimeMessage(session);
				
				try {
					msg.setFrom(from);
					msg.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
					msg.setSubject(subject);
					msg.setText(message);
					
					Transport.send(msg);
					System.out.println("Mail send successfully");
					
				} catch (MessagingException e) {
					e.printStackTrace();
				}
				System.out.println(url);
				return "redirect:/index.jsp";
			}
		}
		System.out.println("Email is not registered");
		return "redirect:/user_registration.jsp";
		
	}
	@RequestMapping(path = "/savePassword", method = RequestMethod.POST)
	public String savePassword(HttpServletRequest req) {
		AES aes =new AES();
		String decrypt_email=aes.decrypt(req.getParameter("email"));
		System.out.println(req.getParameter("password")+" "+req.getParameter("email")+" "+decrypt_email);
		int id=0;
		List<User> users=userService.getUsers();
		for (User user1 : users) {
			if (user1.getEmail().equals(decrypt_email)) {
				id=user1.getUserId();
			}
		}
		User user=userService.getUser(id);
		user.setPassword(req.getParameter("password"));
		user.setModifiedDate(date);
		userService.saveUser(user);
		System.out.println(user);
		
		return "redirect:/index.jsp";
	}
	
	@RequestMapping("/logout")
	public String logout(HttpServletRequest request) {
		HttpSession session=request.getSession();
		User user=new User();
		List<Useraddress> useraddress= new ArrayList<Useraddress>();
		List<Servicerequest> servicerequests=new ArrayList<Servicerequest>();
		session.setAttribute("user", user);
		session.setAttribute("user_id", null);
		session.setAttribute("user_type", -1);
		session.setAttribute("addresses", useraddress);
		session.setAttribute("service_avail", null);
		session.setAttribute("city", null);
		session.setAttribute("postalcode", null);
		session.setAttribute("services", servicerequests);
		session.setAttribute("providers", null);
		session.setAttribute("service_addresses", null);
		session.setAttribute("extra_services", null);
		session.setAttribute("rating", null);
		session.setAttribute("userAddress", useraddress);
		session.setAttribute("new_services", servicerequests);
		session.setAttribute("customers", null);
		
		return "redirect:/index.jsp";
	}
	
	@RequestMapping(path = "/addAddress",method = RequestMethod.POST)
	public void addAddress(@ModelAttribute Useraddress useraddress,HttpServletRequest request) {
		HttpSession session=request.getSession();
		useraddress.setUserId((Integer)session.getAttribute("user_id"));
		useraddress.setIsDeleted(false);
		List<Useraddress> useradd= new ArrayList<Useraddress>();
		useradd=(List<Useraddress>) session.getAttribute("addresses");
		
		System.out.println("before "+useradd);
		useraddress.setCity((String)session.getAttribute("city"));
		useraddress.setPostalCode((String)session.getAttribute("postalcode"));
		useradd.add(useraddress);
		System.out.println(useraddress);
		System.out.println("after "+useradd);
		session.setAttribute("addresses", useradd);
		System.out.println("session add "+session.getAttribute("addresses"));
		useraddressService.saveAddress(useraddress);
		
	}
	
	@RequestMapping(path="/saveService",method = RequestMethod.POST)
	public String saveService(HttpServletRequest request) {
		HttpSession session=request.getSession();
		String date_string=request.getParameter("service_date")+" "+request.getParameter("service_time")+":00.000000";
		System.out.println(date_string);
		DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSSSSSS");
		Date date1 = null;
		try {
			date1 = dateFormat.parse(date_string);
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		Timestamp service_start_date=new Timestamp(date1.getTime());
		Servicerequest servicerequest=new Servicerequest();
		servicerequest.setServiceStartDate(service_start_date);
		servicerequest.setUserId((Integer)session.getAttribute("user_id"));
		servicerequest.setServiceId(1);
		servicerequest.setZipCode((String)session.getAttribute("postalcode"));
		servicerequest.setComments(request.getParameter("comments"));
		servicerequest.setCreatedDate(date);
		servicerequest.setModifiedDate(date);
		double total_hours=Double.parseDouble(request.getParameter("service_hours"));
		double extra_hours=Double.parseDouble(request.getParameter("service_extra_hours"));
		servicerequest.setServiceHours(total_hours);
		servicerequest.setExtraHours(extra_hours);
		servicerequest.setTotalCost(total_hours*25);
		servicerequest.setSubTotal(total_hours*25);
		servicerequest.setStatus("new");
		servicerequest.setServiceProviderId(null);
		if(request.getParameter("have_pets")==null) {
			servicerequest.setHasPets(false);
		}
		else {
			servicerequest.setHasPets(true);
		}
		System.out.println("extra "+request.getParameter("fridge"));
		servicerequestService.saveServicerequest(servicerequest);
		int service_req_id=0;
		List<Servicerequest> servicerequests= servicerequestService.getServiceRequests();
		for (Servicerequest servicerequest2 : servicerequests) {
			service_req_id=servicerequest2.getServiceRequestId();
		}
		System.out.println(service_req_id+" "+servicerequests);
		Useraddress useraddress=new Useraddress();
		useraddress=useraddressService.getAddress(Integer.parseInt(request.getParameter("address1")));
		
		Servicerequestaddress servicerequestaddress=new Servicerequestaddress();
		servicerequestaddress.setAddressLine1(useraddress.getAddressLine1());
		servicerequestaddress.setAddressLine2(useraddress.getAddressLine2());
		servicerequestaddress.setCity(useraddress.getCity());
		servicerequestaddress.setMobile(useraddress.getMobile());
		servicerequestaddress.setPostalCode(useraddress.getPostalCode());
		servicerequestaddress.setServiceRequestId(service_req_id);
		
		System.out.println(servicerequestaddress);
		servicerequestaddressService.saveServiceAddress(servicerequestaddress);
		
		
		if(request.getParameter("cabinate") != null) {
			Servicerequestextra servicerequestextra=new Servicerequestextra();
			servicerequestextra.setServiceRequestId(service_req_id);
			servicerequestextra.setServiceExtraId(1);
			System.out.println(servicerequestextra);
			servicerequestextraService.saveExtraService(servicerequestextra);
		}
		if(request.getParameter("fridge") != null) {
			Servicerequestextra servicerequestextra=new Servicerequestextra();
			servicerequestextra.setServiceRequestId(service_req_id);
			servicerequestextra.setServiceExtraId(2);
			System.out.println(servicerequestextra);
			servicerequestextraService.saveExtraService(servicerequestextra);
		}
		if(request.getParameter("oven") != null) {
			Servicerequestextra servicerequestextra=new Servicerequestextra();
			servicerequestextra.setServiceRequestId(service_req_id);
			servicerequestextra.setServiceExtraId(3);
			System.out.println(servicerequestextra);
			servicerequestextraService.saveExtraService(servicerequestextra);
		}
		if(request.getParameter("laundry") != null) {
			Servicerequestextra servicerequestextra=new Servicerequestextra();
			servicerequestextra.setServiceRequestId(service_req_id);
			servicerequestextra.setServiceExtraId(4);
			System.out.println(servicerequestextra);
			servicerequestextraService.saveExtraService(servicerequestextra);
		}
		if(request.getParameter("windows") != null) {
			Servicerequestextra servicerequestextra=new Servicerequestextra();
			servicerequestextra.setServiceRequestId(service_req_id);
			servicerequestextra.setServiceExtraId(5);
			System.out.println(servicerequestextra);
			servicerequestextraService.saveExtraService(servicerequestextra);
		}
		List<Servicerequest> servicerequests1=servicerequestService.getServiceRequests((Integer)session.getAttribute("user_id"));
		List<Servicerequestaddress> servicerequestaddresses=new ArrayList<Servicerequestaddress>();
		List<String> extra_services=new ArrayList<String>();
		for (Servicerequest servicerequest1 : servicerequests1) {
			servicerequestaddresses.add(servicerequestaddressService.getServiceaddresses(servicerequest1.getServiceRequestId()).get(0));
			extra_services.add(servicerequestextraService.getExtraServices(servicerequest1.getServiceRequestId()));
		}
		List<User> users=userService.getUsers();
		Map<Integer, User> providers=new HashMap<Integer, User>();
		for (User user : users) {
			if(user.getUserTypeId()==2) {
				providers.put(user.getUserId(), user);
			}
		}
		session.setAttribute("service_addresses", servicerequestaddresses);
		session.setAttribute("services", servicerequests1);
		session.setAttribute("providers", providers);
		session.setAttribute("extra_services", extra_services);
		return "redirect:/index.jsp";
	}
	
	@RequestMapping(path = "/check_zipcode" ,method = RequestMethod.POST)
	public ResponseEntity<HttpStatus> chech_zipcode(@RequestBody String postal_code,HttpServletRequest request) {
		System.out.println(postal_code);
		HttpSession session=request.getSession();
		List<User> users=userService.getUsers();
		for (User user : users) {
			if(user.getUserTypeId()==2 && user.getZipCode().equals(postal_code)) {
				int login_user=(Integer) session.getAttribute("user_id");
				List<Useraddress> useraddresses=useraddressService.getAddresses();
				List<Useraddress> u_addresses= new ArrayList<Useraddress>();
				for (Useraddress useraddress : useraddresses) {
					System.out.println(useraddress.getUserId()+" "+login_user+" "+useraddress.getPostalCode()+" "+postal_code);
					if(useraddress.getUserId()==login_user && useraddress.getPostalCode().equals(postal_code)) {
						u_addresses.add(useraddress);
					}
				}
				
				session.setAttribute("addresses", u_addresses);
				List<Zipcode> zipcodes=zipcodeService.getZipcode();
				int city_id=0;
				for (Zipcode zipcode : zipcodes) {
					if(zipcode.getZipcodeValue().equals(postal_code)) {
						city_id=zipcode.getCityId();
						break;
					}
				}
				City city=cityService.getCity(city_id);
				System.out.println(session.getAttribute("addresses"));
				System.out.println(city);
				session.setAttribute("city", city.getCityName());
				session.setAttribute("postalcode", postal_code);
				return new ResponseEntity<HttpStatus>(HttpStatus.OK);
			}
		}
		return new ResponseEntity<HttpStatus>(HttpStatus.BAD_REQUEST);
	}
	
	@RequestMapping(path = "cancelService",method = RequestMethod.POST)
	public String cancelService(HttpServletRequest request) {
		HttpSession session=request.getSession();
		cancelServiceService.cancelService(Integer.parseInt(request.getParameter("id")));
		List<Servicerequest> servicerequests=servicerequestService.getServiceRequests((Integer)session.getAttribute("user_id"));
		session.setAttribute("services", servicerequests);
		System.out.println("canceled");
		return "redirect:/customer_dashboard.jsp";
	}
	
	@RequestMapping(path = "updateService",method = RequestMethod.POST)
	public String updateService(HttpServletRequest request) {
		HttpSession session=request.getSession();
		String date_string=request.getParameter("service_date")+" "+request.getParameter("service_time")+":00.000000";
		System.out.println(date_string);
		DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd hh:mm:ss.SSSSSSS");
		Date date1 = null;
		try {
			date1 = dateFormat.parse(date_string);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Timestamp service_start_date=new Timestamp(date1.getTime());
		updateServiceService.updateService(Integer.parseInt(request.getParameter("id")), service_start_date);
		List<Servicerequest> servicerequests=servicerequestService.getServiceRequests((Integer)session.getAttribute("user_id"));
		session.setAttribute("services", servicerequests);
		return "redirect:/customer_dashboard.jsp";
	}
	
	@RequestMapping(path = "saveRatings" ,method = RequestMethod.POST)
	public String saveRatings(@ModelAttribute Rating rating) {
		double avg_rating=(rating.getFriendly()+rating.getOnTimeArrival()+rating.getQualityOfService())/3;
		rating.setRatings(avg_rating);
		rating.setRatingDate(date);
		ratingService.saveRatings(rating);
		System.out.println(rating);
		return "redirect:/service_history.jsp";
	}
	
	@RequestMapping(path = "updateAddress" ,method = RequestMethod.POST)
	public String updateAddress(@ModelAttribute Useraddress useraddress,HttpServletRequest request) {
		HttpSession session=request.getSession();
		System.out.println(useraddress);
		useraddressService.saveAddress(useraddress);
		List<Useraddress> useraddress1=new ArrayList<Useraddress>();
		List<Useraddress> u_addresses=useraddressService.getAddresses();
		for (Useraddress address : u_addresses) {
			if(address.getUserId()==(Integer)session.getAttribute("user_id") && address.isIsDeleted()==false) {
				useraddress1.add(address);
			}
		}
		session.setAttribute("userAddress", useraddress1);
		return "redirect:/customer_settings.jsp";
	}
	
	@RequestMapping(path = "/deleteAddress" ,method = RequestMethod.POST)
	public String deleteAddress(HttpServletRequest request) {
		HttpSession session=request.getSession();
		useraddressService.deleteAddress(Integer.parseInt(request.getParameter("AddressId")));
		List<Useraddress> useraddress1=new ArrayList<Useraddress>();
		List<Useraddress> u_addresses=useraddressService.getAddresses();
		for (Useraddress address : u_addresses) {
			if(address.getUserId()==(Integer)session.getAttribute("user_id") && address.isIsDeleted()==false) {
				useraddress1.add(address);
			}
		}
		session.setAttribute("userAddress", useraddress1);
		return "redirect:/customer_settings.jsp";
	}
	
	@RequestMapping(path = "updateDetails" ,method = RequestMethod.POST)
	public String updateDetails(HttpServletRequest request) {
		HttpSession session=request.getSession();
		User user=(User)session.getAttribute("user");
		user.setModifiedDate(date);
		user.setFirstName(request.getParameter("FirstName"));
		user.setLastName(request.getParameter("LastName"));
		user.setMobile(request.getParameter("Mobile"));
		String date_string=request.getParameter("DateOfBirth");
		System.out.println(date_string);
		DateFormat dateFormat=new SimpleDateFormat("yyyy-MM-dd");
		Date date1 = null;
		try {
			date1 = dateFormat.parse(date_string);
		} catch (ParseException e) {
			e.printStackTrace();
		}
		Timestamp dob=new Timestamp(date1.getTime());
		user.setDateOfBirth(dob);
		userService.saveUser(user);
		session.setAttribute("user", user);
		return "redirect:/customer_settings.jsp";
	}
	
	@RequestMapping(path = "updatePassword" ,method = RequestMethod.POST)
	public String updatePassword(HttpServletRequest request) {
		HttpSession session=request.getSession();
		userService.updatePassword((Integer)session.getAttribute("user_id"), request.getParameter("NewPassword"));
		User user=userService.getUser((Integer)session.getAttribute("user_id"));
		session.setAttribute("user", user);
		return "redirect:/customer_settings.jsp";
	}
	
	@RequestMapping("/new-service-request")
	public String newServiceRequest(Model model,HttpServletRequest request) {
		HttpSession session=request.getSession();
		User user=userService.getUser((Integer)session.getAttribute("user_id"));
		List<Servicerequest> servicerequests=new ArrayList<Servicerequest>();
		List<User> customers=new ArrayList<User>();
		List<Servicerequestaddress> addresses=new ArrayList<Servicerequestaddress>();
		List<String> extra_services=new ArrayList<String>();
		for (Servicerequest service : servicerequestService.getServiceRequests()) {
			if(service.getStatus().equals("new") && service.getServiceProviderId()==null) {
				servicerequests.add(service);
				customers.add(userService.getUser(service.getUserId()));
				Servicerequestaddress sra=servicerequestaddressService.getServiceaddresses(service.getServiceRequestId()).get(0);
				addresses.add(sra);
				extra_services.add(servicerequestextraService.getExtraServices(service.getServiceRequestId()));
			}
		}
		System.out.println(addresses);
		session.setAttribute("new_services", servicerequests);
		session.setAttribute("customers", customers);
		session.setAttribute("new_service_address", addresses);
		session.setAttribute("extra_services", extra_services);
		model.addAttribute("user", user);
		System.out.println("new service request");
		return "new_service_request";
	}
	
	@RequestMapping(path = "acceptService" ,method = RequestMethod.POST)
	public String acceptService(HttpServletRequest request) {
		HttpSession session=request.getSession();
		servicerequestService.acceptService((Integer)session.getAttribute("user_id"), Integer.parseInt(request.getParameter("service_req_id")));
		System.out.println("service Accepted");
		return "redirect:/new-service-request";
	}
	
	@RequestMapping("/upcomig-service")
	public String upcomingService() {
		return "upcoming_service";
	}
	
}

