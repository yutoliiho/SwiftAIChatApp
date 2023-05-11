//
//  MenuView.swift
//  AIChatApp
//
//  Created by Yu, Tong on 5/10/23.
//

import Foundation
import SwiftUI

struct MenuView: View {
    @State private var showSecretView: Bool = false
    @State private var showUserProfileView: Bool = false
    
    var body: some View {
        VStack {
            Menu {
                Button(action: {
                    // Add action for "User Profile"
                    showUserProfileView = true
                }) {
                    Label("User Profile", systemImage: "person.circle")
                }
                Button(action: {
                    showSecretView = true
                }) {
                    Label("520 Secret Drink", systemImage: "heart.circle")
                }
                Button(action: {
                    // Add action for "Privacy Policy"
                }) {
                    Label("Privacy Policy", systemImage: "shield")
                }
                Button(action: {
                    // Add action for "Term of Service"
                }) {
                    Label("Term of Service", systemImage: "doc.text")
                }
            } label: {
                Image(systemName: "ellipsis.circle")
                    .resizable()
                    .frame(width: 24, height: 24)
            }
            NavigationLink(destination: SecretView(), isActive: $showSecretView) {
                EmptyView()
            }.hidden()
            NavigationLink(destination: UserProfileView(), isActive: $showUserProfileView) {
                EmptyView()
            }.hidden()
        }
    }
}

struct MenuView_Previews: PreviewProvider {
    static var previews: some View {
        MenuView()
    }
}
