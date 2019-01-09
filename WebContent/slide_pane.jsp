<?xml version="1.0" encoding="UTF-8" ?>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<script type="text/javascript" charset="utf-8">
	var paneNum=16;
	for (var i = 0; i < paneNum; i++) {
		var pane = document.getElementById("slide-pane-"+i);
		var paneStatus=pane.getAttribute("class");
		var paneId="paneId="+i;
		if(paneId == "active item")
		{
			$.ajax({
				   type: "POST",
				   url: "movieChoose.jsp",
				   data: paneId, 
				   success: function(msg){
					 //alert( "Data Saved: " + msg );
				   }
			});
		}
		break;
	}
	<%
		String string=request.getParameter("paneId");
		System.out.println(string);
	%>
</script>
