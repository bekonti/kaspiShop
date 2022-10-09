//
//  User.swift
//  kaspiShop
//
//  Created by BeKZat Jarylqasyn on 05.10.2022.
//

import SwiftUI

class User: ObservableObject, Codable {
    enum CodingKeys: CodingKey{
        case login, password, authorizationToken ,access_token, grant_type
    }
    
    @Published var login:String=""
    @Published var password:String=""
    @Published var authorizationToken:String = ""
    init(){}
//    init(authorizationToken: String){
//        self.authorizationToken = authorizationToken
//    }
//
//    init(login : String, password : String){
//        self.login = login
//        self.password = password
////        self.authorizationToken = authorizationToken
//    }
    
    init(login : String, password : String){
        self.login = login
        self.password = password
        self.authorizationToken = authorizationToken
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)

    //           try container.encode("password", forKey: .grant_type)
        try container.encode(login, forKey: .login)
        try container.encode(password, forKey: .password)
    }

    
    required init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        authorizationToken = try container.decode(String.self, forKey: .authorizationToken)
    }
}
