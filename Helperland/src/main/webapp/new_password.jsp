<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Change Password</title>
</head>
<body>
    <form action="savePassword" onsubmit="return validate()" method="post" style="margin-left: auto;margin-right: auto;width: fit-content;margin-top: 50px;">
    	<input type="text" name="email" value=<%=request.getParameter("email") %> style="display: none;">
        <label for="password" style="display: block;font-size: 20px;font-family: 'Roboto',sans-serif;font-weight: bold;">New Password</label>
        <input type="text" placeholder="Password" required pattern="^(?=.*[a-z])(?=.*[A-Z])(?=.*[0-9])(?=.*[!@#$%^&*_=+-]).{8,12}$" name="password" id="password" style="margin-top: 5px;width: 250px;height: 36px;display: block;font-size: 18px;">
        <label for="conf_password" style="display: block;font-size: 20px;font-family: 'Roboto',sans-serif;font-weight: bold;margin-top: 10px;">Confirm Password</label>
        <input type="text" placeholder="Confirm Password" required name="conf_password" id="conf_password" style="margin-top: 5px;width: 250px;height: 36px;display: block;font-size: 18px;">
        <div id="error" style="color: #ff3860;font-size: 12px;"></div>
        <button type="submit" value="Save" style="margin-top: 15px;font-size: 16px;font-family: 'Roboto',sans-serif;font-weight: bold;padding: 9px 14px;border-radius: 20px;border: 0px;background-color:#1d7a8c;color: #FFFFFF;">Save</button>
    </form>
    
    <script type="text/javascript">
        
        function validate(){
            const password=document.getElementById("password");
            const conf_password=document.getElementById("conf_password");
            const form=document.getElementById("form");
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
</body>
</html>