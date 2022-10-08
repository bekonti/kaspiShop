////
////  ContentView.swift
////  kaspiShop
////
////  Created by BeKZat Jarylqasyn on 23.09.2022.
////
//
//import SwiftUI
////import iPhoneNumberField
//import CoreData
//import Firebase
//
//struct ContentView: View {
//    @Environment(\.managedObjectContext) private var viewContext
//    
//    @FetchRequest(
//        sortDescriptors: [NSSortDescriptor(keyPath: \Item.timestamp, ascending: true)],
//        animation: .default)
//    private var items: FetchedResults<Item>
//    @State var phoneNumber = ""
//    @State var password = ""
//    @State var email = ""
//    
//    @State private var path = NavigationPath()
//    
//    var body: some View {
//        NavigationStack(path: $path) {
//            VStack{
//                Image("logo")
//                    .resizable()
//                    .scaledToFit()
//                    .frame(width: 150,height:150)
//                VStack{
//                    TextField("Phone Number", text: $phoneNumber)
//                        .padding()
//                        .background(Color(.secondarySystemFill))
//        
//                    SecureField("Password", text: $password)
//                        .padding()
//                        .background(Color(.secondarySystemFill))
//                    
//                    Button(action: {
//                        
//                    }, label: {
//                        Text("SIGN IN")
//                            .foregroundColor(Color.white)
//                            .frame(width: 200,height: 50)
//                            .cornerRadius(20)
//                            .background(Color.blue)
//                    })
//                }
//            }
////            List {
////                ForEach(items) { item in
////                    NavigationLink {
////                        Text("Item at \(item.timestamp!, formatter: itemFormatter)")
////                    } label: {
////                        Text(item.timestamp!, formatter: itemFormatter)
////                    }
////                }
////                .onDelete(perform: deleteItems)
////            }
////            .toolbar {
////                ToolbarItem(placement: .navigationBarTrailing) {
////                    Button(action: chat){
////                        Label("Chats", systemImage: "sun.min")
////                    }
////                    //                    EditButton()
////                }
////                ToolbarItem {
////                    Button(action: addItem) {
////                        Label("Add Item", systemImage: "heart")
////                    }
////                }
////
////            }
////            Text("Select an item")
//        }
//    }
//    
//    func register(){
////        Auth.auth().createUser(withEmail: email, password: password)
//    }
//    
//    private func addItem() {
//        withAnimation {
//            let newItem = Item(context: viewContext)
//            newItem.timestamp = Date()
//            
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//    
//    private func chat(){
//        
//    }
//
//    private func deleteItems(offsets: IndexSet) {
//        withAnimation {
//            offsets.map { items[$0] }.forEach(viewContext.delete)
//
//            do {
//                try viewContext.save()
//            } catch {
//                // Replace this implementation with code to handle the error appropriately.
//                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
//                let nsError = error as NSError
//                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
//            }
//        }
//    }
//}
//
//private let itemFormatter: DateFormatter = {
//    let formatter = DateFormatter()
//    formatter.dateStyle = .short
//    formatter.timeStyle = .medium
//    return formatter
//}()
//
//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
//    }
//}
