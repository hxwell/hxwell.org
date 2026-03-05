package hx.well.handler;

import hx.well.websocket.AbstractWebSocketHandler;
import hx.well.websocket.WebSocketSession;
import haxe.io.Bytes;
import haxe.Exception;

class OnlineCountWebSocketHandler extends AbstractWebSocketHandler {
	public function new() {
		super();
	}

	public function onOpen(session:WebSocketSession):Void {
		broadcastCount();
	}

	public function onMessage(session:WebSocketSession, message:String):Void {
		// Not used
	}

	public function onBinary(session:WebSocketSession, data:Bytes):Void {
		// Not used
	}

	public function onClose(session:WebSocketSession, code:Int, reason:String):Void {
		broadcastCount();
	}

	public function onError(session:WebSocketSession, error:Exception):Void {
		// Errors usually lead to onClose being called.
	}

	private function broadcastCount():Void {
		var count:Int = 0;
		for (session in getSessions()) {
			count++;
		}
		this.broadcast(Std.string(count));
	}
}
