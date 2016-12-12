import io from 'socket.io-client';

export default class Connection {

  constructor() {
    this.socket = io.connect("http://localhost:3000");

    this.socket.on("connect", (data) => {
      console.log("connected to server");
      //this.socket.emit("join", 123, 'abc-123');
    });

    this.socket.on('action', (data) => {
      // let response = JSON.parse(data);
      // console.log(response);
      // let answer = typeof(response.answer) == 'string' ? JSON.parse(response.answer) : response.answer;
      // this[response.action](answer);
    });

  }

}
