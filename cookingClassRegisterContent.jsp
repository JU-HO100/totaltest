<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% String id = (String)session.getAttribute("id"); %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/common/bootstrap_common.jsp"%>
<title>오늘 뭐 먹지?</title>
<script type="text/javascript" src="<%=path.toString() %>js/cookclass.js"></script>
<script type="text/javascript">
function daumzip() {
    new daum.Postcode({
        oncomplete: function(data) {
            // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var roadAddr = data.roadAddress; // 도로명 주소 변수
            var extraRoadAddr = ''; // 참고 항목 변수

            // 법정동명이 있을 경우 추가한다. (법정리는 제외)
            // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
            if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                extraRoadAddr += data.bname;
            }
            // 건물명이 있고, 공동주택일 경우 추가한다.
            if(data.buildingName !== '' && data.apartment === 'Y'){
               extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
            }

            
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
			if(document.getElementById("c_zip").value != null){
				document.getElementById("c_zip").value = ''
			}
				document.getElementById("c_zip").value = roadAddr;
            $.ajax({
        		url:location.href
				,success:function(data){
//						alert("c_zip:"+roadAddr);
					$("c_zip").text(roadAddr);
               }
        	});
                
        }
    }).open();
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
					 <button type="button" class="btn btn-outline-dark" style="text-align: left;" onclick="reload()">쿠킹 클래스 신청</button>
					 <button type="button" class="btn btn-outline-dark" style="text-align: left;" onclick="location.href='/member/checkChef.np?m_id=<%=id%>'">쿠킹 클래스 등록</button>
				</div>
			</td>
			<td style="width: 70%; padding-top:3% ;padding-left: 5%; padding-right: 5%;">
<table style="width: 100%">
	<tr>
		<td style="width: 80%; border: none;">
				<!-- Nav tabs -->
				<ul class="nav nav-tabs">
					<li class="nav-item"><a class="nav-link active"
						data-toggle="tab" href="#home">등록</a></li>
				</ul>
				<div class="tab-content">
					<div id="home" class="container tab-pane active"  >
					<form name="cookclassRegister" action="/cookclass/createClass.np" method="get">
					<input type="hidden" id="m_id" name="m_id" value="<%=session.getAttribute("id")%>">
						<br>
						<div class="form-group">
							<label>제목:</label>
							 <input type="text"  value="어어엄청나게 맛있는 볶음밥" class="form-control" placeholder="어떤 요리인지 알 수 있도록 입력해 주세요. ex)누구나 쉽게 배울 수 있는 김치찜"  id="c_cook" name="c_cook">
						</div>
						<div class="form-group">
							<label>준비물:</label> 
							<input type="text" class="form-control"  value="밥,기름,파,베이컨,계란,다진마늘,후추,소금,설탕" placeholder="요리에 필요한 준비물을 입력해주세요."  id="c_ingredients" name="c_ingredients">
						</div>
						<div class="form-group">
							<label>실습주소:</label>
							 <input type="text" class="form-control" value="인천광역시 부평구 선청동 240-1" placeholder="실습주소를 입력해주세요." id="c_zip" name="c_zip">
						</div>
						<div class="form-group">
							<label>상세주소:</label>
							 <input type="text" class="form-control" value="oo아파트 00동 000호" placeholder="상세주소를 입력해주세요." id="c_zipdetail" name="c_zipdetail">
						</div>
						<div class="form-group">
							<label>날짜,시간:</label>
							 <input type="datetime-local" class="form-control"  value="2021-01-22 오후 03:17" placeholder="실습날짜를 입력해주세요." id="c_date" name="c_date">
						</div>
						<div class="form-group">
							<label>수강 최대 인원:</label>
							 <input type="text" class="form-control"  value="4" placeholder="수강 최대 인원을 입력해주세요." id="c_member" name="c_member">
						</div>
						<input class="btn btn-outline-dark" type="button" value="쿠킹클래스 등록" onclick="check()">
					</form>
					</div>
				</div>
		</td>	
	</tr>
</table>
<tr>
			<td colspan="2" style="width: 100%;">
				<%@ include file="/footer.jsp" %>
			</td>
		</tr>
			<!-- End Footer -->
</table>
</body>
</html>
