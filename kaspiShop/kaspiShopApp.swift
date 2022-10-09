//
//  kaspiShopApp.swift
//  kaspiShop
//
//  Created by BeKZat Jarylqasyn on 23.09.2022.
//

import SwiftUI
//import Firebase

@main
struct kaspiShopApp: App {
    
//    init(){
//        FirebaseApp.configure()
//    }
    
    let persistenceController = PersistenceController.shared
// MARK: main where is body started
    var body: some Scene {
        WindowGroup {
            MainPage()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
