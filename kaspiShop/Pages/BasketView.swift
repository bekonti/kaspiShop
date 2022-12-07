//
//  BasketView.swift
//  kaspiShop
//
//  Created by Sanzhar Bekbolat on 30.11.2022.
//

import SwiftUI

struct BasketView: View {
    @EnvironmentObject var basketManager: BasketManager
    var body: some View {
        ScrollView{
            if(basketManager.products.count>0){
                ForEach(basketManager.products, id: \.id){
                    product in
                    ProductRow(product: product)
                }
                HStack{
                    Text("You basket total is ")
                    Spacer()
                    Text("$\(basketManager.total).00")
                        .bold()
                }
                .padding()
                
                PaymentButton(action: {})
                    .padding()
            }else{
                Text("Your basket is empty!")
            }
        }
        .navigationTitle(Text("My cart"))
        .padding(.top)
    }
}

struct BasketView_Previews: PreviewProvider {
    static var previews: some View {
        BasketView()
            .environmentObject(BasketManager())
    }
}
