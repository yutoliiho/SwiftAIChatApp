//
//  ChatView.swift
//  AIChatApp
//
//  Created by Yu, Tong on 4/26/23.
//

import Foundation
import SwiftUI

struct ChatView: View {
    let messages: [ChatMessage]
    
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 15) {
                ForEach(messages) { message in
                    Text(message.message)
                        .padding(10)
                        .background(message.isUser ? Color.blue : Color.gray)
                        .foregroundColor(.white)
                        .cornerRadius(10)
                        .frame(maxWidth: UIScreen.main.bounds.width * 0.6, alignment: message.isUser ? .trailing : .leading)
                }
            }
            .padding()
        }
    }
}

struct ChatView_Previews: PreviewProvider {
    static var previews: some View {
        ChatView(messages: [ChatMessage(message: "Hi!", isUser: true), ChatMessage(message: "Hello!", isUser: false)])
    }
}
