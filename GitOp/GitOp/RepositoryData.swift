//
//  RepositoryData.swift
//  GitOp
//
//  Created by Bruno Alves on 05/02/21.
//

import Foundation

struct RepositoryData: Codable {
    let items: Items
    let owner: [Owner]
    
}
struct Items: Codable {
    let name: String
}
struct Owner: Codable {
    let description: String
}
