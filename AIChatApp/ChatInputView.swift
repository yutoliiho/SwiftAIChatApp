//
//  ChatInputView.swift
//  AIChatApp
//
//  Created by Yu, Tong on 4/26/23.
//

import Foundation
import SwiftUI

struct ChatInputView: View {
    @Binding var message: String
    var sendAction: () -> Void
    
    var body: some View {
        HStack {
            TextField("Type your message...", text: $message)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .frame(height: 45)
            
            Button(action: sendAction) {
                Text("Send")
                    .foregroundColor(.white)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 20)
                    .background(Color.blue)
                    .cornerRadius(10)
            }
        }
        .padding()
    }
}

struct ChatInputView_Previews: PreviewProvider {
    static var previews: some View {
        ChatInputView(message: .constant(""), sendAction: {})
    }
}

