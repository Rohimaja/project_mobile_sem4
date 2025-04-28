class ChangePasswordFPResponse {
  final String status;
  final String message;

  ChangePasswordFPResponse({required this.status, required this.message});

  factory ChangePasswordFPResponse.fromJson(Map<String, dynamic> json) {
    return ChangePasswordFPResponse(
        status: json['status'], message: json['message']);
  }
}
