//
//  NObject+Extensions.swift
//  GitOp
//
//  Created by Bruno Alves on 09/02/21.
//

import Foundation

extension NSObject{
    static var className: String {
        return String(describing: self)
    }
}
