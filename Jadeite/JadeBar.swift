//
//  JadeBar.swift
//  Jadeite
//
//  Created by Shigure Shimotori on 1/11/15.
//  Copyright (c) 2015 Shigure Shimotori. All rights reserved.
//

import UIKit

class JadeBar{
    class func titleView(text:String)->UILabel{
        var titleView = UILabel()
        titleView.textColor = UIColor.hisuiColor()
        titleView.text = text
        titleView.sizeToFit()
        return titleView
    }
    class func setToolBar(view:UIViewController,buttons:[UIBarButtonItem]){
        view.navigationController?.toolbar.tintColor = UIColor.hisuiColor()
        view.navigationController?.toolbar.barTintColor = UIColor.blackColor()
        
        var buttonArray = NSMutableArray()
        
        for button in buttons{
            button.setTitleTextAttributes([NSFontAttributeName:UIFont(name:Icon.font,size:Icon.size)!],forState:UIControlState.Normal)
            buttonArray.addObject(button)
        }
        view.toolbarItems = buttonArray
    }
}
