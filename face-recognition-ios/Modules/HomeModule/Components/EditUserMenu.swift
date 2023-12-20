//
//  EditUserMenu.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import SwiftUI

struct EditUserMenu: View {
    var body: some View {
        HStack {
            NavigationLink {
               EditProfileView()
           } label: {
               Button1(text: "Edit profile")
           }
           .padding(.leading, 24)
            
            NavigationLink {
               ChangePasswordView()
           } label: {
               Button1(text: "Change password")
           }
           .padding(.leading, 8)
            Spacer()
        }
    }
}

#Preview {
    EditUserMenu()
}
