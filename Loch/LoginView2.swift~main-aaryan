//
//  LoginView.swift
//  Loch
//
//  Created by Phoenix Liu on 17/2/2024.
//

// Goal: Implement the looks of prototype login page, including animation, in Swift
// For: Mary
// Due: Thursday 14th Mar

import SwiftUI

// struct ButtonInit: View {
//     var todo: () -> Void
//     var actionName: String
//     var bgColor: Color

//     var body: some View {
//         Button {
//             self.todo()
//         } label: {
//             ZStack{
//                 RoundedRectangle(cornerRadius: 10, style: .continuous)
//                     .fill(bgColor)
//                     .frame(width: 150, height: 80)

//                 Text(actionName)
//                     .font(.system(size: 25 ,weight: .semibold, design: .default))
//                     .foregroundColor(.white)
//             }
//         }
//         .padding()
//     }
    
// }


struct LoginView: View {
    @State private var isSignedOn = false
    @State private var username: String = ""
    @State private var password: String = ""

    var body: some View {
        
        ZStack {
            LinearGradient(colors: [.green, .teal], startPoint: .topLeading, endPoint: .bottomTrailing)
            
            //details
            VStack {
                Spacer()
                Text("Login")
                    .font(.system(size: 50 ,weight: .bold, design: .default))
                    .padding()
                    .foregroundColor(.white)
                
                Spacer()
                
                TextField(
                    "Username", 
                    text: $username,
                    prompt: Text("Username")
                )
                    .padding(20)
                    .foregroundColor(.black)
                    .background(.white.opacity(0.2), in: RoundedRectangle (cornerRadius: 20, style: .continuous))
                    .disableAutocorrection(true)
                    .textInputAutocapitalization(.never)

                SecureField(
                    "Password", 
                    text: $password,
                    prompt: Text("Password")
                )
                    .padding(20)
                    .foregroundColor(.black)
                    .background(.white.opacity(0.2), in: RoundedRectangle (cornerRadius: 20, style: .continuous))
                    .disableAutocorrection(true)
                    .textInputAutocapitalization(.never)


                //log in button
                AuthButton(todo: {isSignedOn.toggle()}, actionName: "Log In", bgColor: .green)
            }
            .padding()
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    LoginView()
}
