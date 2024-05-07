//
//  MessagesPage.swift
//  Loch
//
//  Created by A P on 31/1/2024.
//

// Goal: Load from cache messages and dipslay them in ChatsBlockView
// For: Mark
// Due: Thursday 29 Mar

import SwiftUI
import SwiftData

struct ChatsHeadView: View {
    
    @State private var isTextSearchSheetOn = false
    @State private var isCalling = false
    @State private var isSettings = false
    
    // TODO: as messages from every person is cached, figure out a way to filter messages of the current person user is talking to
    
    var body: some View {
        
        HStack {
            ProfilePictureCircle(size: 30, hasBorder: true)
                .padding(6)
                .padding(.leading, 5)
            
            VStack {
                Text("Friend Nickanme")
                    .padding(.bottom, 5)
                    .font(.system(size: 12,weight: .bold, design: .default))
                    .foregroundColor(.black)
                    .edgesIgnoringSafeArea(.top)
                
                Text("Friend Name")
                    .padding(.bottom, 5)
                    .font(.system(size: 8, design: .default))
                    .foregroundColor(.gray)
                    .edgesIgnoringSafeArea(.top)
            }
            .padding(.leading, 5)
            
            Spacer()

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
            .scaleEffect(1.2)
            
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
            .scaleEffect(1.2)

            Image(systemName: "ellipsis")
                .padding(.trailing)
                .foregroundColor(.white)
                .scaleEffect(1.5)
            .sheet(
                isPresented: $isSettings,
                content: {
                    ChatsToolbarViewPM()
            })
            .onTapGesture{
                isSettings.toggle()
//                isOn.toggle()
            }
        }
        .frame(maxWidth:.infinity, maxHeight: 65, alignment: .leading)
        .padding()
        .background(.green)

    }
}


/* 
YourMessage: Displays the text messages you send in green (TBC)
@Params:
    message: String 
        Takes in a string for the message 
*/
struct YourMessage: View {
    var message: String
    var body: some View {
        ZStack(alignment: .trailing) {
            // Need to change text based on messages
            Text(message)
                .font(.system(size: 10 ,weight: .regular, design: .default))
                .padding(10)
                .frame(maxWidth: .infinity, alignment: .trailing)

        }
        //should add a property for ChatsTollbarView to be rendered onLongPressGesture
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

/* 
TheirMessage: Displays the text messages you recieve in blue (TBC)
@Params:
    message: String 
        Takes in a string for the message 
*/
struct TheirMessage: View {
    var message: String

    var body: some View {
        ZStack(alignment: .leading) {
             // Need to change text based on messages
            Text(message)
                .font(.system(size: 10 ,weight: .regular, design: .default))
                .padding(10)
                .frame(maxWidth: .infinity, alignment: .leading)

        }

        .background(.gray.opacity(0.2))
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


struct ChatsDetailView: View {

    // mark was here - loading the messages using Query attribute
    @Query private var messages: [ChatTextMessage]
    
    var body: some View {
        VStack {
            ChatsHeadView()

            //placeholder for now, please render theirmessage or yourmessage based on uid matching
            LazyVStack {
                TheirMessage(message: "Placeholder")
                YourMessage(message: "I want food")
            }
            
            chatView()

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
    ChatsDetailView()
}
