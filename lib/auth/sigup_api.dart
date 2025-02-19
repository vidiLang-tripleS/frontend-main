import 'dart:convert';
import 'package:http/http.dart' as http;

class SignupApi {
  static const String baseUrl = "https://backend.com/api"; //주소변경해야됨

  static Future<Map<String, dynamic>> registerUser(
      String nickname, String email, String password) async {
    final url = Uri.parse("$baseUrl/signup");

    try {
      final response = await http.post(
        url,
        headers: {"Content-Type": "application/json"},
        body: jsonEncode({
          "nickname": nickname,
          "email": email,
          "password": password,
        }),
      );

      if (response.statusCode == 200) {
        return jsonDecode(response.body);
      } else {
        return {"error": "회원가입 실패: ${response.statusCode}"};
      }
    } catch (e) {
      return {"error": "서버와 연결할 수 없습니다. ($e)"};
    }
  }
}
