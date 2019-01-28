//
//  LoginViewController.swift
//  aileyun
//
//  Created by huchuang on 2017/6/19.
//  Copyright © 2017年 huchuang. All rights reserved.
//

import UIKit
import SVProgressHUD

class LoginViewController: UIViewController {
    
    @IBOutlet weak var accountOutlet: UILabel!
    @IBOutlet weak var passOutlet: UILabel!
    @IBOutlet weak var accountInputOutlet: UITextField!
    @IBOutlet weak var passInputOutlet: UITextField!
    
    @IBOutlet weak var loginOutlet: UIButton!
    @IBOutlet weak var getAuthorOutlet: UIButton!
    @IBOutlet weak var phoneLoginOutlet: UIButton!
    @IBOutlet weak var idCardLoginOutlet: UIButton!
    @IBOutlet weak var forgetPassOutlet: UIButton!
    
    @IBOutlet weak var contentBgView: UIView!

    @IBOutlet weak var authorWidthCns: NSLayoutConstraint!
    @IBOutlet weak var authorHMarginCns: NSLayoutConstraint!
    
    @IBAction func tapAction(_ sender: UITapGestureRecognizer) {
        view.endEditing(true)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        #if DEBUG
        accountInputOutlet.text = "18627844751"
        passInputOutlet.text  = "8888"
        #endif
    }
    
    @IBAction func actions(_ sender: UIButton) {
        forgetPassOutlet.isHidden = sender == phoneLoginOutlet
        
        if sender == phoneLoginOutlet {
            phoneLoginOutlet.backgroundColor = MAIN_COLOR
            phoneLoginOutlet.setTitleColor(.white, for: .normal)
            idCardLoginOutlet.backgroundColor = RGB(231, 232, 233)
            idCardLoginOutlet.setTitleColor(RGB(36, 36, 36), for: .normal)
            
            accountOutlet.text = "手机号"
            passOutlet.text    = "验证码"
            accountInputOutlet.placeholder = "输入11位手机号码"
            passInputOutlet.placeholder    = "输入验证码"
            
            authorWidthCns.constant = 80
            authorHMarginCns.constant = 10
        }else if sender == idCardLoginOutlet {
            idCardLoginOutlet.backgroundColor = MAIN_COLOR
            idCardLoginOutlet.setTitleColor(.white, for: .normal)
            phoneLoginOutlet.backgroundColor = RGB(231, 232, 233)
            phoneLoginOutlet.setTitleColor(RGB(36, 36, 36), for: .normal)
            
            accountOutlet.text = "身份证号"
            passOutlet.text    = "密码"
            accountInputOutlet.placeholder = "输入身份证号码"
            passInputOutlet.placeholder    = "输入密码"
            
            authorWidthCns.constant = 0
            authorHMarginCns.constant = 0
        }else if sender == loginOutlet {
            login()
        }
    }
    
    private func login() {
        guard accountInputOutlet.text != "" && accountInputOutlet.text != nil else {
            HCShowError(info: "请输入手机号码！")
            return
        }
        guard passInputOutlet.text != "" && passInputOutlet.text != nil else {
            HCShowError(info: "请输入密码！")
            return
        }
        
        SVProgressHUD.show()
        UserManager.shareIntance.HC_login(uname: accountInputOutlet.text!, pwd: passInputOutlet.text!) { [weak self](success, msg) in
            if success == true{
                UserDefaults.standard.set(self?.accountInputOutlet.text!, forKey: kUserPhone)
                UIApplication.shared.keyWindow?.rootViewController = MainTabBarController()

//                HttpRequestManager.shareIntance.HC_userInfo(callback: { (success, msg) in
//                    if success == true {
//                        SVProgressHUD.dismiss()
//                        UIApplication.shared.keyWindow?.rootViewController = MainTabBarController()
//                    }else{
//                        HCShowError(info: msg)
//                    }
//                })
            }else{
                HCShowError(info: msg)
            }
        }
        
        
    }
}
