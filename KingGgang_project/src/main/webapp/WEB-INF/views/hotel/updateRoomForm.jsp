<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!-- 
	이	   름 : updateRoomForm.jsp
	개  발   자 : 김 지 원
	설	   명 : 방 정보 수정 폼
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
 <td>이름</td>
 <td><input type="text" name="name" value="${dto.name}"></td>
 </tr>
 <tr>
 <td>인원</td>
 <td><input type="text" name="maxpersons" value="${dto.maxpersons}"></td>
 </tr>
 <tr>
 <td>주중가</td>
 <td><input type="text" name="dayprice" value="${dto.dayprice}"></td>
 </tr>
 <tr>
 <td>주말가</td>
 <td><input type="text" name="endprice" value="${dto.endprice}"></td>
 </tr>
 <tr>
 <td>내용</td>
 <td><textarea name="content" rows="10" cols="50">${dto.content}</textarea></td>
 </tr>
 <tr>
 <td>이미지</td>
 <td><input type="file" name="file" cols="40"></td>
 </tr>
 <tr>
 <td><input type="submit" value="수정하기">
 <td><input type="reset" value="초기화하기">
 </tr>
 </table>
 </form>
 </div>
 <%@ include file="../bottom.jsp"%>