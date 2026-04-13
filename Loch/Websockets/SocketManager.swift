//
//  SocketManager.swift
//  Loch
//
//  Created by Phoenix Liu on 6/5/2024.
//

import Foundation
import SwiftUI

struct chatView: View {
    @State private var message = ""
    @StateObject private var helper = HelperObject()
    private var manager = SocketManager()
    
    var body: some View {
        VStack {
            ForEach(0..<helper.latestMessages.count, id:\.self) { ind in
                Text(helper.latestMessages[ind])
            }
            TextField("message", text: $message)
                .onSubmit {
                    print("message submitted")
//                    manager.send(msg: message)
                    manager.send(msg: message, sender: "Pala", roomId: "12345", timestamp: "00", ind: "1")
                    message = ""
                }
        }
            .task {
                manager.start(helper)
            }
    }
}

class SocketManager: NSObject, URLSessionWebSocketDelegate {
    private var websocket: URLSessionWebSocketTask?
    private var connectionOpen = false
    private var latestMsg = ""
    var helper: HelperObject?
    
//    init(helper: HelperObject) {
//        self.helper = helper
//    }
//    @Published private var latestMessage = "nothin gyet"
    
    //
    func start(_ help: HelperObject) {
        
        self.helper = help
        let session = URLSession(
            configuration: .default,
            delegate: self,
            delegateQueue: .main
        )
        
        let url = URL(string: "wss://1yr0q8yo8i.execute-api.ap-southeast-2.amazonaws.com/production/")
        
        websocket = session.webSocketTask(with: url!)
        websocket!.resume()
    }
    
    func send(msg: String, sender: String, roomId: String, timestamp: String, ind: String) {
        let jsonString = """
            {"Username":"\(sender)","Message":"\(msg)","Timestamp":"\(timestamp)","Index":"\(ind)","Initialise":"False"}
        """
//
//        let jsonData = Data(jsonString.utf8)
//
//        websocket?.send(.data(jsonData), completionHandler: { err in
//            if let e = err {
//                print("error sending message: \(e)")
//            }
//        })
        
        if self.connectionOpen == false {
            print("tried to send, but connection closed")
            return
        }
//        struct Dog: Codable {
//            var name: String
//            var owner: String
//        }
//
//        // Encode
//        let dog = Dog(name: "Rex", owner: "Etgar")
        
//        let message = MessageObject(body: "hello from pala", sender: "pala", roomId: 12345, timestamp: 00, index: 1)
//        let jsonEncoder = JSONEncoder()
//        let jsonData = try jsonEncoder.encode(message)
//        let json = String(data: jsonData, encoding: String.Encoding.utf8)
    
        websocket?.send(.string(jsonString), completionHandler: { err in
            if let e = err {
                print("error sending message: \(e)")
            }
        })
    }
    
    func receive() {
        if self.connectionOpen == false {
            print("tried to receive, but connection closed")
            return
        }
        websocket?.receive(completionHandler: { [weak self] res in
            switch res {
            
            case .success(let msg):
                switch msg {
                case .string(let latest):
                    
                    //                do {
                    //                    let messageObject = try JSONDecoder().decode(MessageObject.self, from: json)
                    //
                    //                } catch {
                    //                    print("Error decoding JSON: \(error.localizedDescription)")
                    //                }
                    print("recieved string: \(latest)")
                    self?.helper?.latestMessages.append(latest)
                case .data(let data):
                    self?.helper?.latestMessages.append(String(decoding: data, as: UTF8.self))

                    print("recieved data: \(data)")
                }
//                (self.helper!).latestMessage = "new one"
                print("received message: \(msg)")
//                latestMessage = msg
                
            case .failure(let err):
                print("error receiving message: \(err)")
            }
            self?.receive()
        })
    }
    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didOpenWithProtocol protocol: String?) {
        print("connection established")
        self.connectionOpen = true
//        self.send(msg: "donkey")
//        websocket?.send(.string("hi from xcode"), completionHandler: { err in
//            if let e = err {
//                print("error sending message: \(e)")
//            }
//        })
        self.receive()
    }
    
    func urlSession(_ session: URLSession, webSocketTask: URLSessionWebSocketTask, didCloseWith closeCode: URLSessionWebSocketTask.CloseCode, reason: Data?) {
        
        print("connection closed")
        self.connectionOpen = false
    }
    
//    func changeMsg(msg: String) {
//        if self.connectionOpen == true {
////            self.send(msg: msg)
//            self.receive()
//        }
//    }
    
}


class HelperObject: ObservableObject {
    @Published var latestMessages: [String] = []
    
//    init() {
//        self.latestMessage = "nothin gyet"
//    }
    
//    func updateMsg(msg: String) {
//        self.latestMessage = msg
//    }
}


struct MessageObject: Codable {
    var body: String
    var sender: String
    var roomId: Int
    var timestamp: Int
    var index: Int
}


