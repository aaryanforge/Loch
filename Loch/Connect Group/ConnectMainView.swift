//
//  Connect.swift
//  Loch
//
//  Created by A P on 30/1/2024.
//

import SwiftUI


struct Connect: View {
    @State var searching = "Searching"
    @State var timer: Timer = Timer.scheduledTimer(withTimeInterval: 0.01, repeats: false) { tim in }
    @State var isSearching = false
    
    var body: some View {
        VStack(alignment: .center) {
            HStack(alignment: .center){
                Image("Connecting Image")
                Button("Start") {
                    if isSearching == false {
                        isSearching = true
                        timer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { _ in
                            if searching != "Searching..." {
                                
                                searching = searching + "."
                            } else {
                                searching = "Searching"
                            }
                        }
                    }
                    
                }
                
            }
            .padding()
            
            Text(searching)
            }
        .padding()
    }
}

#Preview {
    Connect()
}
