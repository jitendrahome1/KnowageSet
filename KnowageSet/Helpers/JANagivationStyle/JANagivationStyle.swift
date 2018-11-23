//
//  JANavigations.swift
//  JANavigation
//
//  Created by Jitendra Kumar Agarwal on 19/10/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import UIKit
enum Position:Int {
    case left = 0
    case right
    case center
}
protocol JANavigationStyle {
    func setTitle(title:String)
    func setTitle(title:String, BGColor:UIColor , tintColor:UIColor)
    func setTitlePosition(lableUI:LabelTitleUI,position:Position,BGColor:UIColor)
    func setBgImage(pImage:UIImage)
    func hideBackBarButtonItem()
    func hideNavigationBar(_ hide:Bool)
    func setTileSubTitle(_title:LabelTitleUI,  _subTitle:Subtitle)
}
protocol JANavigationBarButtonStyle {
    func addLeftBarButton(images:[UIImage], _CompletionHandler:didTapLeftCompletionAction)
    func addRightBarButton(images:[UIImage], _CompletionHandler:didTapRightCompletionAction)
}
fileprivate var leftButtonList         :   [UIBarButtonItem]  = []
fileprivate var rightButtonList        :   [UIBarButtonItem]  = []
typealias didTapLeftCompletionAction   = ((_ index: Int)->())?
typealias didTapRightCompletionAction  = ((_ index: Int)->())?
fileprivate var handlerLeftButton:didTapLeftCompletionAction
fileprivate var handlerRightButton:didTapLeftCompletionAction
typealias ProtocolConfirm = JANavigationStyle & JANavigationBarButtonStyle

//  Extation for Base view controller
extension BaseViewController: ProtocolConfirm {   // set your base view controller.
    
    func setTitle(title:String)  {
        self.navigationItem.title = title
        self.hideBackBarButtonItem()
    }
    func setTitle(title:String, BGColor:UIColor, tintColor:UIColor) {
        self.setTitle(title: title)
        navigationController?.navigationBar.barTintColor = BGColor
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: tintColor]
    }
    func setBgImage(pImage:UIImage) {
        navigationController?.navigationBar.barTintColor = .clear
        self.navigationController?.navigationBar.setBackgroundImage(pImage,for: .default)
    }
    
    func setTitlePosition(lableUI:LabelTitleUI,position:Position,BGColor:UIColor) {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text             =   lableUI.title
        titleLabel.textColor        =   lableUI.tittleColor
        titleLabel.font             =   lableUI.font
        navigationItem.titleView    =   titleLabel
        navigationController?.navigationBar.barTintColor = BGColor
        titleLabel.textAlignment        =  position == .center ? NSTextAlignment.center :  (position.rawValue == 0 ? NSTextAlignment.left :NSTextAlignment.right)
    }
    func setTileSubTitle(_title:LabelTitleUI,  _subTitle:Subtitle) {
      let labelTitle                =        UILabel()
        labelTitle.text             =       _title.title
        labelTitle.textColor        =       _title.tittleColor
        labelTitle.font             =       _title.font
        let subTitleLabel           =       UILabel()
        subTitleLabel.text          =       _subTitle.subTitle!.title
        subTitleLabel.textColor     =       _subTitle.subTitle!.tittleColor
        subTitleLabel.font          =       _subTitle.subTitle!.font
        let contentStackView        =       UIStackView()
        contentStackView.axis       =      .vertical
        contentStackView.alignment  =      .center
        contentStackView.distribution  = .fill
        contentStackView.spacing = 5
        contentStackView.addArrangedSubview(labelTitle)
        contentStackView.addArrangedSubview(subTitleLabel)
        self.navigationItem.titleView = contentStackView
        
    }
    
    func hideBackBarButtonItem() {
     self.navigationItem.setHidesBackButton(true, animated:true)
    }
    func hideNavigationBar(_ hide:Bool) {
       self.navigationController?.isNavigationBarHidden = hide
    }
    // Set Left Bar buttons
    func addLeftBarButton(images:[UIImage],_CompletionHandler:didTapLeftCompletionAction) {
        leftButtonList.removeAll()
        for (index, element) in images.enumerated() {
            let button = UIBarButtonItem(image: element, style:.plain, target:self, action:#selector(UIViewController.didTapLeftButtonClicked(_:)))
            leftButtonList.append(button)
            button.tag = index
        }
        handlerLeftButton = _CompletionHandler
        navigationItem.leftBarButtonItems = leftButtonList
    }
    
    // Set Right bar buttons
    func addRightBarButton(images:[UIImage],_CompletionHandler:didTapRightCompletionAction) {
        rightButtonList.removeAll()
        for (index, element) in images.enumerated() {
            let button = UIBarButtonItem(image: element, style:.plain, target:self, action:#selector(UIViewController.didTapRightButtonClicked(_:)))
            rightButtonList.append(button)
            button.tag = index
        }
        handlerRightButton = _CompletionHandler
        navigationItem.rightBarButtonItems = rightButtonList
    }
}

// Extation For Base Table View
extension BaseTableViewController: ProtocolConfirm {
    func setTitle(title:String)  {
        self.navigationItem.title = title
        self.hideBackBarButtonItem()
    }
    func setTitle(title:String, BGColor:UIColor, tintColor:UIColor) {
        self.setTitle(title: title)
        navigationController?.navigationBar.barTintColor = BGColor
        navigationController?.navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor: tintColor]
    }
    func setBgImage(pImage:UIImage) {
        navigationController?.navigationBar.barTintColor = .clear
        self.navigationController?.navigationBar.setBackgroundImage(pImage,for: .default)
    }
    
    func setTitlePosition(lableUI:LabelTitleUI,position:Position,BGColor:UIColor) {
        let titleLabel = UILabel(frame: CGRect(x: 0, y: 0, width: view.frame.width - 32, height: view.frame.height))
        titleLabel.text             =   lableUI.title
        titleLabel.textColor        =   lableUI.tittleColor
        titleLabel.font             =   lableUI.font
        navigationItem.titleView    =   titleLabel
        navigationController?.navigationBar.barTintColor = BGColor
        titleLabel.textAlignment        =  position == .center ? NSTextAlignment.center :  (position.rawValue == 0 ? NSTextAlignment.left :NSTextAlignment.right)
    }
    func setTileSubTitle(_title:LabelTitleUI,  _subTitle:Subtitle) {
        let labelTitle                =        UILabel()
        labelTitle.text             =       _title.title
        labelTitle.textColor        =       _title.tittleColor
        labelTitle.font             =       _title.font
        let subTitleLabel           =       UILabel()
        subTitleLabel.text          =       _subTitle.subTitle!.title
        subTitleLabel.textColor     =       _subTitle.subTitle!.tittleColor
        subTitleLabel.font          =       _subTitle.subTitle!.font
        let contentStackView        =       UIStackView()
        contentStackView.axis       =      .vertical
        contentStackView.alignment  =      .center
        contentStackView.distribution  = .fill
        contentStackView.spacing = 5
        contentStackView.addArrangedSubview(labelTitle)
        contentStackView.addArrangedSubview(subTitleLabel)
        self.navigationItem.titleView = contentStackView
        
    }
    
    func hideBackBarButtonItem() {
        self.navigationItem.setHidesBackButton(true, animated:true)
    }
    func hideNavigationBar(_ hide:Bool) {
        self.navigationController?.isNavigationBarHidden = hide
    }
    // Set Left Bar buttons
    func addLeftBarButton(images:[UIImage],_CompletionHandler:didTapLeftCompletionAction) {
        leftButtonList.removeAll()
        for (index, element) in images.enumerated() {
            let button = UIBarButtonItem(image: element, style:.plain, target:self, action:#selector(UIViewController.didTapLeftButtonClicked(_:)))
            leftButtonList.append(button)
            button.tag = index
        }
        handlerLeftButton = _CompletionHandler
        navigationItem.leftBarButtonItems = leftButtonList
    }
    
    // Set Right bar buttons
    func addRightBarButton(images:[UIImage],_CompletionHandler:didTapRightCompletionAction) {
        rightButtonList.removeAll()
        for (index, element) in images.enumerated() {
            let button = UIBarButtonItem(image: element, style:.plain, target:self, action:#selector(UIViewController.didTapRightButtonClicked(_:)))
            rightButtonList.append(button)
            button.tag = index
        }
        handlerRightButton = _CompletionHandler
        navigationItem.rightBarButtonItems = rightButtonList
    }
}

extension UIViewController {
    @objc func didTapLeftButtonClicked(_ button:UIBarButtonItem!){
        handlerLeftButton!(button.tag)
    }
    @objc func didTapRightButtonClicked(_ button:UIBarButtonItem!){
        handlerRightButton!(button.tag)
    }
}


