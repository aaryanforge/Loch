//
//  LoginView.swift
//  Loch
//
//  Created by Phoenix Liu on 17/2/2024.
//

import SwiftUI
import FirebaseFirestore

struct LoginView: View {
    @Environment(\.modelContext) private var context
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
                        .autocorrectionDisabled()
                        .textInputAutocapitalization(.none)
                    Rectangle()
                        .frame(width: 280, height: 1)
                        .padding(.bottom)
                        .foregroundStyle(.black)
                }
                
                Text("Email")
                    .bold()
                
                TextField("Email", text: $email)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.none)
                Rectangle()
                    .frame(width: 280, height: 1)
                    .padding(.bottom)
                    .foregroundStyle(.black)
                
                
                Text("Password")
                    .bold()
                
                SecureField("Password", text: $password)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.none)
                Rectangle()
                    .frame(width: 280, height: 1)
                    .padding(.bottom)
                    .foregroundStyle(.black)
                
                VStack (alignment: .center) {
                    
                    if isNewUser == false {
                        Button(action: {
                            db.collection("users").document(email).getDocument { user, error in
//                                if error != nil {
//                                    print(error ?? "")
//                                    return
//                                }
                                if let previousUser = user {
                                    if previousUser.exists {
                                        do {
                                            let userObject = try previousUser.data(as: User.self)
                                            //if let user = tempUser {
                                                if userObject.password == password {
                                                    let userModelObject = UserModel(user: userObject)
                                                    context.insert(userModelObject)
                                                    try context.save()
                                                    isSignedOn = true
                                                }
                                            //}
                                        } catch {
                                            print("")
                                        }
                                    } else {
                                        print("The account you requested does not exist")
                                    }
                                }
                            }
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
