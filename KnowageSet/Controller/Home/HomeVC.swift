//
//  HomeVC.swift
//  KnowageSet
//
//  Created by Jitendra Kumar Agarwal on 23/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import UIKit

class HomeVC: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet var tblHome: UITableView!
    private let model = HomeViewModel()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
        self.registerCustomCell()
    }
    override func initialSetup() {
        self.setTitle(title: HOMEVC_TITLE, BGColor: .black, tintColor: .white)
        
    }
    private func registerCustomCell() {
        self.tblHome.register(SliderCell.self)
        self.tblHome.register(AdsenseCell.self)
        
    }
}
// MARK:- Table view Delegate and Datascource
extension HomeVC {
    func numberOfSections(in tableView: UITableView) -> Int {
        return model.numberOfSection
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return model.numberOfRowInSection(section: section)
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = UITableViewCell()
        switch indexPath.section {
        case 0:
            let cell:SliderCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            return cell
        case 1:
            let cell:AdsenseCell = tableView.dequeueReusableCell(forIndexPath: indexPath)
            return cell
        default: break
            
        }
        return cell
        
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(model.heightForRow(section: indexPath.section))
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        if let headerView   =   HomeSectionHeader.instantiateFromNib() {
            return headerView
        }
        return nil
        
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        
        return CGFloat(model.heightForHeader(section: section))
    }
    
}


