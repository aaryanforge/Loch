//
//  LoginView.swift
//  Loch
//
//  Created by Phoenix Liu on 17/2/2024.
//

import SwiftUI
import FirebaseFirestore

struct LoginView: View {
    
    @State private var isSignedOn = true
    
    var body: some View {
        if isSignedOn == false {
            VStack {
                Text("Just sign on...")
            }
        } else {
            ContentView()
        }
    }
}

#Preview {
    LoginView()
}
