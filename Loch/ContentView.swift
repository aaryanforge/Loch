//
//  ContentView.swift
//  Loch
//
//  Created by A P on 30/1/2024.
//

// Tabs
// Settings Button (Top)
// Create Profile Page


import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            TabView() {
                Messages()
                    .tabItem{
                        Image(systemName: "message")
                        Text("Messages")
                    }

                Forums()
                    .tabItem{
                        Image(systemName: "newspaper.circle")
                        Text("Forums")
                    }
                
                Connect()
                    .tabItem{
                        Image(systemName: "shareplay")
                        Text("Connect")
                    }
                
                Contacts()
                    .tabItem{
                        Image(systemName: "person.2")
                        Text("Contacts")
                    }
                
                Profile()
                    .tabItem{
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
