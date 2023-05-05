//
//  AIChatOption.swift
//  AIChatApp
//
//  Created by Yu, Tong on 4/26/23.
//

import Foundation
struct AIChatOption: Identifiable {
    let id = UUID()
    let name: String
    let description: String
    let profileImage: String // New property for the profile picture
}

