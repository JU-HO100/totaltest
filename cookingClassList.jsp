<%@page import="com.sun.xml.internal.bind.v2.runtime.Location"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<% String MSG = (String)request.getAttribute("msg"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/common/bootstrap_common.jsp"%>
<title>오늘 뭐 먹지?</title>
<script type="text/javascript">
function cookingClassSignUpContent(){
    $.ajax({
      type : "GET",
      url : "/cookclass/showClass.np?m_id=test123",
      dataType : "text",
      error : function() {
        alert('통신실패!!');
      },
      success : function(data) {
        $('#tb_ajax').html(data);
      }

    });
  }
function cookingClassRegisterContent(){
    $.ajax({
      type : "GET",
      url : "../cookingClassRegisterContent.jsp",
      dataType : "text",
      error : function() {
        alert('통신실패!!');
      },
      success : function(data) {
        $('#tb_ajax').html(data);
      }

    });
  }

function check() {
		//제목 공백 확인
	    if($("#c_cook").val() == ""){
	      alert("제목을 입력해주세요.");
	      $("#c_cook").focus();
	      return false;
	    }
		
	  //재료 공백 확인
	    if($("#c_ingredients").val() == ""){
	      alert("재료를 입력해주세요");
	      $("#c_ingredients").focus();
	      return false;
	    }
	  
	  //실습주소 공백 확인
	    if($("#c_zip").val() == ""){
	      alert("실습주소를 입력해주세요");
	      $("#c_zip").focus();
	      return false;
	    }
	  
	  //날짜 공백 확인
	    if($("#c_date").val() == ""){
	      alert("날짜를 입력해주세요");
	      $("#c_date").focus();
	      return false;
	    }
	  
	  //수강 최대 인원 공백 확인
	    if($("#c_ingredients").val() == ""){
	      alert("수강 최대인원을 입력해주세요");
	      $("#c_ingredients").focus();
	      return false;
	    }
	alert("등록되었습니다");
	return true;
}
function gosubmit(){// c_classcd1 - 쿠킹클래스의 개수까지
	
}
</script>
</head>
<body>
	<table align="center" style="width: 70% ; height: 100%;">
			<!-- Header -->
		<tr>
			<%if(session.getAttribute("nick")!=null){ %>
			<td colspan="2" style="width: 100%; padding-top: 2%; padding-bottom: 2%;">
				<%@ include file="/loginOkHeader.jsp"%>
			</td>
			<%}else{ %>
			<td colspan="2" style="width: 100%; padding-top: 2%; padding-bottom: 2%;">
				<%@ include file="/header.jsp"%>
			</td>
			<%} %>
		</tr>
			<!-- END Header -->
			
			<!-- NavBar -->
		<tr>
			<td colspan="2" style="width: 100%;">
				<%@ include file="/navbar.jsp" %>
			</td>
		</tr>
			<!-- END NavBar -->
			
			<!-- Content -->
		<tr>
			<td style="width: 19%; vertical-align: top;">
				<div class="btn-group-vertical" style="width: 100%; margin-top: 12%">
					 <button type="button" class="btn btn-outline-dark" style="text-align: left;" onclick="cookingClassSignUpContent()">쿠킹 클래스 신청</button>
					 <button type="button" class="btn btn-outline-dark" style="text-align: left;" onclick="cookingClassRegisterContent()">쿠킹 클래스 등록</button>
				</div>
			</td>
			<td style="width: 70%; padding-top:3% ;padding-left: 5%; padding-right: 5%">
				<div id="tb_ajax">
					<script type="text/javascript">
					$.ajax({
					      type : "GET",
					      url : "/cookclass/showClass.np?m_id=choihoyeon30",
					      dataType : "text",
					      error : function() {
					        alert('통신실패!!');
					      },
					      success : function(data) {
					        $('#tb_ajax').html(data);
					      }

					    });
					</script>
				</div>
			</td>
		</tr>
			<!-- End Content -->
			<!-- Footer -->
		<tr>
			<td colspan="2" style="width: 100%;">
				<%@ include file="/footer.jsp" %>
			</td>
		</tr>
			<!-- End Footer -->
</table>
</body>
</html>