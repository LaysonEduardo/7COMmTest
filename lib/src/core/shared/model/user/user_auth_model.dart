class UserAuth {
  String username;
  String password;
  String code;
  String totpCode;

  bool get hasCode => code.isNotEmpty;
  bool get hasTOTPCode => totpCode.isNotEmpty;

  UserAuth({
    required this.username,
    required this.password,
    required this.code,
    required this.totpCode,
  });

  factory UserAuth.fromJson(Map<String, dynamic> json) => UserAuth(
        username: json['username'],
        password: json['password'],
        code: json['code'] ?? '',
        totpCode: json['totp_code'] ?? '',
      );

  factory UserAuth.empty() => UserAuth(
        username: '',
        password: '',
        code: '',
        totpCode: '',
      );

  Map<String, dynamic> toJson() => {
        "username": username,
        "password": password,
        "code": code,
        "totp_code": totpCode,
      };
}
