//
//  Contacts.swift
//  Loch
//
//  Created by A P on 30/1/2024.
//

import SwiftUI

struct ContactsMainView: View {
    @State private var isAddingUser = false
    var body: some View {
        NavigationView() {
            Image("Thomas")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 30, height: 30)
            List {
                NavigationLink(destination: ContactsDetailView()) {
                    HStack(){
                        Image("Connecting Image")
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 60, height: 60)
                            .clipped()
                            .cornerRadius(50)
                        VStack(alignment: .leading, spacing: 50) {
                            Text("Contact Name")
                                .font(.system(size: 21, weight: .medium, design: .default))
                        }
                    }
                }
            }
            .navigationTitle("Contacts")
        }
    }
}

#Preview {
    ContactsMainView()
}
