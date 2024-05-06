//
//  LandingView.swift
//  Loch
//
//  Created by Mary Duan on 13/4/2024.
//

import SwiftUI

struct AuthButton: View {
    var todo: () -> Void
    var actionName: String
    var bgColor: Color

    var body: some View {
        Button {
            self.todo()
        } label: {
            ZStack{
                RoundedRectangle(cornerRadius: 10, style: .continuous)
                    .fill(bgColor)
                    .frame(width: 150, height: 60)

                Text(actionName)
                    .font(.system(size: 25 ,weight: .semibold, design: .default))
                    .foregroundColor(.white)
            }
        }
        .padding()
    }
    
}

struct LandingView: View {
    
    var body: some View {
        
        ZStack {
            LinearGradient(colors: [.green, .blue], startPoint: .topLeading, endPoint: .bottomTrailing)
            
            //details
            VStack {
                Spacer()

                Text("Welcome to")
                    .font(.system(size: 45 ,weight: .bold, design: .default))
                    .padding()
                    .foregroundColor(.white)
                Text("Loch")
                    .font(.system(size: 60 ,weight: .bold, design: .default))
                    .padding()
                    .foregroundColor(.white)
                    .shadow(
                        color: Color.grey.opacity(0.3), /// shadow color
                        radius: 5, /// shadow radius
                        x: 3, /// x offset
                        y: 10 /// y offset
                    )
            
                Spacer()

                AuthButton(todo:{print("sign up")} ,actionName: "Sign Up", bgColor: .teal)
                AuthButton(todo:{print("log in")}, actionName: "Log In", bgColor: .green)
                Spacer()


                }
            }
            .padding()
        }
        .edgesIgnoringSafeArea(.all)
    }
}

#Preview {
    LandingView()
}
