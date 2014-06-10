package org.blogdemo.processor;

import org.blogdemo.model.Conversation;

public class ConversationProcessor {

	public Conversation processConversation(Conversation conversation){
		System.out.println("Input:["+conversation.getConinput()+"] Response:["+conversation.getConresponse()+"]");
		return conversation;
	}

	
}
