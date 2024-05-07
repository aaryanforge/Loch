//
//  Messages.swift
//  Loch
//
//  Created by A P on 30/1/2024.
//

import SwiftUI


struct Chatitem: View {
    //var uid : Int   please change when avaliable
    var time: String
    var isRead: Bool
    
    var body: some View {
        
        HStack {
            NavigationLink {
                ChatsDetailView()
            } label: {
                
                ProfilePictureCircle(size: 65, hasBorder: true)
                    .padding(6)
                    .padding(.leading, 5)
                
                Text("Nickname here")
                    .padding(8)
                
                Spacer()
                Text(time)
                    .font(.system(size: 10 ,weight: .regular, design: .default))
                    .padding(.trailing, 5)
                    .foregroundColor(.gray)
                
                Image(systemName: (isRead ? "checkmark.circle" : "circle" ))
                    .foregroundColor(isRead ? .green : .gray)
                    .padding(.trailing)
                
            }
            .frame(maxWidth: .infinity, maxHeight: 120, alignment: .leading)
            .padding(5)
        }
    }
    
}

struct ChatsMainView: View {
    @State private var isAddGroupMemberOn = false

    var body: some View {

        //header
        NavigationView {
            VStack {
                HStack {
                    Text("Chats")
                        .padding(10)
                        .font(.system(size: 25,weight: .bold, design: .default))
                        .foregroundColor(.white)
                        .edgesIgnoringSafeArea(.top)
                    Spacer()
                    
                    Image(systemName: "plus")
                        .padding(.trailing)
                        .foregroundColor(.white)
                        .scaleEffect(1.5)
                        .onTapGesture{
                            withAnimation(.easeInOut(duration: 1.0)) {
                                isAddGroupMemberOn.toggle()
                            }
                        }
                        .sheet(
                            isPresented: $isAddGroupMemberOn,
                            content: {
                                GroupChatsMainView()
                            })
                    
                    Image(systemName: "magnifyingglass")
                        .padding(.trailing)
                        .foregroundColor(.white)
                        .scaleEffect(1.2)
                    Image(systemName: "ellipsis")
                        .padding(.trailing, 8)
                        .foregroundColor(.white)
                        .scaleEffect(1.2)
                    
                }
                .frame(maxWidth:.infinity, maxHeight: 65, alignment: .leading)
                .padding()
                .background(.green)
                
                VStack (spacing: 0) {
                    ScrollView ([.vertical]) {
                        Chatitem(time: "6:28pm", isRead: true)
                        Chatitem(time: "3:17pm", isRead: false)
                        Chatitem(time: "11:02am", isRead: false)
                        Chatitem(time: "4:20pm", isRead: false)
                        Chatitem(time: "2:25pm", isRead: true)
                        Chatitem(time: "9:30am", isRead: true)
                    }
                    .padding([.top], 10)
                    
                }
            }
        }
    }
}

#Preview {
    ChatsMainView()
}
