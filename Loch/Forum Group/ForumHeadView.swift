//
//  ForumHeadView.swift
//  Loch
//
//  Created by Phoenix Liu on 25/2/2024.
//

import SwiftUI

//TODO : FILL OUT FUNCTIONS
func search() { print ("search") }
func newPost() { print ("newPost") }

struct ForumHeadView: View {
    var body: some View {
        ZStack (alingment: .leading) {
            Text(
                "Forums", 
            )
            .padding()
            .font(.system(size: 20,weight: .bold, design: .default))
            .foregroundColor(.white)

            Spacer()

            // search button
            Button(action: {
                Task {
                    search()
                }
            }, label: {
                Image (systemname: "arrowtriangle.forward.fill") 
                .foregroundColor(.white)
            })
            .padding()

            //new post button
            Button(action: {
                Task {
                    newPost()
                }
            }, label: {
                Image (systemname: "arrowtriangle.forward.fill") 
                .foregroundColor(.white)
            })
            .padding()
        }
        .padding(10)
        .background(.green)
        .frame(idealHeight:80, maxHeight: 80)
    }
}

#Preview {
    ForumHeadView()
}
