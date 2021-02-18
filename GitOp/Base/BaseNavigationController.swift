//
//  BaseNavigationController.swift
//  GitOp
//
//  Created by Bruno Alves on 09/02/21.
//

import UIKit

class BaseNavigationController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.isTranslucent = false
        self.navigationBar.barTintColor = .gray
        self.navigationBar.tintColor = .white
        
        
        
        //Perguntar sobre a função:
        self.navigationBar.shadowImage = UIImage()
    }
    
    func searchIcon() {
        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
