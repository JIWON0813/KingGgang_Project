<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- 
	��	   �� : updateRoomForm.jsp
	��  ��   �� : �� �� ��
	��	   �� : �� ���� ���� ��
 -->
 <%@ include file="../top.jsp"%>
 <div align="center">
 <form action="updateRoom.hotel" method="post" enctype="multipart/form-data">
 <input type="hidden" name="h_id" value="${dto.h_id}"/>
 <table>
 <tr>
 <td cols="2">
 <img src="http://192.168.0.184:8080/img/${roomdto.filename}" width="200" height="200">
 </td>
 </tr>
 <tr>
 <td>�̸�</td>
 <td><input type="text" name="name" value="${dto.name}"></td>
 </tr>
 <tr>
 <td>�ο�</td>
 <td><input type="text" name="maxpersons" value="${dto.maxpersons}"></td>
 </tr>
 <tr>
 <td>���߰�</td>
 <td><input type="text" name="dayprice" value="${dto.dayprice}"></td>
 </tr>
 <tr>
 <td>�ָ���</td>
 <td><input type="text" name="endprice" value="${dto.endprice}"></td>
 </tr>
 <tr>
 <td>����</td>
 <td><textarea name="content" rows="10" cols="50">${dto.content}</textarea></td>
 </tr>
 <tr>
 <td>�̹���</td>
 <td><input type="file" name="file" cols="40"></td>
 </tr>
 <tr>
 <td><input type="submit" value="�����ϱ�">
 <td><input type="reset" value="�ʱ�ȭ�ϱ�">
 </tr>
 </table>
 </form>
 </div>
 <%@ include file="../bottom.jsp"%>