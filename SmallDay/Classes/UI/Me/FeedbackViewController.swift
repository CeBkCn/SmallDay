//
//  FeedbackViewController.swift
//  SmallDay
//
//  Created by MacBook on 15/8/20.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  用户反馈ViewController

import UIKit

class FeedbackViewController: UIViewController, UITextFieldDelegate {
    /// 反馈留言TextView
    var feedbackTextView: UITextView!
    /// 联系方式textField
    var contactTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // 设置导航条上的内容
        setNav()
       
        view.backgroundColor = theme.SDBackgroundColor
        // 设置留言框和联系框
        setFeedbackTextViewAndContactTextField()
    }

    func setNav() {
         self.navigationItem.title = "留言反馈"
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "发送", style: UIBarButtonItemStyle.Done, target: self, action: "sendClick")
    }
    
    func setFeedbackTextViewAndContactTextField() {
        let backView = UIView(frame: CGRectMake(0, 5, theme.appWidth, 130))
        backView.backgroundColor = UIColor.whiteColor()
        feedbackTextView = UITextView(frame: CGRectMake(5, 0, theme.appWidth - 10, 130))
        feedbackTextView.backgroundColor = UIColor.whiteColor()
        feedbackTextView.font = UIFont.systemFontOfSize(20)
        feedbackTextView.allowsEditingTextAttributes = true
        feedbackTextView.autocorrectionType = UITextAutocorrectionType.No
        backView.addSubview(feedbackTextView!)
        view.addSubview(backView)
        
        contactTextField = UITextField(frame: CGRectMake(0, CGRectGetMaxY(feedbackTextView.frame) + 10, theme.appWidth, 50))
        contactTextField.clearButtonMode = UITextFieldViewMode.Always
        contactTextField.backgroundColor = UIColor.whiteColor()
        contactTextField.font = UIFont.systemFontOfSize(18)
        let leffView = UIView(frame: CGRectMake(0, 0, 10, 20))
        contactTextField.leftView = leffView
        contactTextField.leftViewMode = UITextFieldViewMode.Always
        contactTextField.placeholder = "留下邮箱或电话,以方便我们给你回复"
        contactTextField.autocorrectionType = UITextAutocorrectionType.No
        contactTextField.delegate = self
        view.addSubview(contactTextField)
    }
    
    func sendClick() {
        print("aaaa")
    }
    
    override func viewDidAppear(animated: Bool) {
        super.viewDidAppear(animated)
        feedbackTextView.becomeFirstResponder()
    }
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        println(contactTextField.text.validateMobile())
        return true
    }
}


