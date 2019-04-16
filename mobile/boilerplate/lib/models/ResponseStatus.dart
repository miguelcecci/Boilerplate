class ResponseStatus{
  final bool status;
  final String message;

  ResponseStatus({this.status, this.message});

  factory ResponseStatus.fromJson(Map<String, dynamic> json) {
    return ResponseStatus(
      status: json['status'],
      message: json['message'],
    );
  }

  Map toMap() {
    var map = new Map<String, dynamic>();
    map["status"] = status;
    map["message"] = message;
    return map;
  }
}