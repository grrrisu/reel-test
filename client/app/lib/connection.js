export default class Connection {

  constructor() {
    this.socket = new WebSocket('ws://localhost:3000', ['soap', 'xmpp']);
    this.socket.onopen = function() { 'Ping' }
    this.socket.onerror = function(error) { console.log(error) }
    this.socket.onmessage = function(message) { console.log(message.data) }
  }

}
