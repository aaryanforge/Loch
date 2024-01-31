//
//  Profile.swift
//  Loch
//
//  Created by A P on 30/1/2024.
//

import SwiftUI

struct Profile: View {
    var body: some View {
        VStack{
            
            NavigationView() {
                NavigationLink {
                    Settings()
                } label: {
                    Text("Settings")
                        .position(CGPoint(x: 325, y: 10))
                }
            }
            Image("Connecting Image")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 150, height: 150)
                .cornerRadius(150)
                .shadow(radius: 3)
            Text("Name")
                .font(.title)
                .fontWeight(.bold)
            
        }
    }
}

#Preview {
    Profile()
}
