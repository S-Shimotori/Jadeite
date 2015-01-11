//
//  jadeNavBar.swift
//  Jadeite
//
//  Created by Shigure Shimotori on 1/11/15.
//  Copyright (c) 2015 Shigure Shimotori. All rights reserved.
//

import UIKit

class jadeNavBar{
    class func titleView(text:String)->UILabel{
        var titleView = UILabel()
        titleView.textColor = Color.hisui
        titleView.text = text
        titleView.sizeToFit()
        return titleView
    }
}
