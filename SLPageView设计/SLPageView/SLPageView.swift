//
//  SLPageView.swift
//  SLPageView设计
//
//  Created by Anthony on 2017/4/14.
//  Copyright © 2017年 SLZeng. All rights reserved.
//

import UIKit

class SLPageView: UIView {
    
        fileprivate var titles : [String]
        fileprivate var childVcs : [UIViewController]
        fileprivate var parentVc : UIViewController
        fileprivate var style : SLTitleStyle
        
        fileprivate var titleView : SLTitleView!
        
        init(frame: CGRect, titles : [String], childVcs : [UIViewController], parentVc : UIViewController, style : SLTitleStyle) {
            self.titles = titles
            self.childVcs = childVcs
            self.parentVc = parentVc
            self.style = style
            
            super.init(frame: frame)
            
            setupUI()
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
    }
    
    
    // MARK:- 设置UI界面
    extension SLPageView {
        fileprivate func setupUI() {
            setupTitleView()
            setupContentView()
        }
        
        private func setupTitleView() {
            let titleFrame = CGRect(x: 0, y: 0, width: bounds.width, height: style.titleHeight)
            titleView = SLTitleView(frame: titleFrame, titles: titles, style: style)
            addSubview(titleView)
            titleView.backgroundColor = UIColor.randomColor()
        }
        
        private func setupContentView() {
            // ?.取到类型一定是可选类型
            let contentFrame = CGRect(x: 0, y: style.titleHeight, width: bounds.width, height: bounds.height - style.titleHeight)
            let contentView = SLContentView(frame: contentFrame, childVcs: childVcs, parentVc: parentVc)
            addSubview(contentView)
            contentView.backgroundColor = UIColor.randomColor()
        }
}
