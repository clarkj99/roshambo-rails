import consumer from "./consumer"

consumer.subscriptions.create("RoomChannel", {
  connected() {
    // Called when the subscription is ready for use on the server
    console.log("Connected to the room");
  },

  disconnected() {
    // Called when the subscription has been terminated by the server
  },

  received(data) {
    // Called when there's incoming data on the websocket for this channel
    console.log("Receiving:")
    console.log(data.content)
    // $('#msg').append('<div class="message"> ' + data.content + '</div>')
    $("#empty-bf-msg").remove()
    $('#battle-msgs').append(data.content)
  }
});
