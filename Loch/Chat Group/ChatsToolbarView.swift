//
//  ChatsToolbarView.swift
//  Loch
//
//  Created by Phoenix Liu on 25/2/2024.
//

// Goal: Code and style toolbar that appears when user clicks on chat block
// For: Mary
// Due: Wednesday 28th Feb

import SwiftUI

struct ChatsToolbarView: View {

    var body: some View {
        ZStack (alingment: .trailing) {
            // text input field, 
            ChatsTailView()
        }
        .padding(10)
        .frame(idealHeight:80, maxHeight: 80)
    }
}

#Preview {
    ChatsToolbarView()
}
