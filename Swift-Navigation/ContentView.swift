//
//  ContentView.swift
//  Swift-Navigation
//
//  Created by Naveed on 24/08/2024.
//

import SwiftUI

struct ContentView: View {
    
    @State var users = [Guest]()
    @State var admins = [Admin]()
    
    var body: some View {
        NavigationStack(path: $admins) {
            VStack{
                Button("User1") {
                    let user1 = Guest(name: "Guest1", email: "guest1@gmail.com")
                    let user2 = Guest(name: "Guest2", email: "guest2@gmail.com")
                    let user3 = Guest(name: "Guest3", email: "guest3@gmail.com")
                    users = [user1, user2, user3]
                }
                
                Button("Navigate to admin") {
                    let admin = Admin(name: "Admin", email: "guest1@gmail.com")
                    admins = [admin]
                }
            }
            .navigationDestination(for: Guest.self) { user in
                UserDetailView(for: user)
            }
            .navigationDestination(for: Admin.self) { admin in
                UserDetailView(for: admin)
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
    
    init(for user: T) {
        self.user = user
        print("Creating Detail view for \(user.name)")
    }
    
    var body: some View {
        Text("\(user.name) in Detail View with Id: \(user.id)")
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

