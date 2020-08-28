package com.teamb.model;

public class B4_bookmarkDTO {
private	B4_memberDTO memberNum; //foreign key
private	B4_boardDTO boardNum; //foreign key

public B4_memberDTO getMemberNum() {
	return memberNum;
}
public void setMemberNum(B4_memberDTO memberNum) {
	this.memberNum = memberNum;
}
public B4_boardDTO getBoardNum() {
	return boardNum;
}
public void setBoardNum(B4_boardDTO boardNum) {
	this.boardNum = boardNum;
}


}