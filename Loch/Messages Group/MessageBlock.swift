//
//  MessageBlock.swift
//  Loch
//
//  Created by Phoenix Liu on 17/2/2024.
//

import SwiftUI

struct MessageBlock: View {
    var message: Message?
    var body: some View {
        VStack (alignment: .leading) {
            if let message = message {
                Image("Connecting Image")
                    .mask(Circle().frame(width: 30))
                    .overlay {
                        Text(message.timeStamp.formatted())
                            .font(.caption)
                            .offset(x: 40)
                    }
                Text(message.body)
                    .font(.caption)
                    .foregroundStyle(.gray)
                Text(message.sent ? "Me": "Pala")
                    .font(.caption2)
            } else {
                Text("No messages from this person")
            }
        }
        .padding([.top, .bottom], 10)
        .frame(maxWidth: .infinity)
    }
}

#Preview {
    MessageBlock()
}
