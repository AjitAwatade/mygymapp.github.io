<%@page import="java.sql.ResultSet"%>
<%@page import="com.mysql.cj.jdbc.result.ResultSetFactory"%>
<%@page import="com.example.DBClass"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%
    DBClass db=new DBClass();
    if(request.getParameter("did")!=null){
    	String nam=request.getParameter("did");
    	db.execute("delete from gym where name=?",nam);
    	String msg="This record can be deleted";
    }
    %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Our All Members</title>
<link href="css/bootstrap.css" rel="stylesheet">
</head>
<body>
<div class="container">
<div>

</div>
<table id="table1" class="table table-bordered">
<thead class="bg-dark text-white">
<tr>
<th>Name</th>
<th>Email</th>
<th>Phone Number</th>
<th>Address</th>
<th>Gender</th>
<th>Date</th>
<th>Action</th>
</tr>
</thead>
<tbody>
<%
ResultSet rs=db.getData("select * from gym");
while(rs.next()){
%>
<tr>
<td><%=rs.getString(1)%></td>
<td><%=rs.getString(2)%></td>
<td><%=rs.getString(3)%></td>
<td><%=rs.getString(4)%></td>
<td><%=rs.getString(5)%></td>
<td><%=rs.getString(6)%></td>
<td>
<a href="members.jsp?did=<%=rs.getString(1)%>" class="btn btn-danger">Delete</a>
<%
}
%>
</tbody>
</table>
</div>
</body>
</html>