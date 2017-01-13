//
//  TradeModel.swift
//  Swift邮币卡
//
//  Created by 李涛涛 on 2017/1/13.
//  Copyright © 2017年 点石科技. All rights reserved.
//

import UIKit
import HandyJSON

class TradeModel: HandyJSON {

    /**
     *  轮播图
     */
    var BannerImgs:NSArray = [];
    /**
     *  交流接口
     */
    var CommunicationUrl:NSString = "";
    /**
     *  公司全称
     */
    var CompanyName:NSString = "";
    /**
     *  咨询接口
     */
    var ConsultationUrl:NSString = "";
    /**
     *  开户接口
     */
    var CreateAccountUrl:NSString = "";
    /**
     *  客服电话
     */
    var CusServTel:NSString = "";
    /**
     *  交易所IP地址
     */
    var Ip:NSString = "";
    /**
     *  交易与否
     */
    var IsShow:NSString = "";
    /**
     *  交易所Logo
     */
    var LogoImg:NSString = "";
    /**
     *  入金链接
     */
    var MoneyInUrl:NSString = "";
    /**
     *  出金链接
     */
    var MoneyOutUrl:NSString = "";
    /**
     *  端口号
     */
    var Port:Int = 0;
    /**
     *  官网链接
     */
    var SiteUrl:NSString = "";
    /**
     *  学堂链接
     */
    var StudyUrl:NSString = "";
    /**
     *  交易所名称
     */
    var TradeCenterName:NSString = "";
    /**
     *  版本号
     */    var Version:NSString = "";

    required init() {}
}
