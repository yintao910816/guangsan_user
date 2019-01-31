//
//  NoticeHomeVModel.swift
//  aileyun
//
//  Created by huchuang on 2017/11/11.
//  Copyright © 2017年 huchuang. All rights reserved.
//

import UIKit

class NoticeHomeVModel: NSObject {
    
    var id : NSNumber?
    var type : String?
    var title : String = "通知提醒"
    var content : String = "您有新的通知提醒，点击查看详情"
    var url : String?
    var createDate : String?
    var modifyDate : String?
    var validDate : String?
    var creates: String?
    var modifys: String?
    var bak: String?
    var unitId: NSNumber?
    
    // MARK:- 构造函数
    init(_ dict : [String : Any]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}
}
