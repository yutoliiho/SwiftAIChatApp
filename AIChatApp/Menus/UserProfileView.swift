//
//  UserProfileView.swift
//  AIChatApp
//
//  Created by Yu, Tong on 5/10/23.
//

import Foundation
import SwiftUI

struct UserProfileView: View {
    @ObservedObject var userSession: UserSession
    
    var body: some View {
        VStack(alignment: .leading, spacing: 15) {
            Text("User ProfileView")
        }
        .padding()
    }
}

struct UserProfileView_Previews: PreviewProvider {
    static var previews: some View {
        UserProfileView(userSession: UserSession())
    }
}
