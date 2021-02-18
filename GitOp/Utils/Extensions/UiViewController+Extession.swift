//
//  UiViewController+Extession.swift
//  GitOp
//
//  Created by Bruno Alves on 11/02/21.
//

import Foundation
import UIKit

extension UIViewController {
  func showAlertCommon(title: String, message: String?, handler: (() -> Void)?) {
    let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
    let btnOk = UIAlertAction(title: "Ok", style: .default, handler: { _ in
      handler?()
    })
    alert.addAction(btnOk)
    self.present(alert, animated: true, completion: nil)
  }
}
