//
//  ViewController.swift
//  SLPageView设计
//
//  Created by Anthony on 2017/4/14.
//  Copyright © 2017年 SLZeng. All rights reserved.
//

import UIKit

private let kEmoticonCell = "kEmoticonCell"

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        automaticallyAdjustsScrollViewInsets = false
        
        testPageCollectionView()
    }
    
    fileprivate func testPageCollectionView() {
        let pageFrame = CGRect(x: 0, y: 100, width: view.bounds.width, height: 300)
        
        let titles = ["土豪", "热门", "专属", "常见"]
        let style = SLTitleStyle()
        style.isShowScrollLine = true
        
        let layout = SLPageCollectionViewLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.minimumInteritemSpacing = 0
        layout.minimumLineSpacing = 0
        layout.cols = 7
        layout.rows = 3
        
        let pageCollectionView = SLPageCollectionView(frame: pageFrame, titles: titles, style: style, isTitleInTop: false, layout: layout)
        
        pageCollectionView.dataSource = self
        pageCollectionView.register(cell: UICollectionViewCell.self, identifier: kEmoticonCell)
        
        view.addSubview(pageCollectionView)
    }
    
    fileprivate func tesetPageView() {
        // 1.标题
        let titles = ["游戏", "娱乐", "趣玩", "美女", "颜值"]
        let style = SLTitleStyle()
        // style.titleHeight = 44
        //        style.isScrollEnable = true
        style.isShowScrollLine = true
        
        // 2.计算所有的子控制器
        var childVcs = [UIViewController]()
        for _ in 0..<titles.count {
            let vc = UIViewController()
            vc.view.backgroundColor = UIColor.randomColor()
            childVcs.append(vc)
        }
        
        // 3.pageView的frame
        let pageFrame = CGRect(x: 0, y: 64, width: view.bounds.width, height: view.bounds.height - 64)
        
        // 4.创建SLPageView,并且添加到控制器的view中
        let pageView = SLPageView(frame: pageFrame, titles: titles, childVcs: childVcs, parentVc: self, style : style)
        view.addSubview(pageView)
    }
}

extension ViewController : SLPageCollectionViewDataSource {
    func numberOfSections(in pageCollectionView: SLPageCollectionView) -> Int {
        return 4
    }
    
    func pageCollectionView(_ collectionView: SLPageCollectionView, numberOfItemsInSection section: Int) -> Int {
        return Int(arc4random_uniform(30)) + 25
    }
    
    func pageCollectionView(_ pageCollectionView: SLPageCollectionView, _ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: kEmoticonCell, for: indexPath)
        
        cell.backgroundColor = UIColor.randomColor()
        
        return cell
    }
}

