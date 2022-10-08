//
//  MainPage.swift
//  kaspiShop
//
//  Created by Sanzhar Bekbolat on 08.10.2022.
//

import SwiftUI

struct MainPage: View {
    @State var queryFilter=""
    @State var top = UIApplication.shared.windows.first?.safeAreaInsets.top
    var body: some View {
        VStack(spacing: 0){
            //Color("Color").edgesIgnoringSafeArea(.all)

            VStack(spacing: 22){
                
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
                    
                    Button(action: {}){
                        Image(systemName: "person.circle" )
                            .resizable()
                            .frame(width: 25, height: 25)
                            .foregroundColor(.black)
                            .padding(10)
                            .background(Color.black.opacity(0.1))
                            .clipShape(Circle())
                    }
                }
            }
                .padding(.horizontal)
                .padding(.top, top)
                .background(Color.white)
            
            ScrollView(.vertical, showsIndicators: false){
                VStack(spacing:0){
                    VStack(spacing:15){
                        ForEach(Goods.examples, id:\.self){ i in
                            
                            
                            VStack(spacing: 10){
                                HStack(spacing: 10){
                                    Image("logo")
                                        .resizable()
                                        .frame(width: 35, height: 35)
                                        .clipShape(Circle())
                                    VStack(alignment: .leading, spacing: 4){
                                        Text(i.title)
                                            .font(.title2)
                                            .fontWeight(.semibold)
                                            .foregroundColor(.black)
                                        
                                        Text("\(45) Min")
                                    }
                                    Spacer(minLength: 0)
                                }
                                Text(i.author)
                                
                            }
                            .padding()
                            .background(Color.white)
                            
                            
                        }
                    }
                }
                .padding(.top)
                
            }
            .background(Color.black.opacity(0.07))
            .ignoresSafeArea()
            
        }
        
    }
}

struct MainPage_Previews: PreviewProvider {
    static var previews: some View {
        MainPage()
    }
}
