//
//  Forums.swift
//  Loch
//
//  Created by A P on 30/1/2024.
//

// Goal: Load forums from cache
// For: Mark
// Due: Saturday 9th Feb


import SwiftUI
import SwiftData

struct ForumMainView: View {
    
    @Query private var forumPosts: [ForumPost]
    
    var body: some View {
        
        VStack {
            
            ForumHeadView()
            
            LazyVStack {
                ForEach(forumPosts) { forumPost in
                    VStack {
                        Text(forumPost.messageContents)
                        Text(forumPost.senderName)
                        
                        ForEach(forumPost.comments) { comment in
                            VStack {
                                Text(comment.senderName)
                                Text(comment.messageContents)
                            }
                        }
                    }
                }
            }
         }
     }
}

#Preview {
    ForumMainView()
}
