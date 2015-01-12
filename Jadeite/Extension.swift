//
//  Extension.swift
//  Jadeite
//
//  Created by Shigure Shimotori on 1/11/15.
//  Copyright (c) 2015 Shigure Shimotori. All rights reserved.
//

import Foundation
import UIKit

extension UIColor{
    class func hex(var hexStr:NSString, var alpha:CGFloat)->UIColor{
        hexStr = hexStr.stringByReplacingOccurrencesOfString("#",withString:"")
        let scanner = NSScanner(string:hexStr)
        var color:UInt32 = 0
        if scanner.scanHexInt(&color){
            let r = CGFloat((color&0xFF0000)>>16) / 255.0
            let g = CGFloat((color&0x00FF00)>>8) / 255.0
            let b = CGFloat(color&0x0000FF) / 255.0
            return UIColor(red:r,green:g,blue:b,alpha:alpha)
        } else {
            print("invalid hex string")
            return UIColor.whiteColor();
        }
    }
    
    class func hisuiColor()->UIColor{
        return hex("38b48b",alpha:1)
    }
    class func kawaColor()->UIColor{
        return hex("475950",alpha:1)
    }
}

extension UIViewController{
    func setTitleView(text:String){
        var titleView = UILabel()
        titleView.textColor = UIColor.hisuiColor()
        titleView.text = text
        titleView.sizeToFit()
        self.navigationItem.titleView = titleView
        self.navigationController?.setToolbarHidden(false,animated:false)
    }
    func setToolBar(buttons:[UIBarButtonItem]){
        self.navigationController?.toolbar.tintColor = UIColor.hisuiColor()
        self.navigationController?.toolbar.barTintColor = UIColor.blackColor()
        
        var buttonArray = NSMutableArray()
        
        for button in buttons{
            button.setTitleTextAttributes([NSFontAttributeName:UIFont(name:Icon.font,size:Icon.size)!],forState:UIControlState.Normal)
            buttonArray.addObject(button)
        }
        self.toolbarItems = buttonArray
    }

    func addSubView(subView:UIView,point:CGPoint,fit:Bool=true,shiftY:Bool=true,shiftX:Bool=false)->CGPoint{
        if fit{
            subView.frame = CGRectMake(point.x,point.y,0,0)
            subView.sizeToFit()
        }else{
            subView.frame = CGRectMake(point.x,point.y,subView.bounds.width,subView.bounds.height)
        }
        view.addSubview(subView)
        var shiftPoint = CGPoint(x:0,y:0)
        if shiftX{
            shiftPoint.x = subView.bounds.width
        }
        if shiftY{
            shiftPoint.y = subView.bounds.height
        }
        return shiftPoint
    }
}