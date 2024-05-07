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
                ChatsMainView()
                    .tabItem{
                        Image(systemName: "message")
                        Text("Messages")
                    }

                ForumMainView()
                    .tabItem{
                        Image(systemName: "newspaper.circle")
                        Text("Forums")
                    }
                
                ConnectMainView()
                    .tabItem{
                        Image(systemName: "shareplay")
                        Text("Connect")
                    }
                
                ContactsMainView()
                    .tabItem{
                        Image(systemName: "person.2")
                        Text("Contacts")
                    }
                
                ProfileMainView()
                    .tabItem{
                        Image(systemName: "person.fill")
                        Text("Profile")
                    }
//                chatView()
//                    .tabItem{
//                        Image(systemName: "person.fill")
//                        Text("sockets")
//                    }
                
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
