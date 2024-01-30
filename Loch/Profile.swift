//
//  Profile.swift
//  Loch
//
//  Created by A P on 30/1/2024.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        VStack(alignment: .center){
            HStack(alignment: .center){
                Circle()
                    .size(CGSize(width: 200, height: 200))
                    .offset(CGSize(width: 65, height: 0))
                }
            .padding()
            }
        .padding()
        
//        NavigationView() {
//            NavigationLink {
//                Settings()
//            } label: {
//                Text("Settings")
//                    .position(CGPoint(x: 350, y: 10))
//            }
//        }
    }
}

#Preview {
    Profile()
}
