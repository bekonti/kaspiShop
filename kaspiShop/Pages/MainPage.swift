//
//  MainPage.swift
//  kaspiShop
//
//  Created by Sanzhar Bekbolat on 08.10.2022.
//

import SwiftUI
import CleanUI
// save token for future activities
struct MainPage: View {
    //
    
    var columns = [GridItem(.adaptive(minimum: 160), spacing: 20)]
    @State private var path = NavigationPath()
    @State private var isPresented: Bool = false
    @StateObject var basketManager = BasketManager()
    @State var queryFilter=""
    @State var top = UIApplication.shared.windows.first?.safeAreaInsets.top
    var body: some View {
        NavigationStack(path: $path){
            VStack(spacing: 0){
                //Color("Color").edgesIgnoringSafeArea(.all)
                
                VStack(spacing: 22){
                    
                    //                NavigationStack{
                    HStack(spacing: 12){
                        Text("Kaspi Shop")
                            .font(.largeTitle)
                            .fontWeight(.heavy)
                            .foregroundColor(Color("Color1"))
                        Spacer(minLength: 0)
                        
                        
                        Button(action: {}){
                            Image(systemName: "magnifyingglass")
                                .foregroundColor(.black)
                                .padding(10)
                                .background(Color.black.opacity(0.1))
                                .clipShape(Circle())
                        }
                        Button(action: {
                            //                            NavigationView<Auth()>(content: Auth())
                            CUNavigation.pushToSwiftUiView(Auth())
                            
                            //                                NavigationLink(destination: Auth()){
                            //                                    Text("")
                            //                                        .foregroundColor(.black)
                            //                                        .background(Color.green)
                        }
                        ){
                            Image(systemName: "person.circle")
                                .resizable()
                                .frame(width: 25, height: 25)
                                .foregroundColor(.black)
                                .padding(10)
                                .background(Color.black.opacity(0.1))
                                .clipShape(Circle())
                        }
                        .toolbar{
                            NavigationLink {
                                BasketView()
                                    .environmentObject(basketManager)
                            } label:{
                                Basket(numberOfProducts: basketManager.products.count)

                            }
                        }
                        .toolbar{
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button("Add Product"){
                                    isPresented = true
                                }
                            }
                        }.sheet(isPresented: $isPresented){
                            AddProducts()
                        }
                    }
                }
                .padding(.horizontal)
                .padding(.top, top)
                .background(Color.white)
                
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 20){
                        ForEach(ProductList, id: \.id) {  product in
                            ProductView(product: product)
                                .environmentObject(basketManager)
                                .onTapGesture {
                                    CUNavigation.pushToSwiftUiView(ProductDetail(product: Product(id: product.id, name: product.name, image: product.image, price: product.price)))
                                }
                            
                            
                        }
                    }
                    .padding()
                }
            }
            
        }
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
            .environmentObject(BasketManager())
    }
}

