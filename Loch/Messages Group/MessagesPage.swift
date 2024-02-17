//
//  MessagesPage.swift
//  Loch
//
//  Created by A P on 31/1/2024.
//

import SwiftUI



struct currentMsgs {
    var cMsg: String
}

struct MessagesPage: View {
        
    var msg: messagesData
    @State private var txtMsg: String = ""
    @State var currentMsg: String = ""
    var count = 1 ... 10
    
    @State var Ms = [currentMsgs(cMsg: ""), currentMsgs(cMsg: ""), currentMsgs(cMsg: ""), currentMsgs(cMsg: ""), currentMsgs(cMsg: "")]
    
    func makeTxt(txtMsg: String) -> Text {
        return Text(txtMsg)
    }
    
    var body: some View {
        Section() {
            Text(Ms[0].cMsg)
        }
        Section() {
            Text(Ms[1].cMsg)
        }
        Section() {
            Text(Ms[2].cMsg)
        }
        Section() {
            Text(Ms[3].cMsg)
        }
        Section() {
            Text(Ms[4].cMsg)
        }
        
        TextField("Message @" + msg.name, text: $txtMsg)
            .onSubmit {
                let count = 0 ... Ms.count
                for i in count {
                    if Ms[(i)].cMsg == "" {
                        Ms[(i)].cMsg = txtMsg
                        break
                    }
                }
                currentMsg = txtMsg
            }
            .border(Color.black)
    }
}

//#Preview {
  //  MessagesPage(dat: )
//}
