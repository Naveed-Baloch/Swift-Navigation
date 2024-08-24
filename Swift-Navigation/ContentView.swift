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
  
  let users = [User(name: "Naveed", email: "naveed@gmail.com"), User(name: "Guest", email: "guest@gmail.com")]
  
  var body: some View {
    NavigationStack {
      List(users) { user in
        NavigationLink(value: user, label: {
          Text("\(user.name)")
        })
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
