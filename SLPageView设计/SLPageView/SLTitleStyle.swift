//
//  SLTitleStyle.swift
//  SLPageView设计
//
//  Created by Anthony on 2017/4/14.
//  Copyright © 2017年 SLZeng. All rights reserved.
//

import UIKit

class SLTitleStyle {
    /// title的高度
    var titleHeight : CGFloat = 44
    
    /// Title字体大小
    var fontSize : CGFloat = 15.0
    
    /// 普通Title颜色
    var normalColor : UIColor = UIColor(r: 0, g: 0, b: 0)
    /// 选中Title颜色
    var selectColor : UIColor = UIColor(r: 255, g: 127, b: 0)
    
    /// 是否是滚动的Title
    var isScrollEnable : Bool = false
    /// 滚动Title的字体间距
    var itemMargin : CGFloat = 30
    /// 是否显示底部滚动条
    var isShowScrollLine : Bool = false
    /// 底部滚动条的高度
    var scrollLineHeight : CGFloat = 2
    /// 底部滚动条的颜色
    var scrollLineColor : UIColor = .orange
    
    /// 是否显示遮盖
    var isShowCover : Bool = false
    /// 遮盖背景颜色
    var coverBgColor : UIColor = UIColor.lightGray
    /// 文字&遮盖间隙
    var coverMargin : CGFloat = 5
    /// 遮盖的高度
    var coverH : CGFloat = 25
    /// 设置圆角大小
    var coverRadius : CGFloat = 12
}
