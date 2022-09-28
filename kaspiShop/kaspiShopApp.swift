//
//  kaspiShopApp.swift
//  kaspiShop
//
//  Created by BeKZat Jarylqasyn on 23.09.2022.
//

import SwiftUI

@main
struct kaspiShopApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
