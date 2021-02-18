//
//  RepositoryModel.swift
//  GitOp
//
//  Created by Bruno Alves on 05/02/21.
//



import Foundation

struct RepositoryModel {
    let listItems: [ListItems]
}
struct ListItems {
    let name: String
    let descripition: String
    let avatarURL: String
}
