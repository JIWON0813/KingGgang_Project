<%@ include file="../admintop.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<div align="center">
<form name="f" method="post" action="regCouponPro.co">
<table>
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
				<td><input type="submit" value="쿠폰등록"></td>
				<td><input type="button" value="취소" onclick="couponList.co">취소</a>
			</tr>
			<input type="hidden" name="no" value="${param.no }">
</table>
</form>
</div>
<%@ include file="../adminbottom.jsp" %>