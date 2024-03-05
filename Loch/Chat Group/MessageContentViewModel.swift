//
//  MessageContentViewModel.swift
//  Loch
//
//  Created by Mark on 28/2/2024.
//

import Foundation
import SwiftData

class ChatsContentViewModel: ObservableObject {
    
    private struct Returned: Codable { // JSON container
        // properties match JSON keys
    }
   
    var urlString = ""
    func getData() async {
        print("Getting data from \(urlString)")
        
        // create a URL
        guard let url = URL(string: urlString) else {
            print("ERROR: Could not create URL from \(urlString)")
            return
        }
        
        do {
            let (data, response) = try await URLSession.shared.data(from: url)
            
            // create data structures here
            
        } catch {
            print("ERROR: Could not get data from \(urlString)")
        }
    }
}
