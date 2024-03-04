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

struct ForumMainView: View {
    var body: some View {
        ForumHeadView()
        LazyVStack {
            ForumBlockView()
            ForumBlockView()
            ForumBlockView()
        }
        ForumTailView()
    }
}

#Preview {
    ForumMainView()
}
