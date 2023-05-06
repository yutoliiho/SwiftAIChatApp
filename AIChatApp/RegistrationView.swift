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
        let url = URL(string: "http://localhost:3000/register")!
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
                    if let success = json["success"] as? Bool, success, let userId = json["user_id"] as? Int {
                        DispatchQueue.main.async {
                            self.onRegistered(userId)
                            self.presentationMode.wrappedValue.dismiss()
                        }
                    }
                }
            } catch {
                print("Error: \(error.localizedDescription)")
            }
        }.resume()
    }

}
