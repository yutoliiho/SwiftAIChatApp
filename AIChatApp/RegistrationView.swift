//
//  RegistrationView.swift
//  AIChatApp
//
//  Created by Yu, Tong on 5/6/23.
//

import Foundation
import SwiftUI

struct RegistrationView: View {
    @State private var username: String = ""
    @Environment(\.presentationMode) var presentationMode
    var onRegistered: (Int) -> Void
    
    var body: some View {
        VStack {
            TextField("Enter your username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                registerUser(username: username)
            }, label: {
                Text("Register")
            })
        }
    }
    
    func registerUser(username: String) {
        // The registerUser function code from the previous steps
        // When the user is registered successfully, call onRegistered with the received user ID
        // and dismiss the registration view:
        // onRegistered(userId)
        // presentationMode.wrappedValue.dismiss()
    }
}