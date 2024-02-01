//
//  MessagesPage.swift
//  Loch
//
//  Created by A P on 31/1/2024.
//

import SwiftUI


struct MessagesPage: View {
        
    var msg: messagesData
    @State private var txtMsg: String = ""
    @State var currentMsg: String = ""
    @State var messaged = false
    
    func makeTxt(txtMsg: String) -> Text {
        return Text(txtMsg)
    }
    
    var body: some View {
        Text(currentMsg)
        
        TextField("Message @" + msg.name, text: $txtMsg)
            .onSubmit {
                print(txtMsg)
                currentMsg = txtMsg
                messaged = true
            }
            .border(Color.black)
    }
}

//#Preview {
  //  MessagesPage(dat: )
//}
