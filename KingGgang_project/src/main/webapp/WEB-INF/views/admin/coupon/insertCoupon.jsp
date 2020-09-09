<%@ include file="../admintop.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	var randomCoupon=Math.floor(Math.random() * (99999999 - 10000000 + 1)) + 10000000;

	function create(){
	document.getElementsByName("no")[0].value = randomCoupon;
	}
	function check(){
		if(ic.no.value==""){
			alert("번호를 생성해주세요")
			ic.no.focus()
			return
		}
		if(ic.name.value==""){
			alert("쿠폰이름을 입력해주세요")
			ic.name.focus()
			return
		}
		if(ic.dis.value==""){
			alert("할인율을 입력해주세요")
			ic.dis.focus()
			return
		}
		if(ic.m_id.value==""){
			alert("회원아이디를 입력해주세요")
			ic.m_id.focus()
			return
		}
		document.ic.submit()
	} 
</script>
<form name="ic" action="insertCouponPro.co" method="post"> 
	<div class="wrap wd668" align="center">
            <div class="container">
                <div class="form_txtInput">
                    <h2 class="sub_tit_txt">쿠폰등록</h2>
		<table>
			<tr>
				<td><input type="text" name="no">
				<input type="button" onclick="create()" value="번호생성"></td>
			</tr>
			<tr>
				<td>쿠폰이름<input type="text" name="name"></td>
			</tr>		
			<tr>
				<td>할인율(%)<input type="text" name="dis" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></td>
			</tr>
			<tr>
				<td>
					회원아이디
					<select name="m_id">
					<c:forEach items="${memberli }" var="memberli">
						<option>${memberli.id }</option>
					</c:forEach>
					</select>
				</td>
			</tr>				
			<tr>
				<td><a href="javascript:check()">쿠폰등록</a></td>
			</tr>
		</table>
	</div>
	</div>
	</div>
	</form>
<%@ include file="../adminbottom.jsp"%>