//
//  JAPageControl.swift
//  KnowageSet
//
//  Created by Jitendra Kumar Agarwal on 26/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import Foundation
import UIKit

class JAPageControl: UIView , UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout{
    
    private var collectionView: UICollectionView!
    private let cellReuseIdentifier = "JAPagerCell"
    private var dataItems:[AnyObject] = []
    private var currentPage:Int = 0
    var timerValue:CGFloat = 2.5
    override func awakeFromNib() {
        self.backgroundColor =  UIColor.clear
    }
    
    private var numberOfRows:Int {
        get {
            return dataItems.count
        }
    }
    
    // Working on pagecontrol
    var pageIndicator: UIPageControl = {
        let pageControl =  UIPageControl()
        pageControl.currentPageIndicatorTintColor = UIColor.blue
        pageControl.pageIndicatorTintColor = UIColor.lightGray
        pageControl.currentPage = 0
        return pageControl
    }()
    
    var isPageIndicator: Bool = true {
        didSet {
            if isPageIndicator {
                self.configurePageControl()
            }else{
                self.pageIndicator.removeFromSuperview()
            }
        }
    }
    private var pageControlWidth:CGFloat {
        get {
            return 20
        }
    }
    private var pageControlHeight:CGFloat {
        get {
            return 20
        }
        
    }
    var isPageAutoScroll:Bool =  false {
        didSet {
            if isPageAutoScroll{
                self.startAutoScrollTimer(timerVal:Int(self.timerValue))
            }
        }
    }

    
}


extension JAPageControl {
    private func configurePageControl() {
        self.addSubview(pageIndicator)
        pageIndicator.numberOfPages =  numberOfRows
        pageIndicator.bringSubviewToFront(self)
        pageIndicator.translatesAutoresizingMaskIntoConstraints = false
        pageIndicator.bottomAnchor.constraint(equalTo: self.collectionView.bottomAnchor, constant: -5).isActive = true
        pageIndicator.widthAnchor.constraint(equalToConstant: CGFloat(numberOfRows) * pageControlWidth).isActive = true
        pageIndicator.heightAnchor.constraint(equalToConstant: pageControlHeight).isActive = true
        pageIndicator.centerXAnchor.constraint(equalTo: self.collectionView.centerXAnchor).isActive = true
        
    }
    private func configureCollectionView() {
        let flowLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: self.bounds, collectionViewLayout: flowLayout)
        self.addSubview(collectionView)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        collectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        collectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        collectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        self.collectionView.register(UINib(nibName: "JAPagerCell", bundle: nil), forCellWithReuseIdentifier: "JAPagerCell")
        flowLayout.scrollDirection = .horizontal
        collectionView.isScrollEnabled =  true
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .clear
        collectionView.isPagingEnabled = true
        collectionView.showsVerticalScrollIndicator =  false
        collectionView.showsHorizontalScrollIndicator =  false
        
    }
    
    func loadPager(imageItems:[UIImage]?){
        guard let items = imageItems else {
            return
        }
        self.configureCollectionView()
        dataItems = items
        self.configurePageControl()
    }
    @objc private func moveToNextPage() {
      
        if self.currentPage < self.numberOfRows {
            let indexPath = IndexPath(item: self.currentPage, section: 0)
            self .collectionView.scrollToItem(at:indexPath , at:.centeredHorizontally, animated: true)
            self.pageIndicator.currentPage = self.currentPage
            self.currentPage = self.currentPage + 1
        }
        else {
            self.currentPage = 0
            self.pageIndicator.currentPage = self.currentPage
            self .collectionView.scrollToItem(at:IndexPath(item: self.currentPage, section: 0) , at:.centeredHorizontally, animated: true)
        }
      
    }
    // add timer for auto scrolling
    private func startAutoScrollTimer(timerVal:Int) {
       
    let _ = Timer.scheduledTimer(timeInterval: TimeInterval(timerVal), target: self, selector: #selector(JAPageControl.moveToNextPage), userInfo: nil,
                                     repeats: true)
    }
    
}

// MARK:- Collection view Delegate and datascourece
extension JAPageControl {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return numberOfRows
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellReuseIdentifier, for: indexPath) as! JAPagerCell
        cell.datasource = self.dataItems[indexPath.row]
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets
    {
        return UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: CGFloat((self.collectionView.frame.width)), height: CGFloat(self.collectionView.frame.height))
    }
    
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0.0
    }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        pageIndicator.currentPage = Int(scrollView.contentOffset.x) / Int(scrollView.frame.width)
        self.currentPage  =  pageIndicator.currentPage
    }
    
}




