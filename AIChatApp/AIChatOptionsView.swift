//
//  AIChatOptionsView.swift
//  AIChatApp
//
//  Created by Yu, Tong on 4/26/23.
//

import Foundation
import SwiftUI

struct AIChatOptionsView: View {
    let aiChatOptions: [AIChatOption]
    @State private var showRegistrationView: Bool = false //true
    @State private var userId: Int?
    @StateObject private var userSession = UserSession()
    
    var body: some View {
        NavigationView {
            List(aiChatOptions) { option in
                if option.name == "Alexander Auchter" {
                    NavigationLink(destination:ContentView(
                        aiChatOption: option, chatbotId: option.chatbotId, userId: userId ?? -1)) {
                        HStack {
                            Image("alex_auchter_img")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 300)
                                .clipShape(Circle())
                                                    
                            VStack(alignment: .leading) {
                                Text(option.name)
                                    .font(.headline)
                                Text(option.description)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
                if option.name == "Amber Wang" {
                    NavigationLink(destination: ContentView(
                        aiChatOption: option, chatbotId: option.chatbotId, userId: userId ?? -1)) {
                        HStack {
                            // Display the profile picture
                            Image("amber_wang_img")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 300)
                                .clipShape(Circle())
                            
                            
                            // Display the name and description
                            VStack(alignment: .leading) {
                                Text(option.name)
                                    .font(.headline)
                                Text(option.description)
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                        }
                    }
                }
            }
            .navigationTitle("Dirtycat")
            .padding()
                        
            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    MenuView(userSession: userSession)
                }
            }
            
            
        }
        .sheet(isPresented: $showRegistrationView) {
            RegistrationView(showRegistrationView: $showRegistrationView, onRegistered: { registeredUserId in
                userSession.userId = registeredUserId
            }, userSession: userSession)
        }
    }
}

// func registerUser(username: String, userSession: UserSession, onRegistered: @escaping () -> Void) {
func registerUser(username: String, userSession: UserSession, onRegistered: @escaping (Int) -> Void) {

    let url = URL(string: "https://python-chatapp-3.herokuapp.com/register")!
    var request = URLRequest(url: url)
    request.httpMethod = "POST"
    request.addValue("application/json", forHTTPHeaderField: "Content-Type")
    let json: [String: Any] = ["username": username]
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
                if let userId = json["user_id"] as? Int {
                    print("User registered with ID: \(userId)")
                    DispatchQueue.main.async {
                        userSession.userId = userId
                        onRegistered(userId)
                    }
                }
            }
        } catch {
            print("Error: \(error.localizedDescription)")
        }
    }.resume()
}

struct AIChatOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        AIChatOptionsView(aiChatOptions: aiChatOptions)
    }
}
