//
//  SLPageCollectionView.swift
//  SLPageView设计
//
//  Created by Anthony on 2017/4/22.
//  Copyright © 2017年 SLZeng. All rights reserved.
//

import UIKit

private let kCollectionViewCell = "kCollectionViewCell"

class SLPageCollectionView: UIView {
    
    fileprivate var titles : [String]
    fileprivate var isTitleInTop : Bool
    fileprivate var style : SLTitleStyle
    fileprivate var layout : UICollectionViewFlowLayout
    
    init(frame: CGRect, titles : [String], style : SLTitleStyle, isTitleInTop : Bool, layout : UICollectionViewFlowLayout) {
        self.titles = titles
        self.style = style
        self.isTitleInTop = isTitleInTop
        self.layout = layout
        
        super.init(frame: frame)
        
        setupUI()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension SLPageCollectionView {
    fileprivate func setupUI() {
        // 1.创建titleView
        let titleY = isTitleInTop ? 0 : bounds.height - style.titleHeight
        let titleFrame = CGRect(x: 0, y: titleY, width: bounds.width, height: style.titleHeight)
        let titleView = SLTitleView(frame: titleFrame, titles: titles, style: style)
        addSubview(titleView)
        titleView.backgroundColor = UIColor.randomColor()
        
        // 2.创建UIPageControl
        let pageControlHeight : CGFloat = 20
        let pageControlY = isTitleInTop ? (bounds.height - pageControlHeight) : (bounds.height - pageControlHeight - style.titleHeight)
        let pageControlFrame = CGRect(x: 0, y: pageControlY, width: bounds.width, height: pageControlHeight)
        let pageControl = UIPageControl(frame: pageControlFrame)
        pageControl.numberOfPages = 4
        addSubview(pageControl)
        pageControl.backgroundColor = UIColor.randomColor()
        
        // 3.创建UICollectionView
        let collectionViewY = isTitleInTop ? style.titleHeight : 0
        let collectionViewFrame = CGRect(x: 0, y: collectionViewY, width: bounds.width, height: bounds.height - style.titleHeight - pageControlHeight)
        let collectionView = UICollectionView(frame: collectionViewFrame, collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: kCollectionViewCell)
        collectionView.isPagingEnabled = true
        collectionView.showsHorizontalScrollIndicator = false
        addSubview(collectionView)
        collectionView.backgroundColor = UIColor.randomColor()
    }
}


extension SLPageCollectionView : UICollectionViewDataSource {
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 4
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int(arc4random_uniform(30)) + 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kCollectionViewCell, for: indexPath)
        
        cell.backgroundColor = UIColor.randomColor()
        
        return cell
    }
}

