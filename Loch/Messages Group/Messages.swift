//
//  Messages.swift
//  Loch
//
//  Created by A P on 30/1/2024.
//

import SwiftUI



struct Messages: View {
    var body: some View {
        NavigationView() {
            List(msgs) { msg in
                NavigationLink(destination: MessagesPage()) {
                    HStack(){
                        Image(msg.imageName)
                            .resizable()
                            .aspectRatio(contentMode: /*@START_MENU_TOKEN@*/.fill/*@END_MENU_TOKEN@*/)
                            .frame(width: 60, height: 60)
                            .clipped()
                            .cornerRadius(50)
                        VStack(alignment: .leading, spacing: 50) {
                            Text(msg.name)
                                .font(.system(size: 21, weight: .medium, design: .default))
                            
                        }
                    }
                }
            }
            .navigationTitle("Messages")
        }
    }
}

#Preview {
    Messages()
}
