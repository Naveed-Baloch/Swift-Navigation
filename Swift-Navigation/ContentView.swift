//
//  ContentView.swift
//  Swift-Navigation
//
//  Created by Naveed on 24/08/2024.
//

import SwiftUI

struct User: Hashable, Identifiable {
    let id = UUID()
    let name: String
    let email: String
}

struct ContentView: View {
    
    @State var users = [User]()
    
    var body: some View {
        NavigationStack(path: $users) {
            VStack{
                Button("User1") {
                    let user1 = User(name: "Guest1", email: "guest1@gmail.com")
                    let user2 = User(name: "Guest2", email: "guest2@gmail.com")
                    let user3 = User(name: "Guest3", email: "guest3@gmail.com")
                    users = [user1, user2, user3]
                }
            }
            .navigationDestination(for: User.self) { user in
                UserDetailView(for: user)
            }
        }
    }
}

#Preview {
    ContentView()
}

struct UserDetailView: View {
    let user: User
    init(for user: User) {
        self.user = user
        print("Creating Detail view fro \(user.name)")
    }
    var body: some View {
        Text("\(user.name) in Detail View with Id: \(user.id)")
    }
}
