//
//  Goods.swift
//  kaspiShop
//
//  Created by Sanzhar Bekbolat on 08.10.2022.
//

import Foundation

struct Goods: Identifiable, Hashable {
    enum CodingKeys: CodingKey{
        case id, name, description, price, manufacturer, author
    }
    let id: Int
    
    let title: String
    let author: String
    let description: String
    let price: Double
    let brand: String
  
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

    //           try container.encode("password", forKey: .grant_type)
        try container.encode(title, forKey: .name)
        try container.encode(author, forKey: .author)
        try container.encode(id, forKey: .id)
        try container.encode(brand, forKey: .manufacturer)
        try container.encode(description, forKey: .description)
        try container.encode(price, forKey: .price)
    }
}



//extension Goods{
//    static let examples: [Goods] = [
//        .init(title: "Apple iphone 13 ", author: "Mark"),
//        .init(title: "Laptop", author: "Jake"),
//
//    ]
//}
