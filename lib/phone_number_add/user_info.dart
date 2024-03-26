class PhoneInfo {
  String name;
  String phone;
  String email;
  String imagePath; // 이미지 경로 필드 추가

  PhoneInfo({
    required this.name,
    required this.phone,
    required this.email,
    this.imagePath = '', // 기본값으로 빈 문자열 설정
  });

  Map<String, dynamic> toJson() => {
        'name': name,
        'phone': phone,
        'email': email,
        'imagePath': imagePath, // JSON 변환 시 imagePath도 포함
      };

  factory PhoneInfo.fromJson(Map<String, dynamic> json) {
    return PhoneInfo(
      name: json['name'],
      phone: json['phone'],
      email: json['email'],
      imagePath: json['imagePath'] ?? '', // imagePath가 없는 경우 기본값으로 빈 문자열 설정
    );
  }
}
