//
//  BasketManaget.swift
//  kaspiShop
//
//  Created by Sanzhar Bekbolat on 30.11.2022.
//

import Foundation
class BasketManager: ObservableObject{
    @Published private(set) var products: [Product]=[]
    @Published private(set) var total: Int=0
    
    func addToBasket(product: Product){
        products.append(product)
        total += product.price
    }
    func removeFromBasket(product: Product){
        products = products.filter{$0.id != product.id}
        total -= product.price
    }
}
