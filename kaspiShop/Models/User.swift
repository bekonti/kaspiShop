//
//  User.swift
//  kaspiShop
//
//  Created by BeKZat Jarylqasyn on 05.10.2022.
//

import SwiftUI

class User: ObservableObject, Codable {
    enum CodingKeys: CodingKey{
        case login, password, authorizationToken
    }
    
    @Published var login = "admin"
    @Published var password = "8vRwN$g,JyKxd<gR"
    @Published var authorizationToken = ""
    
    init() { }

       func encode(to encoder: Encoder) throws {
           var container = encoder.container(keyedBy: CodingKeys.self)

           try container.encode(login, forKey: .login)
           try container.encode(password, forKey: .password)
       }

       required init(from decoder: Decoder) throws {
           let container = try decoder.container(keyedBy: CodingKeys.self)

           authorizationToken = try container.decode(String.self, forKey: .authorizationToken)

       }
}
