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
        self.view.backgroundColor = UIColor.whiteColor()
        self.navigationItem.titleView = jadeNavBar.titleView("時間割")
        //self.view.window?.rootViewController
        self.navigationController?.setToolbarHidden(false,animated:false)
        
        //上のところ
        let addObject = UIBarButtonItem(title:Icon.add, style:UIBarButtonItemStyle.Bordered, target:self, action:"toSubjectView:")
        addObject.setTitleTextAttributes([NSFontAttributeName:UIFont(name:Icon.font,size:Icon.size)!],forState:UIControlState.Normal)
        self.navigationItem.setRightBarButtonItems(NSArray(arrayLiteral:addObject),animated:true)
        
        //下のところ
        navigationController?.toolbar.tintColor = Color.hisui
        navigationController?.toolbar.barTintColor = UIColor.blackColor()
        let toSubjectViewButton = UIBarButtonItem(title:Icon.list,style:UIBarButtonItemStyle.Bordered,target:self,action:"toSubjectView:")
        toSubjectViewButton.setTitleTextAttributes([NSFontAttributeName:UIFont(name:Icon.font,size:Icon.size)!],forState:UIControlState.Normal)
        let toTimeTableViewButton = UIBarButtonItem(title:Icon.calendar,style:UIBarButtonItemStyle.Bordered,target:self,action:"toTimeTableView:")
        toTimeTableViewButton.setTitleTextAttributes([NSFontAttributeName:UIFont(name:Icon.font,size:Icon.size)!],forState:UIControlState.Normal)
        let flexibleSpace:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.FlexibleSpace,target: nil,action:nil)
        self.toolbarItems = NSArray(arrayLiteral:flexibleSpace,toSubjectViewButton,toTimeTableViewButton)
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
    func toTimeTableView(button:UIButton){
        let nextView = TimeTableView()
        self.navigationController?.pushViewController(nextView,animated: true)
    }
}