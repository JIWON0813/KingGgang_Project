package com.teamb.function;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.socket.config.annotation.EnableWebSocket;
import org.springframework.web.socket.config.annotation.WebSocketConfigurer;
import org.springframework.web.socket.config.annotation.WebSocketHandlerRegistry;


import com.teamb.function.EchoHandler;

/*
이	   름 : webSocketConfig
개  발   자 : 이여진
설	   명 : 웹소켓 구현체와 등록해주는 config파일
*/

@Configuration
@EnableWebSocket
public class webSocketConfig implements WebSocketConfigurer{

	@Autowired
	EchoHandler echoHandler;
	@Override
	public void registerWebSocketHandlers(WebSocketHandlerRegistry registry) {
		registry.addHandler(echoHandler, "/chating/{roomNumber}");
	}
}