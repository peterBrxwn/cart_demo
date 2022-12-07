class GenerateTokenDto {
  int? status;
  TokenData? data;

  GenerateTokenDto({this.status, this.data});

  GenerateTokenDto.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? TokenData.fromJson(json['data']) : null;
  }

}

class TokenData {
  String? tokenType;
  int? expiresIn;
  String? accessToken;
  String? refreshToken;

  TokenData({this.tokenType, this.expiresIn, this.accessToken, this.refreshToken});

  TokenData.fromJson(Map<String, dynamic> json) {
    tokenType = json['token_type'];
    expiresIn = json['expires_in'];
    accessToken = json['access_token'];
    refreshToken = json['refresh_token'];
  }

}