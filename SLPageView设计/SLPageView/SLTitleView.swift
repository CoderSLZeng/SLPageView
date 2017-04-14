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
    
    init(frame: CGRect, titles : [String]) {
        self.titles = titles
        
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

}
