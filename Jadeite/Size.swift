//
//  Size.swift
//  Jadeite
//
//  Created by Shigure Shimotori on 1/12/15.
//  Copyright (c) 2015 Shigure Shimotori. All rights reserved.
//

import UIKit

class Size{
    class TableView{
        class Margin{
            struct value{
                static let left:CGFloat = 15
            }
            class var left:CGFloat{
                get{return Margin.value.left}
            }
        }
    }
    class statusBar{
        class var height:CGFloat{
            get{return UIApplication.sharedApplication().statusBarFrame.size.height}
        }
        class var width:CGFloat{
            get{return UIApplication.sharedApplication().statusBarFrame.size.width}
        }
    }
    
    /*private let viewController:UIViewController
    private var view:UIView{
        get{return viewController.view}
    }
    
    private var y = CGFloat(Size.Margin.top)
    func setY(value:CGFloat){
        y+=value
    }
    
    init(viewController:UIViewController){
        self.viewController = viewController
    }
    func add(subView:UIView){
        subView.frame = CGRectMake(0,y,0,0)
        setY(subView.bounds.height)
        view.addSubview(subView)
    }*/
    
}
