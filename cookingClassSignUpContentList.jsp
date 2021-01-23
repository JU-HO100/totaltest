<%@page import="com.sun.xml.internal.bind.v2.runtime.Location"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import = "java.util.*" %>
<% List<Map<String, Object>> list = (List<Map<String, Object>>)request.getAttribute("list");
int i=0;
%>
<table style="width: 100%">
	<tr>
		<td style="width: 80%; padding-left: 5%; padding-right: 5%">
			<table class="table table-hover">
			    <tbody>
<% for(Map<String, Object> rmap:list) { %>
<% i += 1; %>
<% if(rmap.get("C_CLASSCD")!=null){ %>
			      <tr style="cursor: pointer;">
			      	<td style="width: 20%;">
			      		<input type="image" src="/images/food.jpg" style="width: 100%;">
			      	</td>
			      	<td style="width: 80%;">
			      	<form name="classSubmit" method="get" action="/cookclass/joinClass.np">
			      		<table style="width: 100%;">
			      			<tr>
			      				<td style="border: none;">
			      					제목:<%=rmap.get("C_COOK") %>
			      				</td>
			      				<td style="border: none; text-align: right;">
			      					날짜:<%=rmap.get("C_DATE") %>
			      				</td>
			      			</tr>
			      			<tr>
			      				<td colspan="2" style="border: none;">
			      					준비물:<%=rmap.get("C_INGREDIENTS") %>
			      				</td>
			      			</tr>
			      			<tr>
			      				<td colspan="2" style="border: none;">
			      					주소:<%=rmap.get("C_ZIP") %>
			      				</td>
			      			</tr>
			      			<tr>
			      				<td style="border: none;">
			      					현원:<%=2%>/총원:<%=rmap.get("C_MEMBER") %>
			      				</td>
			      				<td style="border: none; text-align: right;">
			      					<input type="hidden" name="m_id"  id="m_id" value="choihoyeon30">
			      					<input type=hidden  name="c_classcd" id="c_classcd<%=i %>" value=<%=rmap.get("C_CLASSCD") %>>
									<button type="button" class="btn btn-outline-dark"  onclick="gosubmit()">신청하기</button>
			      				</td>
			      			</tr>
			      		</table>
			      		</form>
			      	</td>
			      </tr>
			 <%}}%>
			    </tbody>
		  </table>
