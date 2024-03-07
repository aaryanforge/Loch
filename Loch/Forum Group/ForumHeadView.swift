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
        HStack {
            Text("Forums")
            .padding(10)
            .font(.system(size: 25,weight: .bold, design: .default))
            .foregroundColor(.white)

            Spacer()

            // search button
            Button(action: {
                Task {
                    search() // FILL OUT FUNCTION AT TOP
                }
            }, label: {
                Image(systemName: "magnifyingglass")
                .foregroundColor(.white)
            })

            //new post button
            Button(action: {
                Task {
                    newPost() // FILL OUT FUNCTION AT TOP
                }
            }, label: {
                Image(systemName: "plus")
                .foregroundColor(.white)
            })
            .padding(10)
        }
        .padding(10)
        .background(.green)
        .frame(idealHeight:80)
    }
}

#Preview {
    ForumHeadView()
}
