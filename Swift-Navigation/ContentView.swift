//
//  ContentView.swift
//  Swift-Navigation
//
//  Created by Naveed on 24/08/2024.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        NavigationStack {
            List(0..<1000) { number in
                NavigationLink(destination: {
                    DetailView(for: number)
                }, label: {
                    Text("\(number) in Label")
                })
            }
        }
       
    }
}

#Preview {
    ContentView()
}

struct DetailView: View {
    let number: Int
    init(for number: Int) {
        self.number = number
        print("Creating Detail view fro \(number)")
    }
    var body: some View {
        Text("\(number) in Detail View")
    }
}
