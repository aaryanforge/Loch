//
//  ForumAddNewView.swift
//  Loch
//
//  Created by Mark on 13/3/2024.
//

import Foundation
import SwiftUI
import SwiftData

struct ForumAddNewView: View {
    
    @State private var forumTextContent = ""
    @State private var forumTags = ""
    @Environment(\.modelContext) private var context
    
    func cachePost() {
        let newForumPost = ForumPost(
            senderID: UUID().uuidString,
            messageContents: forumTextContent
        )
        context.insert(newForumPost)
    }
    
    var body: some View {
        VStack {
            // centered image
            Image("Connecting Image")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 200, height: 200) // TODO: change this later, idk how it looks
                .border(Color("aqua"))
            
            // content text box
            VStack {
                Text("Content:")
                TextField(
                    "Enter forum text content",
                    text: $forumTextContent
                )
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            }
            
            // tags
            VStack {
                Text("Tags:")
                TextField(
                    "Enter tags for the forum post",
                    text: $forumTags
                ) // TODO: insert function that converts the text into list of UserModels
            }
            
            // post forum button
            Button(action: {
                cachePost()
            }, label: {
                Text("New Post")
            })
        }
    }
}
