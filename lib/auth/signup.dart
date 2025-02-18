import 'package:flutter/material.dart';
import 'package:vidilang/auth/login.dart';
import 'package:vidilang/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Signup extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: AppColors.background,
      body: Column(
        children: [
          SizedBox(height: 36),
          Align(
            alignment: Alignment.topLeft,
            child: Padding(
              padding: EdgeInsets.only(left: 90),
              child: SizedBox(
                width: 250.67,
                height: 188,
                child: Logo(),
              ),
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            flex: 3,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                NicknameField(),
                SizedBox(height: 10),
                EmailField(),
                SizedBox(height: 5),
                PasswordField(),
              ],
            ),
          ),
          SizedBox(height: 10),
          Accountlogin(),
          SizedBox(height: 15),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 69),
              child: SignupButton(),
            ),
          ),
        ],
      ),
    );
  }
}

class NicknameField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, bottom: 4),
          child: Text(
            "닉네임",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xFF4F4F4F),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 48,
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xFFBEBEBE), width: 0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 15, top: 13, bottom: 15),
              border: InputBorder.none,
              hintText: "닉네임을 입력해주세요",
              hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color(0x4F4F4F).withOpacity(0.5),
              ),
            ),
          ),
        ),
        SizedBox(height: 16),
      ],
    );
  }
}

class EmailField extends StatefulWidget {
  @override
  _EmailFieldState createState() => _EmailFieldState();
}

class _EmailFieldState extends State<EmailField> {
  final TextEditingController _emailController = TextEditingController();
  bool _isValidEmail = false;
  bool _hasInputEmail = false;

  void _validateEmail(String email) {
    final emailRegex =
        RegExp(r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{3,}(?=\s*$)');

    setState(() {
      _hasInputEmail = email.isNotEmpty;
      _isValidEmail = emailRegex.hasMatch(email);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, bottom: 4),
          child: Text(
            "이메일",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xFF4F4F4F),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 48,
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xFFBEBEBE), width: 0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: _emailController,
            onChanged: _validateEmail,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 15, top: 13, bottom: 15),
              border: InputBorder.none,
              hintText: "이메일을 입력해주세요",
              hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color(0x4F4F4F).withOpacity(0.5),
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        Container(
            height: 20,
            padding: EdgeInsets.only(left: 30),
            child: AnimatedOpacity(
              duration: Duration(milliseconds: 300),
              opacity: _hasInputEmail ? 1.0 : 0.0,
              child: Text(
                _isValidEmail ? "올바른 이메일 형식입니다." : "잘못된 형식의 이메일입니다.",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                  color: _isValidEmail ? Colors.green : Color(0xFFEB5757),
                ),
              ),
            )),
      ],
    );
  }
}

class PasswordField extends StatefulWidget {
  @override
  _PasswordFieldState createState() => _PasswordFieldState();
}

class _PasswordFieldState extends State<PasswordField> {
  final TextEditingController _passwordController = TextEditingController();
  bool _hasMinLength = false;
  bool _hasInputPassword = false;
  bool _isPasswordVisible = false;

  void _validatePassword(String password) {
    setState(() {
      _hasInputPassword = password.isNotEmpty;
      _hasMinLength = password.length >= 8;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 20, bottom: 4),
          child: Text(
            "비밀번호",
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w700,
              color: Color(0xFF4F4F4F),
            ),
          ),
        ),
        Container(
          width: double.infinity,
          height: 48,
          margin: EdgeInsets.symmetric(horizontal: 20),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xFFBEBEBE), width: 0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            controller: _passwordController,
            obscureText: !_isPasswordVisible,
            onChanged: _validatePassword,
            decoration: InputDecoration(
              contentPadding: EdgeInsets.only(left: 15, top: 13, bottom: 15),
              border: InputBorder.none,
              hintText: "비밀번호를 입력해주세요",
              hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color(0x4F4F4F).withOpacity(0.5),
              ),
              suffixIcon: IconButton(
                icon: SvgPicture.asset(
                  'assets/icons/eye_icon.svg',
                  width: 20,
                  height: 20,
                ),
                onPressed: () {
                  setState(() {
                    _isPasswordVisible = !_isPasswordVisible;
                  });
                },
              ),
            ),
          ),
        ),
        SizedBox(height: 5),
        AnimatedOpacity(
          duration: Duration(milliseconds: 300),
          opacity: _hasInputPassword ? 1.0 : 0.0,
          child: Padding(
            padding: EdgeInsets.only(left: 30),
            child: Text(
              _hasMinLength ? "8자 이상 입력되었습니다." : "8자 이상 입력해주세요.",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: _hasMinLength ? Colors.green : Color(0xFFEB5757),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class SignupButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: 382,
      height: 48,
      decoration: BoxDecoration(
        color: Color(0xFFEB5757),
        borderRadius: BorderRadius.circular(10),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.168),
            offset: Offset(0, 2),
            blurRadius: 3,
          ),
          BoxShadow(
            color: Colors.black.withOpacity(0.084),
            offset: Offset(0, 0),
            blurRadius: 3,
          ),
        ],
      ),
      child: TextButton(
        onPressed: () {
          Navigator.pushReplacement(
            context,
            MaterialPageRoute(builder: (context) => Login()),
          );
        },
        style: TextButton.styleFrom(
          padding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Center(
          child: Text(
            "회원가입",
            style: TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w700,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

class Accountlogin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.center,
      child: Padding(
        padding: EdgeInsets.only(top: 200),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "이미 계정이 있으신가요? ",
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.w400,
                color: Color(0xFF4F4F4F),
              ),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Login()),
                );
              },
              child: Text(
                "로그인",
                style: TextStyle(
                  fontSize: 12,
                  fontWeight: FontWeight.w700,
                  color: Color(0xFF4F4F4F),
                  decoration: TextDecoration.underline,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
