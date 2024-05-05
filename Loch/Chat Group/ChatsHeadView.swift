//
//  ChatsHeadView.swift
//  Loch
//
//  Created by Phoenix Liu on 25/2/2024.
//

// Goal: Create an unstyled search box. When the user enters a query in the search box and presses enter, the ChatsDetailView page should load up the relevant texts
// For: Mark
// Due: Thursday 7th March

import SwiftUI 
import SwiftData

struct ChatsHeadView: View {
    
    @State private var isTextSearchSheetOn = false
    @State private var isCalling = false
    
    // TODO: as messages from every person is cached, figure out a way to filter messages of the current person user is talking to
    
    var body: some View {
        HStack {
            
            Text("Friend Name")
                .padding(10)
                .font(.system(size: 25,weight: .bold, design: .default))
                .foregroundColor(.white)
                .edgesIgnoringSafeArea(.top)
            Spacer()
            
            Image(systemName: "plus")
                .padding(.trailing)
                .foregroundColor(.white)
                .scaleEffect(1.5)

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
        }
        .frame(maxWidth:.infinity, maxHeight: 65, alignment: .leading)
        .padding()
        .background(.green)

    }
}

#Preview {
    ChatsHeadView()
}


