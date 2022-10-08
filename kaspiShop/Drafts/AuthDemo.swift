////
////  AuthDemo.swift
////  kaspiShop
////
////  Created by BeKZat Jarylqasyn on 05.10.2022.
////
//
//
//// как черновик тұра берсін)
//import SwiftUI
//import Auth0
//
//struct AuthDemo: View {
//    @State private var confirmationMessage = ""
//    @State private var isAuthenticated = false
//    var body: some View {
//        if isAuthenticated {
//            VStack{
//                Text("Logged in")
//                    .padding()
//                Button("Logged out"){
//                    logout()
//                }
//                    .padding()
//            }
//        }else{
//            VStack{
//                Text("LoginDemo")
//
//                Button("Login"){
//                    Task{
//                        await login()
//                    }
//                }.padding()
//
//            }
//        }
//
//
//    }
//}
//
//struct AuthDemo_Previews: PreviewProvider {
//    static var previews: some View {
//        AuthDemo()
//    }
//}
//
//extension AuthDemo{
//    func login() async{
//        let user  = User()
//        print("login: \(user.login) pswd: \(user.password)")
//        guard let encoded = try? JSONEncoder().encode(user) else{
//            print("Fail encoded")
//            return
//        }
//
//        let url = URL(string: "https://admin-test.basel.ws/esbd/rest/v2/services/esbd_RestApiService/user")!
//        var request = URLRequest(url: url)
//        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
//        request.httpMethod = "POST"
////        request.httpBody = Data(encoded)
//
//        do{
//            let(data, _) = try await URLSession.shared.upload(for: request, from: encoded)
//
//            let decoded = try JSONDecoder().decode(User.self, from: data)
//            confirmationMessage = "decoded \(decoded.password)"
//            isAuthenticated = true
//            print(confirmationMessage)
//        }catch {
//            print("Checkout failed.")
//        }
////        Auth0()
////            .webAuth()
////            .start { result in
////                switch result{
////                case .failure(let error):
////                    print("Failed with: \(error)")
////
////                case .success(let credentioal):
////                    self.isAuthenticated = true
////                    print("Credentials: \(credentioal)")
////                    print("token: \(credentioal.idToken)")
////                }
////            }
//    }
//
//    func logout(){
//        isAuthenticated = false
//    }
//}
