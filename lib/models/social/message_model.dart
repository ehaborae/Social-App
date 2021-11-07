class MessageModel {
  String? text;
  String? senderId;
  String? receiverId;
  String? dateTime;


  MessageModel({
    this.text,
    this.receiverId,
    this.senderId,
    this.dateTime,
  });

  MessageModel.fromMap(Map<String, dynamic> json) {
    text = json['text'];
    senderId = json['senderId'];
    receiverId = json['receiverId'];
    dateTime = json['dateTime'];
  }

  Map<String, dynamic> toMap() =>
      {
        'text': text,
        'senderId': senderId,
        'receiverId': receiverId,
        'dateTime': dateTime,
      };
}
