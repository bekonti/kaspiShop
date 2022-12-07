//
//  AddProducts.swift
//  kaspiShop
//
//  Created by Sanzhar Bekbolat on 06.12.2022.
//

import SwiftUI

struct AddProducts: View {
    @State private var title: String = ""
    @State private var price: Double = 0.0
    @State private var description: String = ""
    @State private var imageUrl: String = ""
    @State private var errorMessage: String = ""
    var body: some View {
        Form{
            TextField("Enter title", text: $title)
            TextField("Enter price", value: $price, format: .number)
            TextField("Enter description", text: $description)
            
        }
    }
}

struct AddProducts_Previews: PreviewProvider {
    static var previews: some View {
        AddProducts()
    }
}
