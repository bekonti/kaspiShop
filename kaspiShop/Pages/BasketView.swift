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
            Text("Your basket is empty")
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
