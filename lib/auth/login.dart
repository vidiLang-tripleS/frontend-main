import 'package:flutter/material.dart';
import 'package:vidilang/auth/signup.dart';
import 'package:vidilang/theme.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: AppColors.background,
      body: Center(
        child: Container(
          width: 430,
          height: 932,
          padding: EdgeInsets.symmetric(horizontal: 27),
          child: Column(
            children: [
              SizedBox(height: 36),
              Align(
                alignment: Alignment.center,
                child: SizedBox(
                  width: 250.67,
                  height: 188,
                  child: Logo(),
                ),
              ),
              SizedBox(height: 20),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    EmailField(),
                    SizedBox(height: 10),
                    PasswordField(),
                    SizedBox(height: 5),
                    ForgotPasswordText(),
                  ],
                ),
              ),
              SizedBox(height: 15),
              Align(
                alignment: Alignment.center,
                child: AccountSignUpText(),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    LoginButton(),
                    SizedBox(height: 15),
                    LoginDivider(),
                    SizedBox(height: 15),
                    SocialLoginButtons(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EmailField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "이메일",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: Color(0xFF4F4F4F),
          ),
        ),
        SizedBox(height: 5),
        Container(
          width: double.infinity,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xFFBEBEBE), width: 0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 17, horizontal: 18),
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
      ],
    );
  }
}

class PasswordField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "비밀번호",
          style: TextStyle(
            fontWeight: FontWeight.w700,
            fontSize: 14,
            color: Color(0xFF4F4F4F),
          ),
        ),
        SizedBox(height: 5),
        Container(
          width: double.infinity,
          height: 48,
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(color: Color(0xFFBEBEBE), width: 0.5),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              contentPadding:
                  EdgeInsets.symmetric(vertical: 17, horizontal: 18),
              border: InputBorder.none,
              hintText: "8자리 이상으로 입력해주세요",
              hintStyle: TextStyle(
                fontWeight: FontWeight.w400,
                fontSize: 14,
                color: Color(0x4F4F4F).withOpacity(0.5),
              ),
            ),
          ),
        ),
      ],
    );
  }
}

class LoginButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: BoxDecoration(
        color: Color(0xFFEB5757),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextButton(
        onPressed: () {},
        child: Text(
          "로그인",
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.w700,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}

class AccountSignUpText extends StatelessWidget {
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
              "계정이 없으신가요? ",
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
                  MaterialPageRoute(builder: (context) => Signup()),
                );
              },
              child: Text(
                "회원가입",
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

class SocialLoginButtons extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/google_icon.svg',
            width: 45,
            height: 45,
          ),
        ),
        SizedBox(width: 20),
        IconButton(
          onPressed: () {},
          icon: SvgPicture.asset(
            'assets/icons/kakao_icon.svg',
            width: 45,
            height: 45,
          ),
        ),
      ],
    );
  }
}

class LoginDivider extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Divider(thickness: 1, color: Color(0xFFBEBEBE)),
        ),
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 10),
          child: Text(
            "또는",
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14,
              color: Color(0xFF4F4F4F),
            ),
          ),
        ),
        Expanded(
          child: Divider(thickness: 1, color: Color(0xFFBEBEBE)),
        ),
      ],
    );
  }
}

class ForgotPasswordText extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 5),
      child: Row(
        children: [
          Text(
            "비밀번호를 잊으셨나요? ",
            style: TextStyle(
              fontSize: 12,
              fontWeight: FontWeight.w400,
              color: Color(0xFF4F4F4F),
            ),
          ),
          GestureDetector(
            onTap: () {
              // 비밀번호 찾기 페이지로 이동하는 로직 추가
            },
            child: Text(
              "비밀번호 재설정",
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
    );
  }
}
