<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>

<form method="post"  name="loginForm" action="/member/memRegi.np" >
<table align="center"  style="width: 70%">
	<tr style="height:80px; ">
		<td style="width: 50%; text-align: center; ">
			<p style="font-family: Black Han Sans, sans-serif; color: black; padding-top: 16px;">이름</p>
		</td>
		<td style="widows: 50%">
			<input value="안준헌" type="text" name="m_name" id="m_name" style="float: left;" required="required">
		</td>
	</tr>
	<tr style="height:80px; ">
		<td style="width: 50%; text-align: center; ">
			<p style="font-family: Black Han Sans, sans-serif; color: black; padding-top: 16px;">성별</p>
		</td>
		<td>
			<label><input type="radio" name="m_gender" value="0" checked="checked"> 남자</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
     		<label><input type="radio" name="m_gender" value="1"> 여자</label>
		</td>
	</tr>
	<tr style="height:80px; ">
		<td style="width: 50%; text-align: center; ">
			<p style="font-family: Black Han Sans, sans-serif; color: black; padding-top: 16px;">아이디 <br/>  (4~12자의 영문 대소문자와 숫자로만 입력) </p>
		</td>
		<td>
			<input value="test123" type="text" name="m_id" id="m_id" style="float: left;" required="required">
		</td>
		<td>
			<input class="btn btn-outline-dark" type="button" value="중복 확인" onclick="idCheckRegi()">
		</td>
	</tr>
	<tr style="height:80px; ">
		<td style="width: 50%; text-align: center; ">
			<p style="font-family: Black Han Sans, sans-serif; color: black; padding-top: 16px;">비밀번호 <br/> (4~12자리의 영문 대소문자와 숫자로만 입력)</p>
		</td>
		<td>
			<input value="1234" type="password" name="m_pw" id="m_pw" style="float: left;" required="required">
		</td>
	</tr>
	<tr style="height:80px; ">
		<td style="width: 50%; text-align: center; ">
			<p style="font-family: Black Han Sans, sans-serif; color: black; padding-top: 16px;">비밀번호 확인</p>
		</td>
		<td>
			<input value="1234" type="password" name="m_pwcheck" id="m_pwcheck" style="float: left;" >
		</td>
	</tr>
	<tr style="height:80px; ">
		<td style="width: 50%; text-align: center; ">
			<p style="font-family: Black Han Sans, sans-serif; color: black; padding-top: 16px;">이메일</p>
		</td>
		<td>
			<input value="test5678@gmail.com" type="email" name="m_mail" id="m_mail" style="float: left;" required="required">
		</td>
	</tr>
	<tr style="height:80px; ">
		<td style="width: 50%; text-align: center; ">
			<p style="font-family: Black Han Sans, sans-serif; color: black; padding-top: 16px;">주소</p>
		</td>
		<td style="width: 50%; text-align: center; ">
			<input value="" type="text" name="m_addr" id="m_addr" style="float: left; width:70%;" required="required">
		</td>
		<td>
			<input class="btn btn-outline-dark" type="button" value="주소검색" onClick="daumzip()">
		</td>
	</tr>
	<tr style="height:80px; ">
		<td style="width: 50%; text-align: center; ">
			<p style="font-family: Black Han Sans, sans-serif; color: black; padding-top: 16px;">상세주소</p>
		</td>
		<td style="width: 50%; text-align: center; ">	
			<input value="" type="text" name="m_detail" id="m_detail" style="float: left; width:70%;" required="required">
		</td>
	</tr>
	<tr style="height:80px; ">
		<td style="width: 50%; text-align: center; ">
			<p style="font-family: Black Han Sans, sans-serif; color: black; padding-top: 16px;">닉네임</p>
		</td>
		<td>
			<input value="널포인터" type="text" name="m_nick" id="m_nick" style="float: left;" required="required">
		</td>
		<td>
			<input class="btn btn-outline-dark" type="button" value="중복 확인" onclick="nickCheckRegi()">
		</td>
	</tr>
	<tr style="height:80px; ">
		<td style="width: 50%; text-align: center; ">
			<p style="font-family: Black Han Sans, sans-serif; color: black; padding-top: 16px;" >전화번호 <br/> (- 없이 입력 바랍니다.)</p>
		</td>
		<td>
			<input value="01012345678" type="tel" name="m_hp" id="m_hp" style="float: left;" required="required">
		</td>
	</tr>
	<tr style="height:80px; ">
		<td style="width: 50%; text-align: center; ">
			<p style="font-family: Black Han Sans, sans-serif; color: black; padding-top: 16px;">생년월일</p>
		</td>
		<td>
			<input value="1994-07-16" type="date" name="m_birth" id="m_birth" style="float: left;" required="required">
		</td>
	</tr>
	<tr style="height:120px; ">
		<td colspan="2" style="text-align: center;">
			<input class="btn btn-outline-dark" type="button" value="회원가입" onclick="check()">
			<input class="btn btn-outline-dark" type="reset" value="다시작성">
		</td>
	</tr>
</table>
</form>