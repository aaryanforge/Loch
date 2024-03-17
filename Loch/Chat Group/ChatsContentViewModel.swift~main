//
//  MessageContentViewModel.swift
//  Loch
//
//  Created by Mark on 28/2/2024.
//

import Foundation
import SwiftData

/*
The View Model is usually where we typically store programming logic and data handling logic.
ObservableObject - closesly looked at by SwiftUI and updates views when it is updated
Codable - enables JSON encoding and decoding
*/

class ChatsContentViewModel: ObservableObject {
    
    private struct Returned: Codable { // JSON container
        // properties match JSON keys
        var classification: String
        var input: String
    }

    @Published var urlString = "127.0.0.1:5000/"//localhost + the message content
    @Published var classification = ""
    
    func getData(messageContents: String) async {
        print("~ Getting data from \(urlString)")

        urlString += _parseMessageContents(messageContents)

        // create a url string to a special URL type
        guard let url = URL(string: urlString) else {
            print("!! ERROR: Could not create URL from \(urlString)")
            return
        }
        
        // grab JSON data from internet
        do {
            let (data, _) = try await URLSession.shared.data(from: url)
            
            // try to decode JSON data into our own data structures
            guard let returned = try? JSONDecoder().decode(Returned.self, from: data) else {
                print("!! JSON ERROR: Could not decode returned JSON data \(urlString)")
                return
            }
            self.classification = returned.classification

        } catch {
            print("!! ERROR: Could not get data from \(urlString)")
        }
    }

    // converts normal text to URL text params | e.g. mark is cool -> mark-is-cool
    private func _parseMessageContents(_ messageContents: String) -> String {
        let content = messageContents.trimmingCharacters(in: .whitespaces)

        if (content == "") {
            return messageContents
        }

        let splitMessage = content.split(separator: " ")
        let newMessage = splitMessage.joined(separator: "-")

        return newMessage
    }
}
