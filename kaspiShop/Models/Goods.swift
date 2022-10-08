//
//  Goods.swift
//  kaspiShop
//
//  Created by Sanzhar Bekbolat on 08.10.2022.
//

import Foundation

struct Goods: Identifiable, Hashable {
    let id = UUID()
    
    let title: String
    let author: String
    
}

extension Goods{
    static let examples: [Goods] = [
        .init(title: "Apple iphone 13 ", author: "Mark"),
        .init(title: "Laptop", author: "Jake"),
        
    ]
}
