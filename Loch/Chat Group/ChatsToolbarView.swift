//
//  ChatsToolbarView.swift
//  Loch
//
//  Created by Phoenix Liu on 25/2/2024.
//

// Goal: Code and style toolbar that appears when user clicks on chat block
// For: Mary
// Due: Thurs 7th Mar

import SwiftUI

//TODO
// add fucntionality to these fuctions
func reply() { print ("reply") }
func pinComment() { print ("pinComment") }
func copyText() { print ("copyText") }
func delete() { print ("delete") } // delete comment for user only
func report() { print ("report") }
func messageUser() { print ("messageUser") }


// toolbar for holding onto chat message if in Private Message (PM)
struct ChatsToolbarViewPM: View {

    var body: some View {
        Menu("placeholder") {
            Button("Reply", action: reply)
            Button("Pin Comment", action: pinComment)
            Button("Copy Text", action: copyText)
            Button("Delete", action: delete)
            Button("Report", action: report)
        }
    }
}

// toolbar for holding onto chat message if in Group Chat (GC)
struct ChatsToolbarViewGC: View {

    var body: some View {
        Menu("placeholder") {
            Button("Reply", action: reply)
            Button("Pin Comment", action: pinComment)
            Button("Copy Text", action: copyText)
            Button("PM user privately", action: messageUser)
            Button("Delete", action: delete)
            Button("Report", action: report)
        }
    }
}

#Preview {
    ChatsToolbarViewPM()
}

#Preview {
    ChatsToolbarViewGC()
}