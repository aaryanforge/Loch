//
//  LoginView.swift
//  Loch
//
//  Created by Phoenix Liu on 17/2/2024.
//

import SwiftUI

struct LoginView: View {
    @State private var account = ""
    @State private var password = ""
    
    var body: some View {
        VStack (alignment: .leading) {
            Text("Username or email: ")
                .bold()
            
            TextField("Account", text: $account)
            Rectangle()
                .frame(width: 280, height: 1)
                .padding(.bottom)
                .foregroundStyle(.black)
            
            Text("Password")
                .bold()
            
            SecureField("Password", text: $password)
            Rectangle()
                .frame(width: 280, height: 1)
                .padding(.bottom)
                .foregroundStyle(.black)
            
            VStack (alignment: .center) {
                Button(action: {
                    
                }, label: {
                    Text("Log in")
                        .foregroundStyle(.white)
                        .frame(width: 150)
                        .padding()
                        .background(.red)
                })
                Button(action: {
                    
                }, label: {
                    Text("Signup instead")
                        .underline()
                })
            }
                .frame(maxWidth: .infinity)
        }
            .padding(.leading)
        
        
        
    }
}

#Preview {
    LoginView()
}
