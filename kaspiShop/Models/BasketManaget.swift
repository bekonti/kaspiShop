//
//  BasketManaget.swift
//  kaspiShop
//
//  Created by Sanzhar Bekbolat on 30.11.2022.
//

import Foundation
class BasketManager: ObservableObject{
    @Published private(set) var products: [Goods]=[]
    @Published private(set) var total: Double=0
    
    func addToBasket(product: Goods){
        products.append(product)
        total += product.price
    }
    func removeFromBasket(product: Goods){
        products = products.filter{$0.id != product.id}
        total -= product.price
    }
}
