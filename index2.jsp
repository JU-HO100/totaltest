<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<%List<Map<String,Object>> list = (List<Map<String,Object>>)session.getAttribute("id"); %>

<% if(list != null){
	out.print(list);
}else{
	out.print("세션 안왔다");
}
	%>