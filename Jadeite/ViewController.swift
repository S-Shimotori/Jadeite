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
        setTitleView("時間割")
        
        println(getHeight())
        println(getWidth())
        
        //上のところ
        let addObject = UIBarButtonItem(title:Icon.add, style:UIBarButtonItemStyle.Bordered, target:self, action:"toSubjectView:")
        addObject.setTitleTextAttributes([NSFontAttributeName:UIFont(name:Icon.font,size:Icon.size)!],forState:UIControlState.Normal)
        self.navigationItem.setRightBarButtonItems(NSArray(arrayLiteral:addObject),animated:true)
        
        //下のところ
        let toSubjectViewButton = UIBarButtonItem(title:Icon.list,style:UIBarButtonItemStyle.Bordered,target:self,action:"toSubjectView:")
        let toTimeTableViewButton = UIBarButtonItem(title:Icon.calendar,style:UIBarButtonItemStyle.Bordered,target:self,action:"toTimeTableView:")
        let flexibleSpace:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.FlexibleSpace,target: nil,action:nil)
        setToolBar([flexibleSpace,toSubjectViewButton,toTimeTableViewButton])
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