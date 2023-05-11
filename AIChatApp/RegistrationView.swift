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
    var onRegistered: (Int) -> Void
    
    @ObservedObject var userSession: UserSession
    @Binding var showRegistrationView: Bool
    
    init(showRegistrationView: Binding<Bool>, onRegistered: @escaping (Int) -> Void, userSession: UserSession) {
        self._showRegistrationView = showRegistrationView
        self.onRegistered = onRegistered
        self.userSession = userSession
    }
    
    var body: some View {
        VStack {
            TextField("Enter your username", text: $username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Button(action: {
                registerUser(username: username, userSession: userSession, onRegistered: { userId in
                    onRegistered(userId)
                    showRegistrationView = false
                })
            }, label: {
                Text("Register")
            })
        }
    }
}
