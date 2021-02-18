//
//  RepositoryData.swift
//  GitOp
//
//  Created by Bruno Alves on 05/02/21.
//

import Foundation

// MARK: - Welcome
struct Welcome: Codable {
    let totalCount: Int?
    let incompleteResults: Bool?
    let items: [Item]

    enum CodingKeys: String, CodingKey {
        case totalCount = "total_count"
        case incompleteResults = "incomplete_results"
        case items
    }
}

// MARK: - Item
struct Item: Codable {
    let id: Int?
    let nodeID, name, fullName: String?
    let itemPrivate: Bool?
    let owner: Owner
    let htmlURL: String?
    let itemDescription: String?
    

    enum CodingKeys: String, CodingKey {
        case id
        case nodeID = "node_id"
        case name
        case fullName = "full_name"
        case itemPrivate = "private"
        case owner
        case htmlURL = "html_url"
        case itemDescription = "description"

    }
    
}

// MARK: - Owner
struct Owner: Codable {
    let avatarURL: String?


    enum CodingKeys: String, CodingKey {

        case avatarURL = "avatar_url"
     
    }
}


// MARK: - Encode/decode helpers

