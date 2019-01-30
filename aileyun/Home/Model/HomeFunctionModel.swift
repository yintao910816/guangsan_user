//
//  HomeFunctionModel.swift
//  aileyun
//
//  Created by huchuang on 2017/7/28.
//  Copyright © 2017年 huchuang. All rights reserved.
//

import UIKit

class HomeFunctionModel: NSObject {
    
    
    var name : String?
    var id : NSNumber = NSNumber.init(value: 0)
    var code : String?
    var modifydate : String = ""
    var remark : String?
    
    var isvalid : String?
    var createdate : String = ""
    var iconPath : String?
    var functionUrl : String?
    
    var unitId: NSNumber = NSNumber.init(value: 0)
    
    var isBind : String = ""
    
    // MARK:- 构造函数
    init(_ dict : [String : Any]) {
        super.init()
        
        setValuesForKeys(dict)
    }
    override func setValue(_ value: Any?, forUndefinedKey key: String) {}

}
