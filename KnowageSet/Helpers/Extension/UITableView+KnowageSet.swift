//
//  UITableView+KnowageSet.swift
//  KnowageSet
//
//  Created by Jitendra Kumar Agarwal on 28/11/18.
//  Copyright © 2018 Jitendra Kumar Agarwal. All rights reserved.
//

import Foundation
import UIKit
extension UITableView {
    func register<T:UITableViewCell>(_: T.Type) where T: ReusableView, T: NibLoadableView {
        
        let bundle = Bundle(for: T.self)
        let nib = UINib(nibName: T.nibName, bundle: bundle)
        self.register(nib, forCellReuseIdentifier: T.defaultReuseIdentifier)
        
       
     
    }
    func registerClass<T:UITableViewCell>(_: T.Type) where T: ReusableView{
        self.register(T.self, forCellReuseIdentifier:  T.defaultReuseIdentifier)
    }
    
    func dequeueReusableCell<T:UITableViewCell>(forIndexPath indexPath: IndexPath) -> T where T: ReusableView {
        guard let cell = self.dequeueReusableCell(withIdentifier: T.defaultReuseIdentifier, for: indexPath) as? T else {
            fatalError("Could not dequeue cell with identifier: \(T.defaultReuseIdentifier)")
        }
        return cell
    }
}
protocol ReusableView: class {
    static var defaultReuseIdentifier: String { get }
}

protocol NibLoadableView: class {
    static var nibName: String { get }
}

extension ReusableView where Self: UIView {
    static var defaultReuseIdentifier: String {
        return String(describing: Self.self)
    }
}
extension NibLoadableView where Self: UIView {
    static var nibName: String {
        return String(describing: Self.self)
    }
}




