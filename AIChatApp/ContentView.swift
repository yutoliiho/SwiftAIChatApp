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
    @State private var messages: [ChatMessage] = []
    @State private
    var currentMessage: String = ""
    
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
            
            ChatInputView(message: $currentMessage, sendAction: sendMessage)
        }
    }
    
    private func sendMessage() {
        // Store the user's message in a temporary variable
        let userMessage = currentMessage

        // Add the user's message to the chat
        messages.append(ChatMessage(message: userMessage, isUser: true))

        currentMessage = ""
        
        // Call the AI chat API and add the AI's response to the messages array
        AIChatAPI.getAIResponse(input: userMessage) { response in
            messages.append(ChatMessage(message: response, isUser: false))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        // Create a sample AI chat option for the preview
        let sampleOption = AIChatOption(name: "Friendly AI", description: "A friendly AI that loves to chat.", profileImage: "alex_auchter_img")
        // Pass the sample option to ContentView
        ContentView(aiChatOption: sampleOption)
    }
}
