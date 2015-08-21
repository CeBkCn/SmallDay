//
//  ExploreViewController.swift
//  SmallDay
//
//  Created by MacBook on 15/8/14.
//  Copyright (c) 2015年 维尼的小熊. All rights reserved.
//  探索

import UIKit

class ExploreViewController: MainViewController, DoubleTextViewDelegate {
    
    var backgroundScrollView: UIScrollView!
    var doubleTextView: DoubleTextView!

    override func viewDidLoad() {
        super.viewDidLoad()

        // 初始化导航条内容
        setNav()
        
        // 设置scrollView
        setScrollView()

    }

    func setScrollView() {
        backgroundScrollView = UIScrollView(frame: CGRectMake(0, 0, theme.appWidth, theme.appHeight - 64 - 49))
        self.automaticallyAdjustsScrollViewInsets = false
        backgroundScrollView.backgroundColor = UIColor.redColor()
        backgroundScrollView.contentSize = CGSizeMake(theme.appWidth * 2.0, 0)
        backgroundScrollView.showsHorizontalScrollIndicator = false
        backgroundScrollView.showsVerticalScrollIndicator = false
        backgroundScrollView.pagingEnabled = true
        backgroundScrollView.delegate = self
        view.addSubview(backgroundScrollView)
    }
    
    func setNav() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "附近", titleClocr: UIColor.blackColor(), targer: self, action: "nearClick")
        
        doubleTextView = DoubleTextView(leftText: "美天", rigthText: "美辑");
        doubleTextView.frame = CGRectMake(0, 0, 140, 44)
        doubleTextView.delegate = self
        navigationItem.titleView = doubleTextView
    }
    
    /// 附近action
    func nearClick() {
        let nearVC = NearViewController()
        navigationController?.pushViewController(nearVC, animated: true)
    }
    
    // MARK: - DoubleTextViewDelegate
    func doubleTextView(doubleTextView: DoubleTextView, didClickBtn btn: UIButton, forIndex index: Int) {
        backgroundScrollView.setContentOffset(CGPointMake(theme.appWidth * CGFloat(index), 0), animated: true)
    }

    
}

/// 扩展代理方法
extension ExploreViewController: UIScrollViewDelegate {
    
    // MARK: - UIScrollViewDelegate 监听scrollView的滚动事件
    func scrollViewDidEndDecelerating(scrollView: UIScrollView) {
        if scrollView === backgroundScrollView {
            let index = Int(scrollView.contentOffset.x / theme.appWidth)
            doubleTextView.clickBtnToIndex(index)
        }
    }
}
