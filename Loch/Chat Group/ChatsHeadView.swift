// //
// //  ChatsHeadView.swift
// //  Loch
// //
// //  Created by Phoenix Liu on 25/2/2024.
// //

// // Goal: Create an unstyled search box. When the user enters a query in the search box and presses enter, the ChatsDetailView page should load up the relevant texts
// // For: Mark
// // Due: Thursday 7th March

// import SwiftUI 
// import SwiftData

// struct ChatsHeadView: View {
    
//     @State private var isTextSearchSheetOn = false
//     @State private var isCalling = false
//     @State private var isSettings = false
    
//     // TODO: as messages from every person is cached, figure out a way to filter messages of the current person user is talking to
    
//     var body: some View {
//         HStack {
//             ProfilePictureCircle(size: 30, hasBorder: true)
//                 .padding(6)
//                 .padding(.leading, 5)
            
//             VStack {
//                 Text("Friend Nickanme")
//                     .padding(.bottom, 5)
//                     .font(.system(size: 12,weight: .bold, design: .default))
//                     .foregroundColor(.black)
//                     .edgesIgnoringSafeArea(.top)
                
//                 Text("Friend Name")
//                     .padding(.bottom, 5)
//                     .font(.system(size: 8, design: .default))
//                     .foregroundColor(.gray)
//                     .edgesIgnoringSafeArea(.top)
//             }
//             .padding(.leading, 5)
            
//             Spacer()

//             Button {
//                 // do something
//                 isTextSearchSheetOn.toggle()
//             } label: {
//                 Label("Search", systemImage: "magnifyingglass")
//             }
//             .sheet(
//                 isPresented: $isTextSearchSheetOn,
//                 content: {
//                     ChatsHeadTextSearchView()
//             })
//             .padding(.trailing)
//             .foregroundColor(.white)
//             .scaleEffect(1.2)
            
//             Button {
//                 isCalling.toggle()
//             } label: {
//                 Label("Call", systemImage: "phone.fill")
//             }
//             .sheet(
//                 isPresented: $isCalling,
//                 content: {
//                     CallView()
//             })
//             .padding(.trailing)
//             .foregroundColor(.white)
//             .scaleEffect(1.2)

//             Image(systemName: "ellipsis")
//                 .padding(.trailing)
//                 .foregroundColor(.white)
//                 .scaleEffect(1.5)
//             .sheet(
//                 isPresented: $isSettings,
//                 content: {
//                     ChatsToolbarViewPM()
//             })
//             .onTapGesture{
//                 isOn.toggle()
//             }
//         }
//         .frame(maxWidth:.infinity, maxHeight: 65, alignment: .leading)
//         .padding()
//         .background(.green)

//     }
// }

// #Preview {
//     ChatsHeadView()
// }


