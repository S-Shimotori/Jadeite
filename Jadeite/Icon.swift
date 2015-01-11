//
//  Icon.swift
//  Jadeite
//
//  Created by Shigure Shimotori on 1/11/15.
//  Copyright (c) 2015 Shigure Shimotori. All rights reserved.
//

import Foundation
import UIKit

class Icon{
    private struct parameter{
        static let font = "FontAwesome"
        static let size:CGFloat = 25
        static let add = "\u{f067}"
        static let list = "\u{f03a}"
        static let calendar = "\u{f073}"
    }
    class var font:String{
        get{return parameter.font}
    }
    class var size:CGFloat{
        get{return parameter.size}
    }
    class var add:String{
        get{return parameter.add}
    }
    class var list:String{
        get{return parameter.list}
    }
    class var calendar:String{
        get{return parameter.calendar}
    }
}