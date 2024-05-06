//
//  Group Chat adding screen
//  Loch
//
//  Created by Mary on 04/05/2024.
//

import SwiftUI

struct GroupChatitem: View {
    //var uid : Int   please change when avaliable 
    @State var isAdded: Bool = false

    var body: some View {
        HStack {
            ProfilePictureCircle(size: 65, hasBorder: true)
                .padding(6)
                .padding(.leading, 5)

            Text("Nickname here")
                .padding(8)
            
            Spacer()

            Image(systemName: (isAdded ? "checkmark.circle.fill" : "circle"))
                .foregroundColor(.green) 
                .padding()
                .onTapGesture{
                    withAnimation(.easeInOut(duration: 0.3)) {
                        isAdded.toggle()
                    }
                }

        }
        .frame(maxWidth: .infinity, maxHeight: 120, alignment: .leading)
        .padding(5)
    }

}

struct GroupChatsMainView: View {

    var body: some View {

        //header
        HStack {
            Text("New Group Chat")
                .padding(8)
                .font(.system(size: 20, weight: .bold, design: .default))
                .foregroundColor(.white)
                .edgesIgnoringSafeArea(.top)
            Spacer()
            
            Image(systemName: "magnifyingglass")
                .padding(.trailing)
                .foregroundColor(.white)
                .scaleEffect(1.2)
            Image(systemName: "checkmark")
                .padding(.trailing, 8)
                .foregroundColor(.white)
                .scaleEffect(1.2)

        }
        .frame(maxWidth:.infinity, maxHeight: 35, alignment: .leading)
        .padding()
        .background(.green)

        LazyVStack (spacing: 0) {
            ScrollView ([.vertical]) {
                GroupChatitem()
                GroupChatitem()
                GroupChatitem()
                GroupChatitem()
                GroupChatitem()
                GroupChatitem()
                GroupChatitem()
                GroupChatitem()
                GroupChatitem()
            }
            .padding([.top], 10)

        }
    }
}

#Preview {
    GroupChatsMainView()
}
