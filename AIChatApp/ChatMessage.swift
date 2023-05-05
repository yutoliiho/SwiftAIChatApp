//
//  ChatMessage.swift
//  AIChatApp
//
//  Created by Yu, Tong on 4/26/23.
//

import Foundation
import SwiftUI

struct ChatMessage: Identifiable {
    let id = UUID()
    let message: String
    let isUser: Bool
}
