//
//  RespositoryViewController.swift
//  GitOp
//
//  Created by Bruno Alves on 05/02/21.
//

import Foundation
import UIKit

class RespositoryViewController: UIViewController{
    
    @IBOutlet weak var tableView: UITableView!
    
    //var repositoryManager = RepositoryManager()
    var newCell = NewCell()
    var bodyCell: [RepositoryCell] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        
        //repositoryManager.delegate = self
        DispatchQueue.main.asyncAfter(deadline: .now()+10) {
            self.tableView.reloadData()
        }
    }
}
//MARK: - UITableViewDataSource
extension RespositoryViewController: UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return newCell.newsListItems.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIdentifier, for: indexPath)
        cell.textLabel?.text = newCell.newsListItems[indexPath.row].name
        print(newCell.newsListItems[indexPath.row].name)
        return cell
    }
}
