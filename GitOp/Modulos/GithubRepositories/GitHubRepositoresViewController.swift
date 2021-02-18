//
//  GitHubRepositoresViewController.swift
//  GitOp
//
//  Created by Bruno Alves on 09/02/21.
//
import Kingfisher
import UIKit

class GitHubRepositoresViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var informationCell = InformationCell()
    var repository = ListRepositoryService()
    var repositoryData: Welcome?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = self
        tableView.registerCell(InformationCell.cellIdentifier)
        repository.fetchRepositories { (response) in
            DispatchQueue.main.async {
                switch response{
                case .success(let data):
                    self.repositoryData = data
                    self.tableView.reloadData()
                    
                    
                case .failure:
                    
                    self.showAlertCommon(title: "Error", message: "Tente novamente mais tarde", handler: nil)
                }
                
            }
        }
    }

}

//MARK: - UITableViewDataSource
extension GitHubRepositoresViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return repositoryData?.items.count ?? 0
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: InformationCell.cellIdentifier, for: indexPath) as? InformationCell
        let data = repositoryData?.items[indexPath.row]
        cell?.nameLabel.text = data?.name ?? "vazio"
        cell?.descriptionLabel.text = data?.itemDescription ?? "descricao vazia "
        let url = URL(string: data?.owner.avatarURL ?? "Url Vazio")
        cell?.avatarImage.kf.setImage(with: url)
        return cell ?? UITableViewCell()
    }
}
