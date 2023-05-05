//
//  AIChatAppApp.swift
//  AIChatApp
//
//  Created by Yu, Tong on 4/26/23.
//

import SwiftUI

@main
struct AIChatAppApp: App {
    var body: some Scene {
        WindowGroup {
            AIChatOptionsView(aiChatOptions: aiChatOptions)
        }
    }
}

