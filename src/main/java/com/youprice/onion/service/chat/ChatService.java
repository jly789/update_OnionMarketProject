package com.youprice.onion.service.chat;

import com.youprice.onion.dto.chat.ChatDTO;
import com.youprice.onion.dto.chat.ChatImageDTO;

import java.io.IOException;

public interface ChatService {

	ChatDTO writeChat(ChatDTO chatDTO);
	ChatDTO uploadImage(ChatImageDTO chatImageDto) throws IOException;
	void readChat(Long memberId, Long chatroomId);
}
