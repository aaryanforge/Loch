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
            List {
                ChatsDetailView()
                ChatsDetailView()
                ChatsDetailView()
                /* More chats down the line */
            }
            
        }
    }
}

#Preview {
    ChatsDetailView()
}
