//
//  Product.swift
//  kaspiShop
//
//  Created by Sanzhar Bekbolat on 30.11.2022.
//

import Foundation
struct Product: Identifiable, Hashable{
    var id : Int
    var name: String
    var image: String
    var price: Int
}
var ProductList = [Product(id: 34839, name:"Product1", image: "Image", price: 1345),
                   Product(id: 47593,name:"Product2", image: "Product1", price: 2483),
                   Product(id: 34939,name:"Product3", image: "Product2", price: 438),
                   Product(id: 29384,name:"Product4", image: "prodduct3", price: 535),
                   Product(id: 29384,name:"Product5", image: "Product4", price: 234),
                   Product(id: 19394,name:"Product6", image: "Product5", price: 593),
                   Product(id: 05843,name:"Product7", image: "Product6", price: 343),
                   Product(id: 59303,name:"Product8", image: "Product7", price: 544),
    ]
