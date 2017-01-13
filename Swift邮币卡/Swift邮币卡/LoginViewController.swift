//
//  LoginViewController.swift
//  Swift邮币卡
//
//  Created by 李涛涛 on 2017/1/9.
//  Copyright © 2017年 点石科技. All rights reserved.
//

import UIKit
import Alamofire
import HandyJSON

class LoginViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = BGColor;
        craetTextFiled();
    }

    var logoImage:UIImageView!;
    var remindUser:UIButton!;
    var tradeCode:UITextField!;
    var userName:UITextField!;
    var password:UITextField!;

    func craetTextFiled(){

        logoImage = UIImageView(image:UIImage(named: "logo-h"));
        self.view.addSubview(logoImage);
        logoImage.snp.makeConstraints { (make) in
            make.top.equalTo(self.view.snp.top).offset(20);
            make.height.equalTo(100);
            make.width.equalTo(100);
            make.leading.equalTo(self.view.snp.leading).offset(width);
        }
        logoImage.layer.cornerRadius = 50;
        logoImage.layer.masksToBounds = true;

        tradeCode = UITextField.textFieldLeftViewImageAndPlaceholder("Trade", "交易所代码");
        self.view.addSubview(tradeCode);
        tradeCode.snp.makeConstraints { (make) in
            make.top.equalTo(logoImage.snp.bottom).offset(10);
            make.leading.equalTo(20);
            make.trailing.equalTo(self.view.snp.trailing).offset(-20);
            make.height.equalTo(textFiledHeight);
        }

        userName = UITextField.textFieldLeftViewImageAndPlaceholder("User", "资金账户");
        self.view.addSubview(userName);
        userName.snp.makeConstraints { (make) in
            make.top.equalTo(tradeCode.snp.bottom).offset(10);
            make.leading.equalTo(20);
            make.trailing.equalTo(tradeCode.snp.trailing);
            make.height.equalTo(textFiledHeight);
        }

        password = UITextField.textFieldLeftViewImageAndPlaceholder("Password", "用户密码");
        self.view.addSubview(password);
        password.snp.makeConstraints { (make) in
            make.top.equalTo(userName.snp.bottom).offset(10);
            make.leading.equalTo(userName.snp.leading);
            make.trailing.equalTo(userName.snp.trailing);
            make.height.equalTo(textFiledHeight);
        }

        remindUser = UIButton();
        remindUser.setImage(UIImage(named:"UNremember"), for: UIControlState.normal);
        remindUser.setImage(UIImage(named:"remember"), for: UIControlState.selected);
        remindUser.titleLabel?.font = UIFont.systemFont(ofSize: 13);
        remindUser.setTitleColor(RGB127, for: UIControlState.normal);
        self.view.addSubview(remindUser);
        remindUser.addTarget(self, action: #selector(remindUserClick), for: UIControlEvents.touchUpInside);
        remindUser.snp.makeConstraints { (make) in
            make.top.equalTo(password.snp.bottom).offset(5);
            make.leading.equalTo(password.snp.leading);
            make.height.equalTo(16);
            make.width.equalTo(16);
        }

        let remindName:UIButton = UIButton();
        self.view.addSubview(remindName);
        remindName.snp.makeConstraints { (make) in
            make.top.equalTo(password.snp.bottom).offset(5);
            make.leading.equalTo(remindUser.snp.trailing).offset(3);
            make.height.equalTo(16);
            make.width.equalTo(150);
        }
        remindName.addTarget(self, action: #selector(remindUserClick), for: UIControlEvents.touchUpInside);
        remindName.setTitle("记住交易所密码/账号", for: UIControlState.normal);
        remindName.titleLabel?.textAlignment = NSTextAlignment.left;
        remindName.titleLabel?.font = UIFont.systemFont(ofSize: 13);
        remindName.setTitleColor(RGB127, for: UIControlState.normal);

        let loginBtn:UIButton = UIButton().crateButtonWithAction(self, #selector(loginClick), "注册登录", 19, GLOBAL_RED);
        self.view.addSubview(loginBtn);
        loginBtn.snp.makeConstraints { (make) in
            make.top.equalTo(password.snp.bottom).offset(45);
            make.leading.equalTo(password.snp.leading);
            make.trailing.equalTo(password.snp.trailing);
            make.height.equalTo(textFiledHeight);
        }

        let signInBtn:UIButton = UIButton().crateButtonWithAction(self, #selector(signInClick), "注册账号", 19, GLOBAL_BLUE);
        self.view.addSubview(signInBtn);
        signInBtn.snp.makeConstraints { (make) in
            make.top.equalTo(loginBtn.snp.bottom).offset(10);
            make.leading.equalTo(loginBtn.snp.leading);
            make.trailing.equalTo(loginBtn.snp.trailing);
            make.height.equalTo(textFiledHeight);
        }


    }


    @objc func remindUserClick(){
        remindUser.isSelected = !remindUser.isSelected;
    }


    @objc func loginClick() -> Void {
        Alamofire.request(TradeUrl.appending(tradeCode.text!)).validate(contentType: ["applacation/json"]).responseString { (response) in
            if let tradeInfo = JSONDeserializer<TradeModel>.deserializeFrom(json: response.result.value){
                let tradeModel:TradeModel = tradeInfo;
                TradeModel.shareInstance.Ip = tradeModel.Ip;
                TradeModel.shareInstance.Port = tradeModel.Port;
                TradeModel.shareInstance.CommunicationUrl = tradeModel.CommunicationUrl;
                TradeModel.shareInstance.CompanyName = tradeModel.CompanyName;
                TradeModel.shareInstance.ConsultationUrl = tradeModel.ConsultationUrl;
                TradeModel.shareInstance.CreateAccountUrl = tradeModel.CreateAccountUrl;
                TradeModel.shareInstance.CusServTel = tradeModel.CusServTel;
                TradeModel.shareInstance.IsShow = tradeModel.IsShow;
                TradeModel.shareInstance.LogoImg = tradeModel.LogoImg;
                TradeModel.shareInstance.MoneyInUrl = tradeModel.MoneyInUrl;
                TradeModel.shareInstance.MoneyOutUrl = tradeModel.MoneyOutUrl;
                TradeModel.shareInstance.SiteUrl = tradeModel.SiteUrl;
                TradeModel.shareInstance.StudyUrl = tradeModel.StudyUrl;
                TradeModel.shareInstance.TradeCenterName = tradeModel.TradeCenterName;
                TradeModel.shareInstance.Version = tradeModel.Version;
            }
            
        }
    }

    @objc func signInClick() -> Void {
        let signInVC:SignInViewController = SignInViewController();
        self.navigationController?.pushViewController(signInVC, animated: true);

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
