//
//  ProfileHeaderView.swift
//  AIChatApp
//
//  Created by Yu, Tong on 4/27/23.
//

import Foundation
import SwiftUI

struct ProfileHeaderView: View {
    let profileImage: String
    
    var body: some View {
        HStack {
            Image(profileImage)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 80, height: 80)
                .clipShape(Circle())
            Spacer()
        }
        .padding()
    }
}

struct ProfileHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileHeaderView(profileImage: "profile_image_example")
    }
}
