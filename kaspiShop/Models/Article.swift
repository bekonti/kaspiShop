//
//  Article.swift
//  kaspiShop
//
//  Created by BeKZat Jarylqasyn on 04.10.2022.
//

import Foundation

struct Article: Identifiable, Hashable {
    let id = UUID()
    
    let title: String
    let author: String
    
}

extension Article {
    static let examples: [Article] = [
        .init(title: "Dad Jokes", author: "Author"),
        .init(title: "Jokes", author: "Joker"),
        .init(title: "Dad 2", author: "Author 2")
    ]
    
}
