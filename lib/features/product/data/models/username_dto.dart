class UsernameDto {
  int? status;
  UsernameData? data;

  UsernameDto({this.status, this.data});

  UsernameDto.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? UsernameData.fromJson(json['data']) : null;
  }
}

class UsernameData {
  bool? isTaken;
  List<String>? suggested;

  UsernameData({this.isTaken, this.suggested});

  UsernameData.fromJson(Map<String, dynamic> json) {
    isTaken = json['is_taken'];
    if (json['suggested'] != null) {
      suggested = [];
      json['suggested'].forEach(
        (v) {
          suggested?.add(v);
        },
      );
    }
  }
}
