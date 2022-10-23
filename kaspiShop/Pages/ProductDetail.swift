//
//  ProductDetail.swift
//  kaspiShop
//
//  Created by Sanzhar Bekbolat on 23.10.2022.
//

import SwiftUI

struct ProductDetail: View {
    var product : Goods

    var body: some View {
        Text(product.title)
    }
}


//struct ProductDetail_Previews: PreviewProvider {
    //static var previews: some View {
//        ProductDetail(product: Goods.examples.first)
//    }
//}

