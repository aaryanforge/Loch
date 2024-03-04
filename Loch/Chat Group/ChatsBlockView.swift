//
//  MessageBlock.swift
//  Loch
//
//  Created by Phoenix Liu on 17/2/2024.
//

// Goal: Code and style chat block view
// For: Mary
// Due: Wednesday 28th Feb

import SwiftUI
import SwiftData

struct YourMessage: View {
    var body: some View {
        ZStack(alignment: .trailing) {
            Text("I want food")
                .padding(10)
                .frame(maxWidth: .infinity, alignment: .trailing)

        }
        .background(.green.opacity(0.5))
        .clipShape(
            .rect(
                topLeadingRadius: 15,
                bottomLeadingRadius: 15,
                bottomTrailingRadius: 0,
                topTrailingRadius: 15
            )
        )
    }
}

struct TheirMessage: View {
    var body: some View {
        ZStack(alignment: .leading) {
            Text("Placeholder")
                .padding(10)
                .frame(maxWidth: .infinity, alignment: .leading)

        }
        .background(.blue.opacity(0.5))
        .clipShape(
            .rect(
                topLeadingRadius: 15,
                bottomLeadingRadius: 0,
                bottomTrailingRadius: 15,
                topTrailingRadius: 15
            )
        )
    }
}

struct ChatsBlockView: View {

    var body: some View {
        ScrollView {
            LazyVStack {
                YourMessage()
                TheirMessage()

            }
            .padding()
        }
    }
}

#Preview {
    ChatsBlockView()
}
