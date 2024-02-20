//
//  Messages.swift
//  Loch
//
//  Created by A P on 30/1/2024.
//

import SwiftUI
import SwiftData

struct Messages: View {
    
    @Query private var loggedInUser: [UserModel]
    @MainActor func getMessageRooms(user: UserModel) -> [ChatRoom] {
        return MessageRoomsManager(user: user).getMessageRooms()
    }
    
    //?? User(email: "", username: "", password: "", chatRooms: [])
    var body: some View {
        NavigationView {
            
            
            List(getMessageRooms(user: loggedInUser[0])) { chatRoom in
                Text(chatRoom.name)
                //if let roomId = chatRoom.id {
                
                NavigationLink(destination: MessagesPage(chatRoom: chatRoom)) {
                    HStack() {
                        Image("Connecting Image")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                            .clipped()
                            .cornerRadius(50)
                        VStack(alignment: .leading, spacing: 50) {
                            Text(chatRoom.name)
                                .font(.system(size: 21, weight: .medium, design: .default))
                        }
                    }
                }
                //}
            }
                .navigationTitle("Messages")
//            }
        }
//            .task {
//                if let loggedInUser = loggedInUser {
//                    chatRooms = ChatRoom(id: loggedInUser.chatRooms, name: 
//                }
//            }
    }
}

//#Preview {
//    Messages()
//}

