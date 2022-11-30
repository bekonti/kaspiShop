//
//  GoodsRow.swift
//  kaspiShop
//
//  Created by Sanzhar Bekbolat on 30.11.2022.
//

import SwiftUI

struct GoodsRow: View {
    @EnvironmentObject var basketManager: BasketManager
    var good: Goods
    var body: some View {
        HStack(spacing: 20){
            
        }
        .padding(.horizontal)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}

struct GoodsRow_Previews: PreviewProvider {
    static var previews: some View {
        GoodsRow(good: Goods(id: 2838, title: "Charger", author: "Nead", description: "Dell charger", price: 500, brand: "Dell"))
            .environmentObject(BasketManager())
    }
}
