//
//  Messages.swift
//  Loch
//
//  Created by A P on 30/1/2024.
//



import SwiftUI
import SwiftData

struct ChatsMainView: View {
    var body: some View {
        VStack {
            NavigationView {
                NavigationLink {
                    ChatsDetailView()
                }  label: {
                    Label("Work Folder", systemImage: "folder")
                }
            }
                /* More chats down the line */
        }
    }
}

#Preview {
    ChatsDetailView()
}
