//
//  RepositoryManager.swift
//  GitOp
//
//  Created by Bruno Alves on 05/02/21.
//

import Foundation

/*protocol RepositoryManagerDelegate {
    func didUpdateItem(_ repositoryManager: RepositoryManager ,itemdata: RepositoryModel)
    func didFailWithError(error: Error)
}

struct RepositoryManager{
    let apiURL = "https://api.github.com/search/repositories?q=language:swift&page=#PAGE&per_page=30"
    var delegate: RepositoryManagerDelegate?
    
    func apiLive(){
        let apiURLString = "\(apiURL)"
        print("Teste")
        print(apiURLString)
        performRequest(with: apiURLString)
    }
    
    func performRequest(with apiURLString: String){
        
        if let url = URL(string: apiURLString){
            print("Teste2")
            print(url)
            let session = URLSession(configuration: .default)
            let task = session.dataTask(with: url) { (data, reponse, error) in
                if error != nil {
                    self.delegate?.didFailWithError(error: error!)
                    return
            }
            if let safeData = data {
                if let items = self.parseJSON(safeData){
                    self.delegate?.didUpdateItem(self,  itemdata: items)
                }
            }
        }
            task.resume()
        }
    }
    func parseJSON(_ repositoryData: Data) -> RepositoryModel? {
        let decoder = JSONDecoder()
        do{
        
           let decodeData = try decoder.decode(RepositoryData.self, from: repositoryData)
            let descripition = decodeData.owner[1].description
            let name = decodeData.items.name
            print(descripition)
            print(name)
            let items = RepositoryModel(name: name, descripition: descripition)
            return items
        }catch{
            delegate?.didFailWithError(error: error)
            return nil
        }
    }
}*/
class NewCell: ObservableObject, RandomAccessCollection {
    typealias Element = NewListItem
    
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
    func parseItemsFromData(data: Data) -> [NewListItem]{
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
    var uuid = UUID()
    
    var name: String
    var description: String
    
    init(name: String, description: String) {
        self.name = name
        self.description = description
        print(description)
        print(name)
    }
    
}
