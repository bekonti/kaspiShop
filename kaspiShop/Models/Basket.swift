//
//  Basket.swift
//  kaspiShop
//
//  Created by Sanzhar Bekbolat on 30.11.2022.




//BasketButton

import SwiftUI

struct Basket: View {
    var numberOfProducts: Int
    var body: some View {
        ZStack(alignment: .topTrailing){
            Image("Cart")
                .resizable()
                .padding(.top, 5)
                .frame(width: 50, height: 50)
            
            
            if numberOfProducts > 0{
                Text("\(numberOfProducts)")
                    .font(.caption).bold()
                    .foregroundColor(.white)
                    .frame(width: 25, height: 25)
                    .background(Color(hue: 1.0, saturation: 0.89, brightness: 0.835))
                    .cornerRadius(50)
            }
        }
    }
}

struct Basket_Previews: PreviewProvider {
    static var previews: some View {
        Basket(numberOfProducts: 1)
    }
}
