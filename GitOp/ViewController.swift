//
//  ViewController.swift
//  GitOp
//
//  Created by Bruno Alves on 05/02/21.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
//        self.dismiss(animated: true) {
//            print("bloco assincrono")
//        }
//
        let b = Manager()
        b.loadApiItems()
        
        b.passData = { data in
            //self.content = data
            //tableView.reloadData()
        }
    }


}


class Manager {
    var passData: ((String)->Void)?
        
    func loadApiItems() {
        // chama a api
        // demora alsguns segundos e tem um retorno
        let data = "" //como se fosse o retorno
        passData?(data)
    }
    
}
