//
//  UITextFiled+Extension.swift
//  Swift邮币卡
//
//  Created by 李涛涛 on 2017/1/11.
//  Copyright © 2017年 点石科技. All rights reserved.
//

import Foundation
import UIKit

extension UITextField{
   class func textFieldLeftViewImageAndPlaceholder(_ image:NSString, _ placeholder:NSString) -> UITextField {
        let textfieldHeight = GLOBAL_HEIGHT * 0.08;

        let leftView:UIView = UIView(frame: CGRect(x: 0, y: 0, width: 60, height: textfieldHeight));
        let imageView:UIImageView = UIImageView();
        imageView.size = CGSize(width: 30, height: 30);
        imageView.centerX = leftView.centerX;
        imageView.centerY = leftView.centerY;
        leftView.addSubview(imageView);
        imageView.image = UIImage(named: image as String);
        let leftLine:UILabel = UILabel();
        leftLine.backgroundColor = Placeholder_TextColor;
        imageView.addSubview(leftLine);
        leftLine.snp.makeConstraints { (make) in
            make.top.equalTo(leftView.snp.top).offset(15);
            make.trailing.equalTo(leftView.snp.trailing).offset(-7);
            make.bottom.equalTo(leftView.snp.bottom).offset(-15);
            make.width.equalTo(1);
        }

        let textFiled:UITextField = UITextField.init();
        textFiled.placeholder = placeholder as String;
        textFiled.backgroundColor = TF_BGCOLOR;
        textFiled.setValue(Placeholder_TextColor, forKeyPath: "_placeholderLabel.textColor");
        textFiled.setValue(UIFont.systemFont(ofSize: 19), forKeyPath: "_placeholderLabel.font");
        textFiled.textColor = UIColor.white;
        textFiled.clearButtonMode = UITextFieldViewMode.always;
        textFiled.leftView = leftView;
        textFiled.leftViewMode = UITextFieldViewMode.always;

        return textFiled;

    }
}


extension UIButton{
    func crateButtonWithAction(_ target:Any, _ action:Selector ,_ title:NSString, _ font:CGFloat, _ BGcolor:UIColor) -> UIButton {
        let button:UIButton = UIButton(type: UIButtonType.custom);
        button.setTitle(title as String, for: UIControlState.normal);
        button.titleLabel?.font = UIFont.systemFont(ofSize: font);
        button.addTarget(target, action: action, for: UIControlEvents.touchUpInside);
        button.backgroundColor = BGcolor;

        return button;

    }
}
