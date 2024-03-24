//
//  ForumBlockView.swift
//  Loch
//
//  Created by Phoenix Liu on 25/2/2024.
//

// Goal: Code and style the post as it appears in the list
// For: Mary
// Due: Saturday 7th March


import SwiftUI


/* 
ForumBlockPostPublicPrivate: Displays the basic contents of each PRIVATE / PUBLIC forum posting, before you click into them
@Params:
    imageLink: String 
        Takes in a link to the image to be posted (optional)
    ttile: String
        Name of the Thread
    postContent:
        Brief content of the post
    postType:
        type of post, either public or private
*/
struct ForumBlockPostPublicPrivate: View {
    var imageLink: String?
    var title: String
    var postContent: String
    var postType: String // maybe set as either "priv" or "pub", should make constants for these

    var body: some View {
        HStack{
            Spacer()
            
            if (imageLink != nil){
                Image(imageLink!)
                    .resizable()
                    .aspectRatio(CGSize(width:1, height: 1), contentMode: .fit)
                    .frame(width: 78, height: 78)
                    .padding(5)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .background(.black.opacity(0.6), in: RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .stroke(lineWidth: 1)
                    )
                    .padding([.leading], 10)
                    .padding([.vertical])
                
            }

            VStack(alignment: .leading, spacing: 0) {
                // Need to change text based on messages
                Text(title)
                    .font(.system(size: 18 ,weight: .medium, design: .default))
                    // PL- Changed .fontfont to .font
                    .foregroundColor(postType == "priv" ? .blackBlue800 : .white)
                    .padding(5)
                    .frame(maxWdith: .infinity, alignment: .topLeading)

                Spacer() 
                    .frame(maxHeight: 5)

                // placeholder paragraph    
                Text(postContent)
                    .font(.system(size: 10 ,weight: .light, design: .default))
                    .foregroundColor(postType == "priv" ? .grey800 : .white)
                    .padding([.bottom, .trailing, .leading], 10)
                    .frame(maxWdith: .infinity, alignment: .bottomLeading)
                    .frame(minHeight: (imageLink != nil ? 50 : 0))

            }
            .frame(maxWdith: .infinity)
            .padding(5)
        }
        .frame(maxWdith: .infinity, maxHeight:100)
        .if (postType == "priv") { view in
            view.background(green500, in: RoundedRectangle(cornerRadius: 15, style: .continuous).stroke(lineWidth: 1.5))
        }
        .if (postType == "pub") { view in
            view.background(.blue800, in: RoundedRectangle(cornerRadius: 15, style: .continuous))
        }
        .padding(5)
        
    }
}

/*ForumBlockPostSponsored: Displays the basic contents of each forum SPONSORED posting, before you click into them
@Params:
    imageLink: String 
        Takes in a link to the image to be posted (optional)
    ttile: String
        Name of the Thread
    postContent:
        Brief content of the post
*/
struct ForumBlockPostSponsored: View {
    var imageLink: String?
    var title: String

    var body: some View {
        HStack{
            ZStack(alignment: .trailing) {
                // Need to change text based on messages
                Text(title)
                    .font(.system(size: 20 ,weight: .medium, design: .default))
                    .foregroundColor( .blackGreen800)
                    .padding(5)
                    .padding([.leading], 8)
                    

            }

            Spacer()

            if (imageLink != nil){
                Image(imageLink!)
                    .resizable()
                    .aspectRatio(CGSize(width:1, height: 1), contentMode: .fit)
                    .frame(width: 85, height: 85)
                    .padding(5)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
                    .background(.black.opacity(0.6), in: RoundedRectangle(cornerRadius: 15, style: .continuous)
                        .stroke(lineWidth: 1)
                    )
                    .padding([.vertical])
                
            }
        }
        .frame(maxWidth: .infinity, maxHeight:150)
        .background(.lightYellow, in: RoundedRectangle(cornerRadius: 15, style: .continuous))
        .padding(5)
        
    }
}
struct ForumBlockView: View {
    var body: some View {
        LazyVStack {
            ForumBlockPostPublicPrivate(
                imageLink: "Connecting Image", 
                title: "HELLO WORLD",
                //if this is throwing a bug you may have to put this all on 1 line
                postContent: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.", 
                postType: "priv"
            )
        }
    }
}

#Preview {
    ForumBlockView()
}
