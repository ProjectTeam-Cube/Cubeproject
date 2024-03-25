import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class AuthService extends ChangeNotifier {
  User? currentUser(){
    //현재유저(로그인 되지 않으면 null 반환)
    return FirebaseAuth.instance.currentUser;
  }

  //회원가입
void signUp({
  required String email,
  required String password,
  required Function() onSuccess,
  required Function(String err) onError,
}) async {
  //회원가입
  if (email.isEmpty) {
    onError('이메일을 입력해주세요');
  } else if (password.isEmpty) {
    onError('비밀번호를 입력해주세요');
    return;
  }
  // 사용자에게 입력받은 정보를 FireBase로 전달하여 회원가입 구현
  // firebase auth 회원 가입
  try{
      await FirebaseAuth.instance.createUserWithEmailAndPassword(
          email: email,
          password: password
      );
     // 성공함수 호출

    onSuccess();
  } on  FirebaseAuthException  catch (e) {
    // 에러메시지 한국어로 바꾸기
    if (e.code == 'weak-password') {
      onError('비밀번호를 6자리 이상 입력해 주세요.');
    } else if (e.code == 'email-already-in-use') {
      onError('이미 가입된 이메일 입니다.');
    } else if (e.code == 'invalid-email') {
      onError('이메일 형식을 확인해주세요.');
    } else if (e.code == 'user-not-found') {
      onError('일치하는 이메일이 없습니다.');
    } else if (e.code == 'wrong-password') {
      onError('비밀번호가 일치하지 않습니다.');
    } else {
      onError(e.message!);
    }

    // Firebase auth 에러발생
    // ! => null을 강제로 벗겨준다.
    onError(e.message!);
  } catch (e) {
    //Firebase auth의 이외의 에러 발생
    onError(e.toString());
  }
  }

void signIn({
  required String email,
  required String password,
  required Function() onSuccess,
  required Function(String err) onError,
}) async {
  //로그인
  if (email.isEmpty) {
    onError('이메일을 입력해주세요');
  } else if (password.isEmpty) {
    onError('비밀번호를 입력해주세요');
    return;
  }

  //로그인 시도
  try {
    await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: email,
        password: password,
    );

    onSuccess(); //성공함수 호출
    notifyListeners(); //로그인 상태 변경 알림
  } on FirebaseAuthException catch (e) {
    //firebase auth 에러 발생
    onError(e.message!);
  } catch (e) {
    //Firebase auth 이외의 에러 발생
    onError(e.toString());
  }
}

void signOut() async{
  //로그아웃
  await FirebaseAuth.instance.signOut();
  notifyListeners(); //로그인 상태 변경 알림
}
}