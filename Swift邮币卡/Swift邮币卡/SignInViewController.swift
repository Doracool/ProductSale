//
//  SignInViewController.swift
//  Swift邮币卡
//
//  Created by 李涛涛 on 2017/1/12.
//  Copyright © 2017年 点石科技. All rights reserved.
//

import UIKit
import Alamofire
import HandyJSON

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.view.backgroundColor = BGColor;
        self.title = "注册";
        creatSignInView();
    }

    var tradeCode:UITextField!;


    func creatSignInView(){
        let logoImage:UIImageView = UIImageView(image:UIImage(named: "logo-h"));
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

        let signInBtn:UIButton = UIButton().crateButtonWithAction(self, #selector(signInClick), "注册账号", 19, GLOBAL_BLUE);
        self.view.addSubview(signInBtn);
        signInBtn.snp.makeConstraints { (make) in
            make.top.equalTo(tradeCode.snp.bottom).offset(20);
            make.leading.equalTo(tradeCode.snp.leading);
            make.trailing.equalTo(tradeCode.snp.trailing);
            make.height.equalTo(textFiledHeight);
        }

    }



    @objc func signInClick() -> Void {
        Alamofire.request(TradeUrl.appending(tradeCode.text!)).validate(contentType: ["application/json"]).responseString { (response) in

            if let tradeInfo = JSONDeserializer<TradeModel>.deserializeFrom(json: response.result.value){
                let tradeModel:TradeModel = tradeInfo;
                TradeModel.shareInstance.Ip = tradeModel.Ip;

            }
            print(TradeModel.shareInstance.Ip);
        }

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
