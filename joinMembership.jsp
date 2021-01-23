<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<%@ include file="/common/bootstrap_common.jsp"%>
<title>오늘 뭐 먹지?</title>
<script src="https://t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript">
function check(){
	 var getCheck= RegExp(/^[a-zA-Z0-9]{4,12}$/);
	//이름 공백 확인
	 if($("#m_name").val() == ""){
	      alert("이름 입력바람");
	      $("#m_name").focus();
	      return false;
	    }
	//아이디 공백 확인
	if($("#m_id").val() == ""){
      alert("아이디 입력바람");
      $("#m_id").focus();
      return false;
    }
  //아이디 유효성검사
  	if(!getCheck.test($("#m_id").val())){
	  alert("형식에 맞게 입력해주세요");
	  $("#m_id").val("");
	  $("#m_id").focus();
	  return false; 
	  }

    //아이디랑 비밀번호랑 같은지
    if ($("#m_id").val()==($("#m_pw").val())) {
    alert("비밀번호가 ID와 똑같습니다. 다시 작성해주세요!");
    $("#m_id").val("");
    $("#m_pw").focus();
    return false;
  }

    //비밀번호 똑같은지
    if($("#m_pw").val() != ($("#m_pwcheck").val())){ 
    alert("비밀번호가 다릅니다.");
    $("#m_pw").val("");
    $("#m_pwcheck").val("");
    $("#m_pw").focus();
    return false;
   }
    
    //비밀번호
    if(!getCheck.test($("#m_pw").val())) {
    alert("형식에 맞춰서 PW를 입력해주세요");
    $("#m_pw").val("");
    $("#m_pw").focus();
    return false;
    }
    
  //비밀번호 공백 확인
    if($("#m_pw").val() == ""){
      alert("비밀번호를 입력해주세요");
      $("#m_pw").focus();
      return false;
    }
	
  //이메일 공백 확인
    if($("#m_mail").val() == ""){
      alert("이메일을 입력해주세요");
      $("#m_mail").focus();
      return false;
    }
  //주소 공백 확인
    if($("#m_zip").val() == ""){
      alert("주소를 입력해주세요");
      $("#m_zip").focus();
      return false;
    }
  
    //전화번호 공백 확인
    if($("#m_hp").val() == ""){
      alert("전화번호를 입력해주세요");
      $("#m_hp").focus();
      return false;
    }
  	//생년월일 공백 확인
    if($("#m_birth").val() == ""){
      alert("생년월일을 입력해주세요");
      $("#m_birth").focus();
      return false;
    }
	//닉네임 공백 확인
    if($("#m_nick").val() == ""){
      alert("닉네임을 입력해주세요");
      $("#m_nick").focus();
      return false;
    }
  	alert("회원가입 완료");
  	loginForm.submit();
	}

	
 	function idCheckRegi() {
 		var m_id = $('#m_id').val();
 		var url = "/member/idCheckRegi.np?m_id="+m_id;
 		var name = "아이디 중복 체크";
        var option = "width = 300, height = 100, top = 400, left = 800, location = no"
  		window.open(url, name, option);
	}
 	
 	function nickCheckRegi() {
 		var m_nick = $('#m_nick').val();
 		var url = "/member/nickCheckRegi.np?m_nick="+m_nick;
 		var name = "닉네임 중복 체크";
        var option = "width = 300, height = 100, top = 400, left = 800, location = no"
  		window.open(url, name, option);
	}
 	/* =========================================== 다음 우편주소 검색 =========================================================== */
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
				if(document.getElementById("m_addr").value != null){
					document.getElementById("m_addr").value = ''
				} 
				document.getElementById("m_addr").value = roadAddr;
                $.ajax({
            		url:location.href
					,success:function(data){
// 						alert("m_addr:"+roadAddr);
						$("m_addr").text(roadAddr);
                   }
            	});
	                
            }
        }).open();
    }
 	
 	/* =========================================== 다음 우편주소 검색 =========================================================== */
 	
 	
 	
 	/* =========================================== 도로명 주소 검색 =========================================================== */
// 	function zipSearch(){
// 		// 주소검색을 수행할 팝업 페이지를 호출합니다.
// 		// 호출된 페이지(jusopopup.jsp)에서 실제 주소검색URL(http://www.juso.go.kr/addrlink/addrLinkUrl.do)를 호출하게 됩니다.
// 		var pop = window.open("/zipcode/jusoPopup.jsp","pop","width=570, height=420, top=300, left=500, scrollbars=yes, resizable=yes");
// 	}
// 	function jusoCallBack(roadFullAddr,addrDetail){
// 		// 팝업페이지에서 주소입력한 정보를 받아서, 현 페이지에 정보를 등록합니다.
// 		document.form.m_addr.value = roadFullAddr;
// 		document.form.m_detail.value = addrDetail;
// 	}
 	/* =========================================== 도로명 주소 검색 =========================================================== */
	
</script>
</head>
<body>
<table align="center" style="width: 70% ; height: 100%;">
	<tr>
		<td>
			<%@ include file="/loginHeader.jsp"%>
		</td>
	</tr>
	<tr>
		<td>
			<%@ include file="/member/jmContent.jsp" %>
		</td>	
	</tr>
	<tr>
		<td>
			<%@ include file="/footer.jsp" %>
		</td>
	</tr>	
</table>
</body>
</html>