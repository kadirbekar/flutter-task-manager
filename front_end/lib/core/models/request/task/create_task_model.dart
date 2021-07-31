class CreateTaskRequestModel {
  
  final String? title;
  final String? content;
  final String? status;

  CreateTaskRequestModel({
    this.title,
    this.content,
    this.status,
  });

  Map toMap() {
    var map = new Map();
    map["title"] = title;
    map["content"] = content;
    map["status"] = status;
    return map;
  }
}
