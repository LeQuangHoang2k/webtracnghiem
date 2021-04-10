package org.sr;

import com.corundumstudio.socketio.AckRequest;
import com.corundumstudio.socketio.Configuration;
import com.corundumstudio.socketio.SocketIOClient;
import com.corundumstudio.socketio.SocketIOServer;
import com.corundumstudio.socketio.listener.DataListener;

public class ChatServer {
	public static void main(String[] args) {
		Configuration config = new Configuration();
		config.setHostname("localhost");
		config.setPort(8080);
		final SocketIOServer server = new SocketIOServer(config);
		server.addEventListener("chat", Message.class, new DataListener<Message>() {
			@Override
			public void onData(SocketIOClient arg0, Message arg1, AckRequest arg2) throws Exception {
				System.out.println("ChatServer");
				server.getBroadcastOperations().sendEvent("chat", arg1);
			}

		});
		server.start();
	}
}
