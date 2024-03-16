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
func openOverlayFilters() { print ("openOverlayFilters") }


struct FilterSort: View {
    @State private var isFilterSortOverlayOpen = false
    @State private var sortBy: String = "Hottest"
    var body: some View {
        HStack {
            Image(systemName: sortBy == "Hottest" ? "flame.fill" : "stopwatch")
                .foregroundColor(.white)
                .padding([.leading], 15)
            Text(sortBy)
                .foregroundColor(.white)


            Spacer()

            HStack{
                Text("Sort / Filter")
                    .foregroundColor(.white)
            }
            .padding(10)
//            .onTapGesture(
//                withAnimation(.easeInOut(duration: 1.0)){
//                    isFilterSortOverlayOpen.toggle()
//                }
//            )
        }
        .frame(maxHeight: 40) 
        .background(.gray)
        .overlay(filterOverlay)
    }

    // to open filter/sort overlay
    @ViewBuilder private var filterOverlay: some View {
        if isFilterSortOverlayOpen {
            VStack{
                //sort options
                Text("Sort")
                    .padding(5)
                    .bold()
                    .foregroundColor(.white)
                HStack{
                    //sort by hottest
                    Image(systemName: "flame.fill")
                    .padding()
                    Button(action: {
                        Task {
                            sortBy = "Hottest"
                            isFilterSortOverlayOpen.toggle()
                            //NEED TO ADD SORT FUNCITON
                        }
                    }, label: {
                        Text("Hottest")
                            .foregroundColor(.white)
                    })
                    .padding(10)

                    Spacer()
                    
                    Image(systemName:"stopwatch")
                    .padding()
                    Button(action: {
                        Task {
                            sortBy = "Latest"
                            isFilterSortOverlayOpen.toggle()
                            //NEED TO ADD SORT FUNCITON
                        }
                    }, label: {
                        Text("Latest")
                        .foregroundColor(.white)
                    })
                    .padding(10)
                }

                Text("Filter")
                    .padding(5)
                    .bold()
                    .foregroundColor(.white)
                HStack{

                }
            }
            .background(.gray)
            .padding(5)
        }
    }
}

struct ForumHeadView: View {
    
    @State private var isAddNewForumSheetOn = false
    
    var body: some View {
        VStack (spacing: 0) {
            // top navbar
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
                        isAddNewForumSheetOn.toggle()
                    }
                }, label: {
                    Image(systemName: "plus")
                    .foregroundColor(.white)
                })
                .padding(10)
                .sheet(
                    isPresented: $isAddNewForumSheetOn,
                    content: {
                        ForumAddNewView()
                    })
            }
            .padding(10)
            .background(.green)
            .frame(idealHeight:80)

            FilterSort()
        }
    }
}

#Preview {
    ForumHeadView()
}
