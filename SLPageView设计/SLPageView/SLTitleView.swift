//
//  SLTitleView.swift
//  SLPageView设计
//
//  Created by Anthony on 2017/4/14.
//  Copyright © 2017年 SLZeng. All rights reserved.
//

import UIKit

class SLTitleView: UIView {

    fileprivate var titles : [String]
    fileprivate var style : SLTitleStyle
    
    fileprivate lazy var titleLabels : [UILabel] = [UILabel]()
    fileprivate lazy var scrollView : UIScrollView = {
        let scrollView = UIScrollView(frame: self.bounds)
        scrollView.showsHorizontalScrollIndicator = false
        scrollView.scrollsToTop = false
        return scrollView
    }()
    
    init(frame: CGRect, titles : [String], style : SLTitleStyle) {
        self.titles = titles
        self.style = style
        
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}


extension SLTitleView {
    fileprivate func setupUI() {
        // 1.将UIScrollVIew添加到view中
        addSubview(scrollView)
        
        // 2.将titleLabel添加到UIScrollView中
        setupTitleLabels()
        
        // 3.设置titleLabel的frame
        setupTitleLabelsFrame()
    }
    
    private func setupTitleLabels() {
        for (i, title) in titles.enumerated() {
            let titleLabel = UILabel()
            titleLabel.text = title
            titleLabel.font = UIFont.systemFont(ofSize: style.fontSize)
            titleLabel.tag = i
            titleLabel.textAlignment = .center
            titleLabel.textColor = i == 0 ? style.selectColor : style.normalColor
            
            scrollView.addSubview(titleLabel)
            
            titleLabels.append(titleLabel)
        }
    }
    
    private func setupTitleLabelsFrame() {
        let count = titles.count
        
        for (i, label) in titleLabels.enumerated() {
            var w : CGFloat = 0
            let h : CGFloat = bounds.height
            var x : CGFloat = 0
            let y : CGFloat = 0
            
            if style.isScrollEnable { // 可以滚动
                w = (titles[i] as NSString).boundingRect(with: CGSize(width: CGFloat(MAXFLOAT), height: 0), options: .usesLineFragmentOrigin, attributes: [NSFontAttributeName : label.font], context: nil).width
                if i == 0 {
                    x = style.itemMargin * 0.5
                } else {
                    let preLabel = titleLabels[i - 1]
                    x = preLabel.frame.maxX + style.itemMargin
                }
            } else { // 不能滚动
                w = bounds.width / CGFloat(count)
                x = w * CGFloat(i)
            }
            
            label.frame = CGRect(x: x, y: y, width: w, height: h)
        }
        
        scrollView.contentSize = style.isScrollEnable ? CGSize(width: titleLabels.last!.frame.maxX + style.itemMargin * 0.5, height: 0) : CGSize.zero
    }
}
