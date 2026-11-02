//
//  DocumentViewController.swift
//  practice_type
//
//  Created by 김미나 on 10/27/26.
//

import UIKit
import SnapKit

class ViewController: UIViewController {
    
    // 로그인 폼 (div)
    let loginForm:UIView = UIView()
    
    // 컴포넌트들..
    let login:UILabel = UILabel()
    let email:UILabel = UILabel()
    let password:UILabel = UILabel()
    let emailField:UITextField = UITextField()
    let passwordField:UITextField = UITextField()
    let findPassword:UITextField = UITextField()
    let noAccount:UILabel = UILabel()
    let loginButton = UIButton(type: .system)
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        
        // ================================요소 글자 및 디자인================================
        //로그인
        login.text = "로그인"
        login.font = .systemFont(ofSize: 30, weight: .semibold)
        
        //이메일
        email.text = "이메일"
        email.font = .systemFont(ofSize: 25, weight: .semibold)
        
        //비밀번호
        password.text = "비밀번호"
        password.font = .systemFont(ofSize: 25, weight: .semibold)
        
        
        // --------------------------이메일 필드--------------------------
        emailField.attributedPlaceholder = NSAttributedString(
            string: "이메일을 입력해주세요.",
            attributes: [
                .foregroundColor: UIColor.gray,
                .font: UIFont.systemFont(ofSize: 15)
            ]
        )


        // 기본 테두리 제거
        emailField.borderStyle = .none

        // 배경색
        emailField.backgroundColor = UIColor(
            red: 232.0 / 255.0,
            green: 232.0 / 255.0,
            blue: 232.0 / 255.0,
            alpha: 1.0
        )

        // 모서리 둥글기
        emailField.layer.cornerRadius = 10
        emailField.clipsToBounds = true
        
        // 글자가 너무 왼쪽으로 붙어서 조금 띄워줌
        emailField.leftView = UIView(
            frame: CGRect(x: 0, y: 0, width: 15, height: 0)
        )
        emailField.leftViewMode = .always
        
        
        
        
        // --------------------------비밀번호 필드--------------------------
        passwordField.attributedPlaceholder = NSAttributedString(
            string: "비밀번호를 입력해주세요.",
            attributes: [
                .foregroundColor: UIColor.gray, //placeholder 색 지정
                .font: UIFont.systemFont(ofSize: 15),
            ]
        )
        passwordField.borderStyle = .roundedRect
        passwordField.backgroundColor = UIColor(
            red: 232.0 / 255.0,
            green: 232.0 / 255.0,
            blue: 232.0 / 255.0,
            alpha: 1.0
        )
        
        passwordField.layer.cornerRadius = 10
        passwordField.clipsToBounds = true
        
        //테두리 제거
        passwordField.borderStyle = .none
        
        // 글자가 너무 왼쪽으로 붙어서 조금 띄워줌
        passwordField.leftView = UIView(
            frame: CGRect(x: 0, y: 0, width: 15, height: 0)
        )
        passwordField.leftViewMode = .always
        
        //------------------비밀번호 찾기 문구--------------------
        findPassword.attributedText = NSAttributedString(
            string: "비밀번호 찾기",
            attributes: [
                .underlineStyle: NSUnderlineStyle.single.rawValue,
                .foregroundColor: UIColor.gray,
                .font: UIFont.systemFont(ofSize: 15)
            ]
        )
        
        // ------------------회원가입 문구--------------------
        let noAccountText = NSMutableAttributedString(
            string: "아직 계정이 없으시다면? 회원가입",
            attributes: [
                .foregroundColor: UIColor.gray,
                .font: UIFont.systemFont(ofSize: 15)
            ]
        )

        noAccountText.addAttribute(
            .underlineStyle,
            value: NSUnderlineStyle.single.rawValue,
            range: (noAccountText.string as NSString).range(of: "회원가입")
        )

        noAccount.attributedText = noAccountText
        
        
        // -------------로그인 버튼----------------
        loginButton.setTitle("로그인하기", for: .normal)
        loginButton.titleLabel?.font = .systemFont(ofSize: 25, weight: .semibold)
        
        loginButton.setTitleColor(.white, for: .normal)
        loginButton.layer.cornerRadius = 10
        loginButton.clipsToBounds = true
        loginButton.backgroundColor = UIColor(
            red: 215.0 / 255.0,
            green: 243.0 / 255.0,
            blue: 112.0 / 255.0,
            alpha: 1.0
        )
        
        // ================================view에 띄우기================================
        view.addSubview(loginForm)
        
        view.addSubview(login)
        view.addSubview(findPassword)
        view.addSubview(noAccount)
        view.addSubview(loginButton)
        
        
        // ================================loginForm에 내용물 넣기================================
        loginForm.addSubview(email)
        loginForm.addSubview(emailField)
        loginForm.addSubview(password)
        loginForm.addSubview(passwordField)
        
        
        //================================레이아웃 구성================================
        
            
            login.snp.makeConstraints {
                $0.top.equalToSuperview().inset(181)
                $0.centerX.equalToSuperview()
            }
        
        NSLayoutConstraint.activate([
            // 로그인 폼
            loginForm.topAnchor.constraint(equalTo: view.topAnchor, constant: 328),
            loginForm.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginForm.widthAnchor.constraint(equalToConstant: 354),
            loginForm.heightAnchor.constraint(equalToConstant: 217),
            
            // 이메일
            email.topAnchor.constraint(equalTo: loginForm.topAnchor),
            email.leadingAnchor.constraint(equalTo: loginForm.leadingAnchor, constant: 0),
            
            // 이메일 입력창
            emailField.topAnchor.constraint(equalTo: email.bottomAnchor, constant: 19),
            emailField.leadingAnchor.constraint(equalTo: loginForm.leadingAnchor, constant: 0),
            emailField.trailingAnchor.constraint(equalTo: loginForm.trailingAnchor, constant: 0),
            emailField.heightAnchor.constraint(equalToConstant: 50),
            
            // 비밀번호
            password.topAnchor.constraint(equalTo: emailField.bottomAnchor, constant: 19),
            password.leadingAnchor.constraint(equalTo: loginForm.leadingAnchor, constant: 0),
            
            // 비밀번호 입력창
            passwordField.topAnchor.constraint(equalTo: password.bottomAnchor, constant: 19),
            passwordField.leadingAnchor.constraint(equalTo: loginForm.leadingAnchor, constant: 0),
            passwordField.trailingAnchor.constraint(equalTo: loginForm.trailingAnchor, constant: 0),
            passwordField.heightAnchor.constraint(equalToConstant: 50),
            
            
            // 비밀번호 찾기
            findPassword.topAnchor.constraint(equalTo: passwordField.bottomAnchor,constant: 10),
            findPassword.trailingAnchor.constraint(equalTo: loginForm.trailingAnchor,constant: 0),
            
            //계정없으면 회원가입
            noAccount.bottomAnchor.constraint(equalTo: loginButton.topAnchor, constant: -15),
            noAccount.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            // 로그인 버튼
            loginButton.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -50),
            loginButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loginButton.widthAnchor.constraint(equalToConstant: 354),
            loginButton.heightAnchor.constraint(equalToConstant: 63)
        ])
    }
}
