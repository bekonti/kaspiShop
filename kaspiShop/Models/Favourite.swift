//
//  Favourite.swift
//  kaspiShop
//
//  Created by BeKZat Jarylqasyn on 23.11.2022.
//

import Foundation

class Favorites: ObservableObject{
    private var resorts: Set<Int>
    private let saveKey = "Favorites"
    private var favorProduct: Set<Product>
    
    
    init() {
        //load saved items
        resorts=[]
        favorProduct=[]
    }

    func contains(_ resort: Product) -> Bool {
        resorts.contains(resort.id)
    }
    
    func add(_ resort: Product){
        objectWillChange.send()
        resorts.insert(resort.id)
        save()
    }
    
    func remove(_ resort: Product){
        objectWillChange.send()
        resorts.remove(resort.id)
        save()
    }
    
    func save(){
        // writes our data
    }
    
}

