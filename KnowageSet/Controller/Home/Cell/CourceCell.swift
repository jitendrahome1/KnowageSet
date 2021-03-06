//
//  CourceCell.swift
//  KnowageSet
//
//  Created by Jitendra Kumar Agarwal on 29/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import UIKit


class CourceCell: BaseTableViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    private var cellSize:CellSize!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.contentView.backgroundColor = .clear
        // Initialization code
        self.configurationBGView()
    }
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        self.cellSize =  CellSize()
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        self.backgroundColor = .clear
        self.selectionStyle = .none
        self.configurationBGView()

        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    lazy var viewBG:UIView =  {
        let view =  UIView()
        view.backgroundColor = .clear
        
        return view
    }()
    
    func cellSize(width:CGFloat, height:CGFloat, rowEach:Int) {
        self.cellSize.setCellSize(width: width, height: height, rowEach:rowEach)
    }
    
    lazy var aCollectionView:UICollectionView =  {
        let flowLayout = UICollectionViewFlowLayout()
        let collectionView =  UICollectionView(frame: .zero, collectionViewLayout: flowLayout)
        flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 16, bottom:0, right: 16)
        collectionView.backgroundColor = UIColor.clear
        flowLayout.scrollDirection = .horizontal
        collectionView.isScrollEnabled =  true
        collectionView.showsVerticalScrollIndicator =  false
        collectionView.showsHorizontalScrollIndicator =  false
        collectionView.delegate =  self
        collectionView.dataSource = self
        return collectionView
    }()
  
    private func registerCustomCell() {
        aCollectionView.setContentOffset(aCollectionView.contentOffset, animated:false)
        aCollectionView.reloadData()
        self.aCollectionView.register(CourceCollectionviewCell.self)
        
    }
    private func configurationBGView() {
        self.addSubview(self.viewBG)
        viewBG.translatesAutoresizingMaskIntoConstraints = false
        viewBG.topAnchor.constraint(equalTo: self.topAnchor,constant:8).isActive = true
        viewBG.bottomAnchor.constraint(equalTo: self.bottomAnchor).isActive = true
        viewBG.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        viewBG.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        self.configurationCollectionView()
        
    }
    private func configurationCollectionView() {
        self.viewBG.addSubview(aCollectionView)
        
        aCollectionView.translatesAutoresizingMaskIntoConstraints = false
        aCollectionView.topAnchor.constraint(equalTo: self.viewBG.topAnchor).isActive = true
        aCollectionView.bottomAnchor.constraint(equalTo: self.viewBG.bottomAnchor).isActive = true
        aCollectionView.leadingAnchor.constraint(equalTo: self.viewBG.leadingAnchor).isActive = true
        aCollectionView.trailingAnchor.constraint(equalTo: self.viewBG.trailingAnchor).isActive = true
        self.registerCustomCell()
    }
    
    func updateLayout() {
        
      
        let layout = aCollectionView.collectionViewLayout as? UICollectionViewFlowLayout
        
        layout!.itemSize = CGSize(width: cellSize.cellWidth, height:cellSize.cellHeight)
        layout!.invalidateLayout()
            
        
    }
}

// MARK: - CollectionView Delegate and DataScource.

extension CourceCell {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell:CourceCollectionviewCell =  collectionView.dequeueReusableCell(for: indexPath)
 
        return cell
    }
    func collectionView(_ collectionView: UICollectionView,
                        layout collectionViewLayout: UICollectionViewLayout,
                        minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 6.0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout
        collectionViewLayout: UICollectionViewLayout,
                        minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 6.0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout,sizeForItemAt indexPath: IndexPath) -> CGSize {

     
       return CGSize(width: cellSize.cellWidth, height:cellSize.cellHeight)
    }
    
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        
        
    }
    
    
    
}





