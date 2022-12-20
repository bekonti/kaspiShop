//
//  ProductDetail.swift
//  kaspiShop
//
//  Created by Sanzhar Bekbolat on 23.10.2022.
//

import SwiftUI

struct ProductDetail: View {
    var product : Product
    @State var review: String = ""
    @State var rating: Int = 0
    @State var showingAlert = false
    @State var readyForSend = false
    
    @StateObject var favorites = Favorites()
    
        var body: some View {
            
                    NavigationView {
                        ScrollView{
                            VStack {
                                HStack{
                                    Image("electronics")
                                        .resizable()
                                        .frame(width: 350, height: 350)
                                        .padding()
                                    
                                }
                                
                                Button(favorites.contains(product) ?"Remove from wish list": "Add to wish list",
                                       action: {
                                    if favorites.contains(product) {
                                        favorites.remove(product)
                                    }
                                    else {
                                        favorites.add(product)
                                    }
                                }).buttonStyle(.borderedProminent)
                                    .padding()
                                
                                Text("brand: "+product.image)
                                Text("description: "+product.name)
                                Text("price: "+"\(product.price)$")
                                Text("author: " + "\(product.id)#")
                                // Rating for product
                                VStack{
                                    Section {
                                        TextField("Enter your comment ", text: $review)
                                            .padding()
                                        
                                        RatingView(rating: rating)
                                    } header: {
                                        Text("Write a review")
                                    }
                                    Button("Send review" ) {
                                        showingAlert = true
                                    }
                                    .padding()
                                    .background(Color.blue)
                                    .disabled(review.count == 0)
                                    .alert("Your review sent", isPresented: $showingAlert){
                                        Button("OK", role: .cancel) {}
                                    }
                                }
                                
                            }
                        }

                    }.navigationBarTitle(product.name)
            
            }
        
    }


//struct ProductDetail_Previews: PreviewProvider {
    //static var previews: some View {
//        ProductDetail(product: Goods.examples.first)
//    }
//}

