//
//  SubjectView.swift
//  Jadeite
//
//  Created by Shigure Shimotori on 1/11/15.
//  Copyright (c) 2015 Shigure Shimotori. All rights reserved.
//

import UIKit

class SubjectView: UIViewController {
    
    private struct const{
        static let defaultTitle = "No title"
    }
    class var defaultTitle:String{
        get{return const.defaultTitle}
    }
    
    var pageTitle = SubjectView.defaultTitle
    
    var viewPoint = CGPoint(x:0,y:CGFloat(Size.Margin.top))
    func nextViewPoint(point:CGPoint){
            viewPoint.x += point.x
            viewPoint.y += point.y
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        setTitleView(pageTitle)
        
        let subjectNameLabel = UILabel()
        subjectNameLabel.text = "科目名"
        nextViewPoint(self.addSubView(subjectNameLabel,point:viewPoint))
        
        let typeNameLabel = UILabel()
        typeNameLabel.text = "種別名"
        nextViewPoint(self.addSubView(typeNameLabel,point:viewPoint))

        //下のところ
        let toSubjectViewButton = UIBarButtonItem(title:Icon.list,style:UIBarButtonItemStyle.Plain,target:nil,action:nil)
        toSubjectViewButton.setTitleTextAttributes([NSFontAttributeName:UIFont(name:Icon.font,size:Icon.size)!],forState:UIControlState.Normal)
        toSubjectViewButton.tintColor = UIColor.kawaColor()
        let toTimeTableViewButton = UIBarButtonItem(title:Icon.calendar,style:UIBarButtonItemStyle.Plain,target:self,action:"toTimeTableView:")
        let flexibleSpace:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.FlexibleSpace,target: nil,action:nil)
        setToolBar([flexibleSpace,toSubjectViewButton,toTimeTableViewButton])
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
