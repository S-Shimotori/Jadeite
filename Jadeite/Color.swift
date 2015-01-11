//
//  Color.swift
//  Jadeite
//
//  Created by Shigure Shimotori on 1/11/15.
//  Copyright (c) 2015 Shigure Shimotori. All rights reserved.
//

import Foundation
import UIKit

class Color{
    private struct parameter{
        static let hisui = UIColor(red:0.2196,green:0.7059,blue:0.5451, alpha:1)
    }
    class var hisui:UIColor{
        get{return parameter.hisui}
    }
}