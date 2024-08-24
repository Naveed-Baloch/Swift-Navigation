//
//  ContentView.swift
//  Swift-Navigation
//
//  Created by Naveed on 24/08/2024.
//

import SwiftUI

struct ContentView: View {
    

    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path) {
            VStack{
                Button("Guest Navigation") {
                    let guest = Guest(name: "guest", email: "guest@gmail.com")
                    path.append(guest)
                }
                
                Button("Admin Navigation") {
                    let admin = Admin(name: "Admin", email: "admin@gmail.com")
                    path.append(admin)
                    path.append(admin)
                    path.append(admin)
                }
            }
            .navigationDestination(for: Guest.self) { user in
                UserDetailView(user: user, path: $path) {
                    path = NavigationPath()
                }
            }
            .navigationDestination(for: Admin.self) { admin in
                UserDetailView(user: admin,path: $path) {
                    path = NavigationPath()
                }
            }
        }
    }
}

protocol User {
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
    let id = UUID()
    let name: String
    let email: String
}

#Preview {
    ContentView()
}

