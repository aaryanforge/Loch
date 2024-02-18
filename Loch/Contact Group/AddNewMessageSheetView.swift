//
//  AddNewMessageSheetView.swift
//  Loch
//
//  Created by Phoenix Liu on 18/2/2024.
//

import SwiftUI

struct AddContactSheet: View {
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        Text("nothing yet")
            .onTapGesture {
                dismiss()
            }
    }
}

#Preview {
    AddContactSheet()
}
