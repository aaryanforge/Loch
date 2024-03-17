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
    
    // TODO: as messages from every person is cached, figure out a way to filter messages of the current person user is talking to
    
    var body: some View {
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
    }
}

#Preview {
    ChatsHeadView()
}


