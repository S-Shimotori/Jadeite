//
//  ViewController.swift
//  Jadeite
//
//  Created by Shigure Shimotori on 1/11/15.
//  Copyright (c) 2015 Shigure Shimotori. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationController?.setToolbarHidden(false,animated:false)
        //下のところ
        navigationController?.toolbar.tintColor = UIColor.blueColor()
        //let toSubjectViewButton = UIBarButtonItem(title:"\u{E800}",style: UIBarButtonItemStyle.Bordered,target:self,action:"toSubjectView:")
        let toSubjectViewButton = UIBarButtonItem()
        toSubjectViewButton.title = "\u{f03a}"
        toSubjectViewButton.setTitleTextAttributes([NSFontAttributeName:UIFont(name:"FontAwesome",size:20)!],forState:UIControlState.Normal)
        //([NSFontAttributeName:UIFont(name:"fontawesome-webfont",size:15)],forState:UIControlState.Normal)
        toSubjectViewButton.target = self
        toSubjectViewButton.action = "toSubjectView:"
        let flexibleSpace:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.FlexibleSpace,target: nil,action:nil)
        self.toolbarItems = NSArray(arrayLiteral:flexibleSpace,toSubjectViewButton)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func toSubjectView(button:UIButton){
        let nextView = SubjectView()
        //SecondViewに移動する.
        self.navigationController?.pushViewController(nextView,animated: true)
    }
}