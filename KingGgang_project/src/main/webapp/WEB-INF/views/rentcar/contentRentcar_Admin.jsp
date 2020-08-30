<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<div align="center">
	<table border="1" width="50%">
		<caption>���� �� ����</caption>
		<tr>
			<th width="15%" class="m2">���� ��ȣ</th>
			<td width="35%" align="center">${rentcar.id}</td>
			<th width="15%" class="m2">���� �з�</th>
			<td width="35%" align="center">${rentcar.type}</td>
		</tr>
		<tr>
			<th width="15%" class="m2">��ǰ��</th>
			<td width="35%" align="center">${rentcar.name}</td>
			<th width="15%" class="m2">����ȸ��</th>
			<td width="35%" align="center">${rentcar.company}</td>
		</tr>
		<tr>
			<th width="15%" class="m2">����</th>
			<td width="40%" align="center" colspan="3">
				<img src="http://localhost:8080/img/${rentcar.filename}" style="width:450px; height:400px auto;">
			</td>
		</tr>
		<tr>
			<th width="15%" class="m2">��ü��</th>
			<td width="35%" align="center">${rentcar.rentcom}</td>
			<th width="15%" class="m2">��ü ��ȣ</th>
			<td width="35%" align="center">${rentcar.renttel}</td>
		</tr>
		<tr>
			<th width="30%">���� ���� ����</th>
			<td align="center" colspan="4">
				<c:if test="${rentcar.reservation == 0}">
					���� ����
				</c:if>
				<c:if test="${rentcar.reservation == 1}">
					������(~${returnday})
				</c:if>
			</td>
			
		</tr>
		<tr>
			<th width="15%" class="m2">���� �Ұ�</th>
			<td width="85%" colspan="3">
				<textarea name="contents" rows="5" cols="80" readOnly>${rentcar.contents}
				</textarea>
			</td>
		</tr>
		<tr>
			<td colspan="4" align="center" class="m1">
				<input type="button" value="���ư���" 
									onclick="window.location='listRentcar.admin'">
			</td>
		</tr>
	</table>
</div>