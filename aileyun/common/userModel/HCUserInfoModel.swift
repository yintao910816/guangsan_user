//
//  HCUserInfoModel.swift
//  aileyun
//
//  Created by huchuang on 2017/7/28.
//  Copyright © 2017年 huchuang. All rights reserved.
//

import UIKit

class HCUserInfoModel: NSObject {

    
//    var bannedTime : String?
//    var token : String?
//    var bannedSpeak : String?
    var nickname : String?
//    var birthday : String?
//
    var realname : String?
    var idNo : String?
    var userSign : String?
//    var umengDeviceToken : String?
    var visitCard : String?
//
//    var phone : String?
//    var bannedNo : NSNumber?
    var imgUrl : String?
    var hospitalId : NSNumber?
//    var phase : String?
//
//    var sex : NSNumber?
//    var pinyin : String?
//
//    var versionCode : String?
    
    var id : NSNumber?
    var account : String?
    var name : String?
    var email : String?
    var lastLogin : String?
    var ip : String?
//    var status : String?
//    var bak : String?
//    var skin : String?
//    var numbers : String?
//    var createDate : String?
//    var modifyDate : String?
//    var unitId : String?
    var sex : NSNumber?
//    var age : String?
//
    var birthday : String?
//    var token : String?
//
    var headPath : String?
//
//    var environment : String?
    var synopsis : String?
//    var bindDate : String?
//
//    var mobileInfo : String?
//    var unitName : String?
//    var visitCard : String?
//    var identityCard : String?
//    var hisNo : String?
//    var enable : NSNumber?

    var bbsFgiUrl : String?
    var getBbsTokenUrl : String?
    var findLastestTopics : String?
    
    var BBSToken : String?
    
    
    convenience init(_ dic : [String : Any]) {
        self.init()
        setValuesForKeys(dic)
    }
    
    override func setValue(_ value: Any?, forUndefinedKey key: String) {
        //
    }
    
}
