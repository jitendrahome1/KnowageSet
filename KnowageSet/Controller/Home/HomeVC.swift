//
//  HomeVC.swift
//  KnowageSet
//
//  Created by Jitendra Kumar Agarwal on 23/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import UIKit

class HomeVC: BaseViewController, UITableViewDelegate, UITableViewDataSource {
  

    //@IBOutlet var aView: JAPageControl!
    private let cellIdentifier = "SliderCell"
    @IBOutlet var tblHome: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.blue
       // self.title = "Home"
         //NavigationHelper.helper.navController.title = "home"
    }
    override func initialSetup() {
        self.setTitle(title: "Home")
        //NavigationHelper.helper.navController.title = "home"
    }
  
    
}
// MARK:- Table view Delegate and Datascource
extension HomeVC {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       return 1
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellIdentifier) as! SliderCell
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 202
    }
    
}
