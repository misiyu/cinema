<?xml version="1.0" encoding="UTF-8" ?>
<%@page import="java.util.ArrayList"%>
<%@page import="java.util.List"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="com.database.MovieAction"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<title>Insert title here</title>
<script type="text/javascript" src="./use/jquery.min.js"></script>
<script type="text/javascript" charset="utf-8">
var data = new Array();
<%
List list=new ArrayList();
list.add(0);
list.add(1);
if(list!=null){
for(int j=0;j<list.size();j++)
{%>
    //alert("111");
    data[<%=j%>] = '<%=list.get(j)%>';
    alert(data[<%=j%>]);
<%}
}%>

	function bbb(){
		var fon = document.getElementById("font1");
		fon.setAttribute("color", "blue");
		var sss="name="+"john";
		$.ajax({
			   type: "POST",
			   url: "test.jsp",
			   data: sss,
			   success: function(msg){
			     //alert( "Data Saved: " + msg );
			   }
			});
		<%
		String s = request.getParameter("name");
		System.out.println(s);
		%>
	}
	function aaa() {
		var fon = document.getElementById("font1");
		fon.setAttribute("color", "blue");
		//var cnt =1;
		var form1 = document.getElementById("form1");
		//var input1=document.getElementById("param1");
		form1.param1.value = 2;
		form1.submit();
		<%
			//String s = request.getParameter("param1");
			//System.out.println(s);
		%>
	}
</script>
</head>
<body>


	<form type="hidden" method="post" id="form1" >
		<input type="hidden" name="param1" /> <input type="hidden"
			name="param2" />
	</form>
	<h1 >00000000000000</h1>
	<div height='100px' width="100px" background-color='red' id="div1" onmouseover="bbb();">
		<font color="red" id='font1'>i77777</font>
	</div>
	<div height='100px' width="100px" background-color='red'>
		<font>i77777</font>
	</div>
</body>
</html>
