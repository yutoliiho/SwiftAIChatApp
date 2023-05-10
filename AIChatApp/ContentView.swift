//
//  ContentView.swift
//  AIChatApp
//
//  Created by Yu, Tong on 4/26/23.
//

import Foundation
import SwiftUI

struct ContentView: View {
    let aiChatOption: AIChatOption
    let chatbotId: Int 
    @State private var messages: [ChatMessage] = []    
    @State private var currentMessage: String = ""
    @State private var userId: Int?
    
    var body: some View {
        VStack {
            // Display the profile image based on the selected AI chat option
            Image(aiChatOption.profileImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .clipShape(Circle())
                .padding()
            
            ChatView(messages: messages)
            
            ChatInputView(message: $currentMessage, sendAction: {
                if let userId = userId {
                    self.sendMessage(userId: userId, content: self.currentMessage, chatbotId: self.chatbotId) // Pass chatbotId here
                }
            })
        }
    }

    func sendMessage(userId: Int, content: String, chatbotId: Int) {
        let url = URL(string: "https://python-chatapp-3.herokuapp.com/send_message")!
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.addValue("application/json", forHTTPHeaderField: "Content-Type")
        let json: [String: Any] = [
            "user_id": userId,
            "content": content,
            "chatbot_id": chatbotId
        ]
        let jsonData = try? JSONSerialization.data(withJSONObject: json)
        request.httpBody = jsonData
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    print(json)
                    if let responseText = json["response_text"] as? String {
                        print("userId: \(userId)")
                        print("chatbotId: \(chatbotId)")
                        print("content: \(content)")
                        print("Chatbot response: \(responseText)")
                        // Process the chatbot response
                    }
                }
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }.resume()
    }
    
    func getMessages(userId: Int) {
        let url = URL(string: "http://localhost:3000/get_messages?user_id=\(userId)")!
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data, error == nil else {
                print("Error: \(error?.localizedDescription ?? "Unknown error")")
                return
            }
            
            do {
                if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
                    print(json)
                    if let messages = json["messages"] as? [[String: Any]] {
                        print("Messages: \(messages)")
                        // Process the conversation messages
                    }
                }
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }.resume()
    }


}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a sample AI chat option for the preview
        let sampleOption = AIChatOption(name: "Friendly AI", description: "A friendly AI that loves to chat.", profileImage: "alex_auchter_img", chatbotId: 1)

        // Pass the sample option to ContentView
        ContentView(aiChatOption: sampleOption,chatbotId: 1)
    }
}
