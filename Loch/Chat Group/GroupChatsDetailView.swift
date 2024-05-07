//
//  Group Chat DMs
//  Loch
//
//  Created by Mary on 05/05/2024.
//


import SwiftUI
import SwiftData

struct GroupChatsHeadView: View {
    
    // SHEETS
    @State private var isTextSearchSheetOn = false
    @State private var isCalling = false
    @State private var isSettings = false
    @State private var isAddGroupMemberOn = false
    
    
    var body: some View {
        HStack {
            ProfilePictureCircle(size: 30, hasBorder: true)
                .padding(6)
                .padding(.leading, 5)
            
            VStack {
                Text("Group Name")
                    .padding(.bottom, 5)
                    .font(.system(size: 12,weight: .bold, design: .default))
                    .foregroundColor(.black)
                    .edgesIgnoringSafeArea(.top)
                
                Text("Group Members")
                    .padding(.bottom, 5)
                    .font(.system(size: 8, design: .default))
                    .foregroundColor(.gray)
                    .edgesIgnoringSafeArea(.top)
            }
            .padding(.leading, 5)
            
            Spacer()

            // buttons


            /* 
            SEARCH
            */
            Button {
                // do something
                isTextSearchSheetOn.toggle()
            } label: {
                Label("Search", systemImage: "magnifyingglass")
            }
            .sheet(
                isPresented: $isTextSearchSheetOn,
                content: {
                    ChatsHeadTextSearchView()
            })
            .padding(.trailing)
            .foregroundColor(.white)
            
            /* 
            CALL
            */
            Button {
                isCalling.toggle()
            } label: {
                Label("Call", systemImage: "phone.fill")
            }
            .sheet(
                isPresented: $isCalling,
                content: {
                    CallView()
            })
            .padding(.trailing)
            .foregroundColor(.white)

            /* 
            ADD MEMBERS
            */

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

            /* 
            OPTIONS
            */

            Image(systemName: "ellipsis")
                .padding(.trailing)
                .foregroundColor(.white)
                .scaleEffect(1.5)
            .sheet(
                isPresented: $isSettings,
                content: {
                    ChatsToolbarViewGC()
            })
            .onTapGesture{
//                isOn.toggle()
                isSettings.toggle()
            }
        }
        .frame(maxWidth:.infinity, maxHeight: 65, alignment: .leading)
        .padding()
        .background(.green)

    }
}

struct GroupChatsDetailView: View {

    // mark was here - loading the messages using Query attribute
    @Query private var messages: [ChatTextMessage]
    
    var body: some View {
        VStack {
            GroupChatsHeadView()

            //placeholder for now, please render theirmessage or yourmessage based on uid matching
            LazyVStack {
                TheirMessage(message: "Placeholder")
                YourMessage(message: "I want food")
            }

            // mark was here - loading the messages
            // ForEach(messages) { message in
            //     VStack {
            //         Text(message.messageContents)
            //     }
            // }
            //ChatsTailView()
        }
    }
}

#Preview {
    GroupChatsDetailView()
}
