//
//  LoginView.swift
//  Loch
//
//  Created by Phoenix Liu on 17/2/2024.
//

import SwiftUI
import FirebaseFirestore

struct LoginView: View {
    @State private var username = ""
    @State private var email = ""
    @State private var password = ""
    @State private var isSignedOn = false
    @State private var isNewUser = false
    private var db = Firestore.firestore()
    
    var body: some View {
        if isSignedOn == false {
            VStack (alignment: .leading) {
                if isNewUser {
                    Text("Username")
                        .bold()
                    
                    TextField("Username", text: $username)
                    Rectangle()
                        .frame(width: 280, height: 1)
                        .padding(.bottom)
                        .foregroundStyle(.black)
                }
                
                Text("Email")
                    .bold()
                
                TextField("Email", text: $email)
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
                    
                    if isNewUser == false {
                        Button(action: {
                            db.collection("users").document(email).getDocument { user, error in
                                if error != nil {
                                    print(error ?? "")
                                    return
                                }
                                if let previousUser = user {
                                    if previousUser.exists {
                                        do {
                                            let storedPassword = try previousUser.data(as: User.self).password
                                            if storedPassword == password {
                                                isSignedOn = true
                                            }
                                        } catch {
                                            print(error)
                                        }
                                    } else {
                                        print("The account you requested does not exist")
                                    }
                                }
                            }
                            isSignedOn = true
                        }, label: {
                            Text("Log in")
                                .foregroundStyle(.white)
                                .frame(width: 150)
                                .padding()
                                .background(.red)
                        })
                        Button(action: {
                            isNewUser = true
                        }, label: {
                            Text("Signup instead")
                                .underline()
                        })
                    } else {
                        Button(action: {
                            db.collection("users").document(email).getDocument { user, error in
                                if error != nil {
                                    print(error ?? "")
                                    return
                                }
                                if let previousUser = user {
                                    if previousUser.exists {
                                        print("User already exists")
                                    } else {
                                        db.collection("users").document(email).setData([
                                            "username": username,
                                            "password": password,
                                        ])
                                        isSignedOn = true
                                    }
                                }
                            }
                        }, label: {
                            Text("Signup")
                                .foregroundStyle(.white)
                                .frame(width: 150)
                                .padding()
                                .background(.red)
                        })
                        Button(action: {
                            isNewUser = false
                        }, label: {
                            Text("Login instead")
                                .underline()
                        })
                    }
                }
                .frame(maxWidth: .infinity)
            }
            .padding(.leading)
        } else {
            ContentView()
        }
        
    }
}

#Preview {
    LoginView()
}
