//
//  TableView+Extensions.swift
//  GitOp
//
//  Created by Bruno Alves on 09/02/21.
//

import Foundation
import UIKit

extension UITableView{
    func registerCell(_ identifier: String){
        self.register(UINib(nibName: identifier, bundle: nil), forCellReuseIdentifier: identifier)    }
    
}
