//
//  Forums.swift
//  Loch
//
//  Created by A P on 30/1/2024.
//

// Goal: Load forums from cache
// For: Mark
// Due: Saturday 9th March


import SwiftUI


struct ForumBlockPost: View {
    var imageLink: String
    var title: String
    var postContent: String

    var body: some View {
        HStack{
            Spacer()
            
            if (imageLink != ""){
                Image(imageLink)
                    .resizable()
                    .aspectRatio(CGSize(width:1, height: 1), contentMode: .fit)
                    .frame(width: 78, height: 78)
                    .padding(5)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .background(.black.opacity(0.6), in: RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .stroke(lineWidth: 1)
                    )
                
            }

            VStack(alignment: .leading, spacing: 0) {
                // Need to change text based on messages
                Text(title)
                    .fontfont(.system(size: 18 ,weight: .medium, design: .default))
                    .foregroundColor(.black)
                    .padding(5)

                // placeholder paragraph    
                Text(postContent)
                    .font(.system(size: 10 ,weight: .light, design: .default))
                    .foregroundColor(.gray)
                    .padding([.bottom, .trailing, .leading], 10)

            }
        }
        .frame(maxHeight:100)
        .background(.green, in: RoundedRectangle(cornerRadius: 15, style: .continuous)
            .stroke(lineWidth: 1.5)
        )
        .padding(5)
        
    }
}


struct ForumMainView: View {

    var body: some View {
        LazyVStack {
            ForumBlockPost(title: "HELLO WORLD", 

            //if this is throwing a bug you may have to put this all on 1 line
            postContent: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod 
                tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, 
                quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. 
                Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu 
                fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa 
                qui officia deserunt mollit anim id est laborum."
                )
        }
    }
}

#Preview {
    ForumMainView()
}
