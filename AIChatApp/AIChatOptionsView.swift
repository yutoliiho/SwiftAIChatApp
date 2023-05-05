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
    
    var body: some View {
        NavigationView {
            List(aiChatOptions) { option in
                if option.name == "Alexander Auchter" {
                    NavigationLink(destination: ContentView(aiChatOption: option)) {
                        HStack {
                            // Display the profile picture
                            // Image(option.profileImage)
                            Image("alex_auchter_img")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
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
                if option.name == "Amber Wang" {
                    NavigationLink(destination: ContentView(aiChatOption: option)) {
                        HStack {
                            // Display the profile picture
                            // Image(option.profileImage)
                            Image("amber_wang_img")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
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
                if option.name == "Clement Delangue" {
                    NavigationLink(destination: ContentView(aiChatOption: option)) {
                        HStack {
                            // Display the profile picture
                            // Image(option.profileImage)
                            Image("clem_img")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
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
            .navigationTitle("Messages")
        }    
    }
}

struct AIChatOptionsView_Previews: PreviewProvider {
    static var previews: some View {
        AIChatOptionsView(aiChatOptions: aiChatOptions)
    }
}
