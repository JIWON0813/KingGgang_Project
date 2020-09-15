package com.teamb.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.scheduling.annotation.Scheduled;
import org.springframework.stereotype.Service;

import com.teamb.model.HotelDTO;
import com.teamb.model.RoomDTO;
import com.teamb.model.RoomDateDTO;


@Service
public class HotelMapper {

	@Autowired
	private SqlSession sqlSession;

	public List<HotelDTO> list() {
		return sqlSession.selectList("hotelList");
	}

	public HotelDTO getHotel(int no) {
		return sqlSession.selectOne("getHotel", no);
	}
	
	public void increasecount(int no){
		sqlSession.update("increaseRead", no);
	}

	public int insertHotel(HotelDTO dto) {
		int res = sqlSession.insert("insertHotel", dto);
		return res;
	}

	public int deleteHotel(int no) {
		int res = sqlSession.delete("deleteHotel", no);
		return res;
	}

	public int updateHotel(HotelDTO dto) {
		int res = sqlSession.update("updateHotel", dto);
		return res;
	}

	public int getCount() {
		return sqlSession.selectOne("getCount");
	}

	public List<HotelDTO> hotelMainlist(int startRow, int endRow) {
		Map<String, Integer> map = new HashMap<String, Integer>();
		map.put("start", startRow);
		map.put("end", endRow);
		List<HotelDTO> list = sqlSession.selectList("hotelMain", map);
		return list;
	}
	public List<HotelDTO> hotelCateList(int startRow, int endRow, String cate) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", startRow);
		map.put("end", endRow);
		map.put("category", cate);
		List<HotelDTO> list = sqlSession.selectList("hotelCateList", map);
		return list;
	}
	

	
	public List<RoomDTO> roomList(int h_id){
		return sqlSession.selectList("hotelroomList", h_id);
	}
	
	public RoomDTO getRoom(int id){
		return sqlSession.selectOne("getHotelRoom", id);
	}
	
	public int insertRoom(RoomDTO dto) {
		return sqlSession.insert("insertRoom", dto);
	}
	
	public int updateRoom(RoomDTO dto){
		return sqlSession.update("updateRoom", dto);
	}
	
	public int deleteRoom(int id){
		return sqlSession.delete("deleteRoom", id);
	}

	public List<HotelDTO> hotelSearchList(int startRow, int endRow, String search) {
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("start", startRow);
		map.put("end", endRow);
		map.put("search", "%"+search+"%");
		return sqlSession.selectList("searchHotelList", map);
	}

	public int getCountSearch(String search) {
		search = "%"+search+"%";
		return sqlSession.selectOne("getCountSearch", search);
	}

	public int getCountCate(String category) {
		return sqlSession.selectOne("getCountCate", category);
	}

	public boolean checkRoomdate(String startdate, String enddate, int id) {
		Map<String, Object> map = new HashMap<String, Object>();
		startdate = startdate.replaceAll("-", "");
		enddate = enddate.replaceAll("-", "");
		map.put("start", startdate);
		map.put("end", enddate);
		map.put("r_id", id);
		System.out.println("데이터 : " + startdate);
		System.out.println("데이터 : " + enddate);
		int res = 0;
		if(sqlSession.selectOne("checkroomdate", map) != null){
			res = sqlSession.selectOne("checkroomdate", map);
		}
		if(res > 0)
			return false;		
		else
			return true;
	}
	public synchronized int insertRoomDate(RoomDateDTO dto) {
		boolean check = checkRoomdate(dto.getStartdate(), dto.getEnddate(), dto.getRoom_id());
		int res = 0;
		if(check){
			res = sqlSession.insert("insertroomdate", dto);
		}
		return res;
	}
	
	@Scheduled(fixedDelay=240000)
	public void checkPay(){
		System.out.println("유효성체크1");
		List<RoomDateDTO> list = sqlSession.selectList("roomdatelist");
		for(RoomDateDTO dto : list){
			if(dto.getValid() == 0){
				System.out.println("유효성체크2");
				sqlSession.delete("deleteunpaidroomdate", dto.getId());
			}
		}
	}

	public void changevaild(int id) {
		sqlSession.update("changvaildroomdate", id);		
	}

	public int getrecentdate() {
		return sqlSession.selectOne("getrecentdate");
	}
	
	//관심리스트 원세호 



}
