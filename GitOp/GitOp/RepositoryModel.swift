//
//  RepositoryModel.swift
//  GitOp
//
//  Created by Bruno Alves on 05/02/21.
//



import Foundation

struct RepositoryModel {
    let name: String
    let descripition: String
}


/*class NewCell: ObservableObject, RandomAccessCollection {
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
        guard topLevel["incomplete_results"] as? String == "false" else{
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
    }
}*/
