//
//  Size.swift
//  Jadeite
//
//  Created by Shigure Shimotori on 1/12/15.
//  Copyright (c) 2015 Shigure Shimotori. All rights reserved.
//

import UIKit

class Size{
    class Margin{
        private struct value{
            static let top:Float = 100
            static let bottom:Float = 50
        }
        class var top:Float{
            get{return value.top}
        }
        class var bottom:Float{
            get{return value.bottom}
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
