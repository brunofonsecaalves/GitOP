//
//  RepositoryManager.swift
//  GitOp
//
//  Created by Bruno Alves on 05/02/21.
//

import Foundation
import UIKit

enum ServiceError: Error {
    case invalidURL
    case invalidData
    case parseError(message: String)
    case apiError
}

protocol BaseService {
    var apiURL: String { get }
}

protocol ListRepositoryServiceInterface: BaseService {
    func fetchRepositories(completion: @escaping (Result<Welcome, ServiceError>) -> Void)
}


class ListRepositoryService: ListRepositoryServiceInterface {
    var apiURL: String

    init(apiURL: String = ApiURL.apiGit) {
        self.apiURL = apiURL
    }
    
    func fetchRepositories(completion: @escaping (Result<Welcome, ServiceError>) -> Void) {
        guard let api = URL(string: self.apiURL) else {
            completion(.failure(.invalidURL))
            return
        }
        
        let task = URLSession.shared.dataTask(with: api) { (data, response, error) in
            guard error == nil else {
                completion(.failure(.apiError))
                return
            }
            guard let jsonData = data else {
                completion(.failure(.invalidData))
                return
            }
            
            do {
                let decoder = JSONDecoder()
                let decoded = try decoder.decode(Welcome.self, from: jsonData)
                
                completion(.success(decoded))
            } catch let error {
                completion(.failure(.parseError(message: error.localizedDescription)))
            }
        }
        
        task.resume()
    }
}







/*class NewCell: ObservableObject, RandomAccessCollection {

    @Published var newsListItems = [NewListItem]()
    var startIndex: Int { newsListItems.startIndex }
    var endIndex: Int { newsListItems.endIndex }
    
    var urlBase = "https://api.github.com/search/repositories?q=language:swift&page=#PAGE&per_page=30"
    
    init() {
        loadMoreItems()
    }
    subscript(position: Int) -> NewListItem {
        return newsListItems[position]
    }
    
    func loadMoreItems() {
        let url = URL(string: urlBase)!
        let task = URLSession.shared.dataTask(with: url, completionHandler: parseItemFromResponse(data:response:error:))
        task.resume()
    }
    func parseItemFromResponse(data: Data?, response: URLResponse?, error: Error?) {
        guard error == nil else {
            print("Error: \(error!)")
            return
        }
        guard let data = data else{
            print("No Data Found")
            return
        }
        let newItems = parseItemsFromData(data: data)
        
        DispatchQueue.main.async {
            self.newsListItems.append(contentsOf: newItems)
        }
    }
    func parseItemsFromData(data: Data) -> [NewListItem] {
        
        
        let jsonObject = try! JSONSerialization.jsonObject(with: data)
        let topLevel = jsonObject as! [ String: Any ]
        guard topLevel["incomplete_results"] as? Bool == false else{
            print("Inconplete Results returned true")
            return []
        }
        guard let jsonItems = topLevel["items"] as? [[String: Any]] else {
            print("No items Found")
            return []
        }
        
        var newItems = [NewListItem]()
        for jsonItem in jsonItems {
            guard let description = jsonItem["description"] as? String else {
                continue
            }
            guard let name = jsonItem["name"] as? String else {
                continue
            }
            newItems.append(NewListItem(name: name, description: description))
        }

        return newItems
    }
}
class NewListItem: Identifiable{
    
    var name: String
    var description: String
    
    init(name: String, description: String) {
        self.name = name
        self.description = description
        print(description)
        print(name)
    }
    
}
*/
