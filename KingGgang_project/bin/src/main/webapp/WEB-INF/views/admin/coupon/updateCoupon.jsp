<%@ include file="/WEB-INF/views/top.jsp"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<script type="text/javascript">
	function check(){
		if(uc.name.value==""){
			alert("쿠폰이름을 입력해주세요")
			uc.name.focus()
			return
		}
		if(uc.dis.value==""){
			alert("할인율을 입력해주세요")
			uc.dis.focus()
			return
		}
		if(uc.m_id.value==""){
			alert("회원아이디를 입력해주세요")
			uc.m_id.focus()
			return
		}
		document.uc.submit()
	} 
</script>
<form name="uc" action="updateCouponPro.co" method="post"> 
	<div class="wrap wd668" align="center">
            <div class="container">
                <div class="form_txtInput">
                    <h2 class="sub_tit_txt">쿠폰수정</h2>
		<table>
			<tr>
				<td>쿠폰번호<input type="text" name="no" value="${getCoupon.no }" readOnly>
				</td>
			</tr>
			<tr>
				<td>쿠폰이름<input type="text" name="name" value="${getCoupon.name }"></td>
			</tr>		
			<tr>
				<td>할인율(%)<input type="text" name="dis" value="${getCoupon.dis }" onKeyup="this.value=this.value.replace(/[^0-9]/g,'');"></td>
			</tr>
			<tr>
				<td>회원아이디
					<select name="m_id">
							<option selected>${getCoupon.m_id }</option>
						<c:forEach items="${memberli }" var="memberli">
							<option>${memberli.id }</option>
						</c:forEach>
					</select>
				</td>
			</tr>				
			<tr>
				<td><a href="javascript:check()">쿠폰수정</a></td>
			</tr>
		</table>
	</div>
	</div>
	</div>
	</form>
<%@ include file="/WEB-INF/views/bottom.jsp"%>