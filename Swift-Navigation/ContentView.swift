//
//  ContentView.swift
//  Swift-Navigation
//
//  Created by Naveed on 24/08/2024.
//

import SwiftUI

struct ContentView: View {
    

    @State private var pathStore = PathStore()
    
    var body: some View {
        NavigationStack(path: $pathStore.path) {
            VStack{
                Button("Guest Navigation") {
                    let guest = Guest(name: "guest", email: "guest@gmail.com")
                    pathStore.path.append(guest)
                }
                
                Button("Admin Navigation") {
                    let admin = Admin(name: "Admin", email: "admin@gmail.com")
                    pathStore.path.append(admin)
                    pathStore.path.append(admin)
                    pathStore.path.append(admin)
                }
            }
            .toolbar {
                ToolbarItemGroup(placement: .topBarLeading) {
                    Button("Tap Me") {
                        // button action here
                    }

                    Button("Tap Me 2") {
                        // button action here
                    }
                }
            }
            .navigationDestination(for: Guest.self) { user in
                UserDetailView(user: user, path: $pathStore.path) {
                    pathStore.path = NavigationPath()
                }
            }
            .navigationDestination(for: Admin.self) { admin in
                UserDetailView(user: admin,path: $pathStore.path) {
                    pathStore.path = NavigationPath()
                }
            }

            .navigationTitle("Navigation Exmple")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.blue)
            .toolbarColorScheme(.dark)
           
        }
    }
}

protocol User: Codable {
    var id: UUID { get }
    var name: String { get }
    var email: String { get }
}

struct UserDetailView<T: User>: View {
    let user: T
    @Binding var path : NavigationPath
    let onBack: () -> Void
    
    var body: some View {
        VStack {
            Text("\(user.name) in Detail View with Id: \(user.id)")
            Button("Clear All Path"){
//                onBack()
                path = NavigationPath()
            }
        }
    }
}

struct Guest: Hashable, Identifiable, User {
    var id = UUID()
    var name: String
    var email: String
}

struct Admin: Hashable, Identifiable, User {
    var id = UUID()
    let name: String
    let email: String
}

#Preview {
    ContentView()
}

