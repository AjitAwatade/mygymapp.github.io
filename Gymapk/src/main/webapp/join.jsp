<%@page import="com.example.DBClass"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    DBClass db=new DBClass();
    String s=request.getParameter("save");
    String name="",address="",phone="",email="",date="",gender="",msg="";
    if(s!=null){
    	name=request.getParameter("name");
    	email=request.getParameter("email");
    	phone=request.getParameter("phone");
    	address=request.getParameter("address");
    	gender=request.getParameter("gender");
    	date=request.getParameter("date");
	if(s.equals("Submit Now")){
		db.execute("insert into gym value(?,?,?,?,?,?)",name,email,phone,address,gender,date);
		msg="Welcome! You have joined GYM Now..... ";
	}	
    }  
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Welcome to join my GYM</title>
<link href="css/bootstrap.css" rel="stylesheet">
</head>
<style>
label.error{
color: red;
font-weight: bold;
}
.card-header{
background-color: #343a40;
}
.card-header h1{
font-weight: bolder;
text-align: center;
}
.card-body{
background-color: #85e0c5;
}
div{
font-weight: bold;
color: black;
}
</style>
<body>
<div class="container">
<div class="card card-primary">
<div class="card-header" >
<h1>JOIN MY GYM</h1>
</div>
<div class="card-body">
<form action="" method="post" id="form1">
<div class="form-group">
Name
<input type="text" name="name" id="name" value="<%=name %>" class="form-control">
</div>
<div class="form-group">
Email
<input type="email" name="email" id="email" value="<%=email%>" class="form-control">
</div>
<div class="form-group">
Phone Number
<input type="number" name="phone" id="phone" value="<%=phone%>" class="form-control">
</div>
<div class="form-group">
Address
<input type="text" name="address" id="address" value="<%=address%>" class="form-control">
</div>
<div class="form-group">
Gender:
<select name="gender" id="gender" value="<%=gender %>" class="form-control">
<option value=""><----Select Gender----></option>
<option value="male">Male</option>
<option value="female">FeMale</option>
</select>
</div>
<div class="form-group">
Date
<input type="date" name="date" id="date" class="form-control" value="<%=date%>">
</div>
<br>
<div class="form-group">
<input type="submit" name="save" id="save" class="btn btn-success" value="Submit Now">
<a href="join.jsp" class="btn btn-info">Reset</a>
<a href="home1.html" class="btn btn-danger">Back to Home</a>
</div>
<div class="form-group">
<h1><%=msg %></h1>
</div>
<script src="js/jquery-3.6.0.js"></script>
<script src="js/additional-methods.js"></script>
<script src="js/jquery.validate.js"></script>
<script src="js/sweetalert.min.js"></script>
<script >
<%
if(!msg.equals("")){
%>

swal({
	title:"Welcome to MY GYM",
	text:"<%=msg%>",
	icon:"success"
});

<%
}
%>
</script>
<script >
function f1(){
	$("#form1").validate({
		rules:{
			name:{
				required:true
			},
			email:{
				required:true
			},
			phone:{
				required:true
			},
			address:{
				required:true
			},
			gender:{required:true},
			date:{required:true}
		},
		messages:{
			name:{
				required:"Name is reuired"
			},
			email:{
				required:"Email is reuired"
			},
			phone:{
				required:"Phone Number is reuired"
			},
			address:{
				required:"Address is reuired"
			},
			gender:{required:"Gender is reuired"},
			date:{required:"Date is reuired"}
		}
	});
}
$(document).ready(f1());
</script>
</form>
</div>
</div>
</div>
</body>
</html>