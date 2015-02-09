//
//  SubjectView.swift
//  Jadeite
//
//  Created by Shigure Shimotori on 1/11/15.
//  Copyright (c) 2015 Shigure Shimotori. All rights reserved.
//

import UIKit

class SubjectView: UIViewController, UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate {
    
    private struct const{
        static let defaultTitle = "No title"
    }
    class var defaultTitle:String{
        get{return const.defaultTitle}
    }
    
    var pageTitle = SubjectView.defaultTitle
    
    
    var viewPoint = CGPoint(x:0,y:CGFloat(Size.statusBar.height))
    func nextViewPoint(point:CGPoint){
            viewPoint.x += point.x
            viewPoint.y += point.y
    }
    
    let settingSections = ["科目設定","単位設定","授業設定"]
    let subjectSettings = ["科目名","担当教官名"]
    let creditSettings = ["単位数","評価","科目分類"]
    let classSettings = ["授業日","休講日"]
    var scrollView:UIScrollView?
    var activeField:UITextField?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        setTitleView(pageTitle)
        
        nextViewPoint(CGPoint(x:0,y:self.getNavigationBarHeight()!))
        
        
        /*let subjectNameLabel = UILabel()
        subjectNameLabel.text = "科目名"
        nextViewPoint(self.addSubView(subjectNameLabel,point:viewPoint))
        
        let typeNameLabel = UILabel()
        typeNameLabel.text = "種別名"
        nextViewPoint(self.addSubView(typeNameLabel,point:viewPoint))*/
        
        // TableViewの生成( status barの高さ分ずらして表示 ).
        let myTableView: UITableView = UITableView(frame:CGRectMake(viewPoint.x,viewPoint.y,getWidth(),getHeight()),style:UITableViewStyle.Grouped)
        //let myTableView: UITableView = UITableView(frame:CGRectMake(0,0,getWidth(),getHeight()),style:UITableViewStyle.Grouped)
        println(getWidth())
        println(getHeight())

        myTableView.setTranslatesAutoresizingMaskIntoConstraints(false)
      
        
        // Cell名の登録をおこなう.
        myTableView.registerClass(UITableViewCell.self, forCellReuseIdentifier: "MyCell")
        // DataSourceの設定をする.
        myTableView.dataSource = self
        // Delegateを設定する.
        myTableView.delegate = self
        // Viewに追加する.
        self.view.addSubview(myTableView)
        scrollView = myTableView
        
        let leftConstraint = NSLayoutConstraint(item:myTableView,attribute:NSLayoutAttribute.Left,relatedBy:NSLayoutRelation.Equal,toItem:self.view,attribute:NSLayoutAttribute.Left,multiplier:1,constant:0)
        let topConstraint = NSLayoutConstraint(item:myTableView,attribute:NSLayoutAttribute.Top,relatedBy:NSLayoutRelation.Equal,toItem:self.view,attribute:NSLayoutAttribute.Top,multiplier:1,constant:0)
        let rightConstraint = NSLayoutConstraint(item:myTableView,attribute:NSLayoutAttribute.Right,relatedBy:NSLayoutRelation.Equal,toItem:self.view,attribute:NSLayoutAttribute.Right,multiplier:1,constant:0)
        let bottomConstraint = NSLayoutConstraint(item:myTableView,attribute:NSLayoutAttribute.Bottom,relatedBy:NSLayoutRelation.Equal,toItem:self.view,attribute:NSLayoutAttribute.Bottom,multiplier:1,constant:0)
        self.view.addConstraints([leftConstraint,topConstraint,rightConstraint,bottomConstraint])
        
        //下のところ
        let toSubjectViewButton = UIBarButtonItem(title:Icon.list,style:UIBarButtonItemStyle.Plain,target:nil,action:nil)
        toSubjectViewButton.setTitleTextAttributes([NSFontAttributeName:UIFont(name:Icon.font,size:Icon.size)!],forState:UIControlState.Normal)
        toSubjectViewButton.tintColor = UIColor.kawaColor()
        let toTimeTableViewButton = UIBarButtonItem(title:Icon.calendar,style:UIBarButtonItemStyle.Plain,target:self,action:"toTimeTableView:")
        let flexibleSpace:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem:UIBarButtonSystemItem.FlexibleSpace,target: nil,action:nil)
        setToolBar([flexibleSpace,toSubjectViewButton,toTimeTableViewButton])
        
        
        //NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
        //NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillHide:"), name:UIKeyboardWillHideNotification, object: nil);
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        NSNotificationCenter.defaultCenter().addObserver(self, selector: Selector("keyboardWillShow:"), name:UIKeyboardWillShowNotification, object: nil);
    }
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        NSNotificationCenter.defaultCenter().removeObserver(self,name:UIKeyboardWillShowNotification,object:nil)
        //NSNotificationCenter.defaultCenter().removeObserver(self,name:UIKeyboardWillHideNotification,object:nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func numberOfSectionsInTableView(tableView: UITableView!)->Int{
        return settingSections.count
    }

    func tableView(tableView: UITableView, titleForHeaderInSection section: Int)->String?{
        return settingSections[section]
    }
    
    /*
    Cellが選択された際に呼び出される.
    */
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        if indexPath.section == 0 {
            //println("Value: \(myiPhoneItems[indexPath.row])")
        } else if indexPath.section == 1 {
            //println("Value: \(myAndroidItems[indexPath.row])")
        }
    }
    
    /*
    テーブルに表示する配列の総数を返す.
    */
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int)->Int{
        switch section{
        case 0:
            return subjectSettings.count
        case 1:
            return creditSettings.count
        case 2:
            return classSettings.count
        default:
            return 0
        }
    }
    
    /*
    Cellに値を設定する.
    */
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath)->UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("MyCell",forIndexPath:indexPath) as UITableViewCell
        
        switch indexPath.section{
        case 0:
            cell.textLabel?.text = subjectSettings[indexPath.row]
        case 1:
            cell.textLabel?.text = creditSettings[indexPath.row]
        case 2:
            cell.textLabel?.text = classSettings[indexPath.row]
        default:
            break
        }
        cell.textLabel?.sizeToFit()
        
        let labelWidth = cell.textLabel?.bounds.width
        let labelHeight = cell.textLabel?.bounds.height

        let padding = Size.TableView.Margin.left*2+labelWidth!
        
        var textField = UITextField()
        textField.setTranslatesAutoresizingMaskIntoConstraints(false)
        //textField.borderStyle = UITextBorderStyle.RoundedRect
        textField.textColor = UIColor.tsuyukusaColor()
        textField.delegate = self
        textField.textAlignment = NSTextAlignment.Right
        cell.contentView.addSubview(textField)
        cell.contentView.autoresizingMask = UIViewAutoresizing.FlexibleHeight | UIViewAutoresizing.FlexibleWidth;
        let views = ["textField":textField]
        
        var constraints : [AnyObject] = []
        constraints += NSLayoutConstraint.constraintsWithVisualFormat("|-150-[textField]-50-|",options:NSLayoutFormatOptions.AlignAllTop, metrics:nil,views:views)
        constraints.append(NSLayoutConstraint(item:textField,attribute:NSLayoutAttribute.Top,relatedBy:NSLayoutRelation.Equal,toItem:cell.contentView,attribute:NSLayoutAttribute.Top,multiplier:1,constant:0))
        constraints.append(NSLayoutConstraint(item:textField,attribute:NSLayoutAttribute.Bottom,relatedBy:NSLayoutRelation.Equal,toItem:cell.contentView,attribute:NSLayoutAttribute.Bottom,multiplier:1,constant:0))
        cell.contentView.addConstraints(constraints)
      //         cell.contentView.autoresizingMask = UIViewAutoresizing.FlexibleHeight | UIViewAutoresizing.FlexibleWidth;
        
        return cell
    }
    
    func keyboardWillShow(sender:NSNotification){
        println("keyboardwillshow")
        let keyboardFrameEnd = ((sender.userInfo! as NSDictionary).valueForKey(UIKeyboardFrameEndUserInfoKey) as NSValue).CGRectValue()
        let screenBounds = UIScreen.mainScreen().bounds
        let screenHeight = screenBounds.size.height
        
        println("\(activeField!.frame.origin.y) + \(activeField!.frame.size.height) > \(getHeight()) - \(keyboardFrameEnd.size.height - 20)")
        if activeField!.frame.origin.y + activeField!.frame.size.height > getHeight() - keyboardFrameEnd.size.height - 20{
            UIView.animateWithDuration(0.3,animations:{()->Void in
                self.scrollView!.frame = CGRectMake(0,self.getHeight()-self.activeField!.frame.origin.y-self.activeField!.frame.size.height-keyboardFrameEnd.size.height-20,self.scrollView!.frame.size.width,self.scrollView!.frame.size.height)
            })
         
        }
    }
    
    func textFieldShouldBeginEditing(textField: UITextField) -> Bool {
        println("textFieldSBE")
        activeField = textField
        return true
    }

    func textFieldShouldReturn(textField: UITextField!)->Bool{
        self.view.endEditing(true)

        return true
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        UIView.animateWithDuration(0.2,animations:{()->Void in
            self.scrollView!.frame = CGRectMake(0,0,self.scrollView!.frame.size.width,self.scrollView!.frame.size.height)
        })
        textField.resignFirstResponder()
    }
    
    func closeKeyboardForTextView(){
        self.view.endEditing(true)
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
