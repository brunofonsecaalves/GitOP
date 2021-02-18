//
//  HomeTabBarController.swift
//  GitOp
//
//  Created by Bruno Alves on 09/02/21.
//

import UIKit

class HomeTabBarController: UITabBarController {
    
    var navController: UINavigationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let viewController = GitHubRepositoresViewController()
        viewController.view.backgroundColor = .red
        viewController.title = "GitHub Repositories"
        let imageSelected = UIImage.init(systemName: "tray.fill")
        let image = UIImage.init(systemName: "tray")
        let item = UITabBarItem( title: "", image: image, selectedImage: imageSelected)
        viewController.tabBarItem = item
        
        
        let viewController2 = UIViewController()
        viewController2.view.backgroundColor = .blue
        viewController2.title = "Repúblicas"
        let imageSelected2 = UIImage.init(systemName: "building.columns.fill")
        let image2 = UIImage.init(systemName: "building.columns")
        let item2 = UITabBarItem( title: "", image: image2, selectedImage: imageSelected2)
        viewController2.tabBarItem = item2
        
        let viewController3 = UIViewController()
        viewController3.view.backgroundColor = .green
        viewController3.title = "Adicionar"
        let imageSelected3 = UIImage.init(systemName: "plus.app.fill")
        let image3 = UIImage.init(systemName: "plus.app")
        let item3 = UITabBarItem( title: "", image: image3, selectedImage: imageSelected3)
        viewController3.tabBarItem = item3
        
        let button = UIButton()
        button.backgroundColor = .white
        button.setTitle("Tela 2", for: .normal)
        button.addTarget(self, action: #selector(pushScreen), for: .touchUpInside)
        button.center = viewController3.view.center
        button.frame.size = CGSize(width: 100, height: 50)
        viewController3.view.addSubview(button)
        
        self.viewControllers = [BaseNavigationController(rootViewController: viewController),
                                BaseNavigationController(rootViewController: viewController2),
                                BaseNavigationController(rootViewController: viewController3)]
        navController = viewController3.navigationController
    }
    
    @objc
    func pushScreen() {
        let vc4 = UIViewController()
        vc4.view.backgroundColor = .yellow
        navController?.pushViewController(vc4, animated: true)
    }
}
