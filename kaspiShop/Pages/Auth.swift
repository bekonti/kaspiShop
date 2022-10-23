//
//  Auth.swift
//  kaspiShop
//
//  Created by BeKZat Jarylqasyn on 05.10.2022.
//

import SwiftUI
import CleanUI

struct Auth: View, Hashable {
    var body: some View {
    
        Home()
        //for light status bar...
            .preferredColorScheme(.dark)
    }
}

struct Auth_Previews: PreviewProvider {
    static var previews: some View {
        Auth()
    }
}

struct Home : View {
    
    @State var index = 0
    
    var body: some View {
        
        
        GeometryReader {_ in
            
            VStack{
                Capsule()
                    .fill(Color.clear)
                    .frame(height: 100)
                    
                Image("logo")
                    .resizable()
                    .frame(width: 150, height: 130)
                
                ZStack{
                    SignUp(index: self.$index)
                        .zIndex(Double(self.index))
                    
                    Login(index: self.$index)
                }
                
            }
        }
        .background(Color("Color"))
        .edgesIgnoringSafeArea(.all)
    }
}

struct CShape : Shape {
    func path(in rect: CGRect) -> Path {
        return Path{path in
            
            path.move(to: CGPoint(x: rect.width, y: 100))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
        }
    }
}

struct CShape1 : Shape {
    func path(in rect: CGRect) -> Path {
        return Path{path in
            
            path.move(to: CGPoint(x: 0, y: 100))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
        }
    }
}

//Login Page
struct Login : View{
    
    @State var email = ""
    @State var pass = ""
    @State private var confirmationMessage = ""
    @State private var isAuthenticated = false
    @State private var authorizationToken = ""
    
    @Binding var index : Int
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack{
                HStack{
                    VStack(spacing: 10){
                        Text("Login")
                            .foregroundColor(self.index == 0 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 0 ? Color.blue : Color.clear)
                            .frame(width: 100,height: 5)
                        }
                    Spacer(minLength: 0)
                    
                }
                .padding(.top, 30)
                
                VStack{
                    HStack(spacing: 15) {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color("Color1"))
                        TextField("Username", text: self.$email)
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                VStack{
                    HStack(spacing: 15) {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Color1"))
                        SecureField("Password", text: self.$pass)
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                HStack{
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        
                    }){
                        Text("Forget Password?")
                            .foregroundColor(Color.white.opacity(0.6))
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
            }
            .padding()
            .padding(.bottom, 65)
            .background(Color("Color2"))
            .clipShape(CShape())
            .contentShape(CShape())
            .cornerRadius(35)
            .padding(.horizontal, 20)
            .shadow(color:Color.black.opacity(0.3), radius: 5, x: 0,y: -5)
            .onTapGesture {
                self.index = 0
            }
            
            // Button...
            Button(action: {
                
                Task {
                    await login()
                    
                    if isAuthenticated {
                        CUNavigation.pop()
                    }
                }
                }
            ) {
                Text("LOGIN")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color("Color1"))
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
            }
            .offset(y:25)
            .opacity(self.index == 0 ? 1 : 0)
        }
    }

}

extension Login {
    @MainActor func login() async{
        let user  = User(login: email, password: pass)
        print("login: \(user.login) pswd: \(user.password)")
        guard let encoded = try? JSONEncoder().encode(user) else{
            print("Fail encoded")
            return
        }

        let url = URL(string:
        "http://localhost:8080/user"
//        "http://192.168.1.100:8080/user"
            )!
        var request = URLRequest(url: url)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "POST"
        request.httpBody = Data(encoded)

        do{
            let(data, _) = try await URLSession.shared.upload(for: request, from: encoded)

            let decoded = try JSONDecoder().decode(User.self, from: data)
            authorizationToken = decoded.authorizationToken
            confirmationMessage = "decoded \(self.authorizationToken)" //+ l:\(decoded.login) p:\(decoded.password)"
            isAuthenticated = true
            print(confirmationMessage)
//            CUNavigation.pushToSwiftUiView(MainPage())
//            self.navigationx
        }catch {
            print("Checkout failed.")
        }
//        Auth0()
//            .webAuth()
//            .start { result in
//                switch result{
//                case .failure(let error):
//                    print("Failed with: \(error)")
//
//                case .success(let credentioal):
//                    self.isAuthenticated = true
//                    print("Credentials: \(credentioal)")
//                    print("token: \(credentioal.idToken)")
//                }
//            }
    }

    func logout(){
        isAuthenticated = false
    }
}

//SignUp Page
struct SignUp : View{
    
    @State var email = ""
    @State var pass = ""
    @State var repass = ""
    @Binding var index : Int
    var body: some View {
        ZStack(alignment: .bottom) {
            VStack{
                HStack{
                    Spacer(minLength: 0)
                    
                    VStack(spacing: 10) {
                        
                        Text("SignUp")
                            .foregroundColor(self.index == 1 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 1 ? Color.blue : Color.clear)
                            .frame(width: 100,height: 5)
                    }
                }
                .padding(.top, 30)
                
                VStack{
                    HStack(spacing: 15) {
                        Image(systemName: "envelope.fill")
                            .foregroundColor(Color("Color1"))
                        TextField("Email Address", text: self.$email)
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                VStack{
                    HStack(spacing: 15) {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Color1"))
                        SecureField("Password", text: self.$pass)
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                VStack{
                    HStack(spacing: 15) {
                        Image(systemName: "eye.slash.fill")
                            .foregroundColor(Color("Color1"))
                        SecureField("Repassword", text: self.$repass)
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
            
            }
            .padding()
            .padding(.bottom, 65)
            .background(Color("Color2"))
            .clipShape(CShape1())
            //clipping the content shape also for tap gesture...
            .contentShape(CShape1())
            .cornerRadius(35)
            .padding(.horizontal, 20)
            .shadow(color:Color.black.opacity(0.3), radius: 5, x: 0,y: -5)
            .onTapGesture {
                self.index = 1
            }
            
            // Button...
            Button(action: {
                
            }) {
                Text("SIGNUP")
                    .foregroundColor(.white)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color("Color1"))
                    .clipShape(Capsule())
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
            }// moving view down
            .offset(y:25)
            //hiding view when its in backgroud
            // only button...
            .opacity(self.index == 1 ? 1 : 0)
        }
    }

}
