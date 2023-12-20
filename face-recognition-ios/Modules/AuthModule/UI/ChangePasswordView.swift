//
//  ChangePasswordView.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import SwiftUI

struct ChangePasswordView: View {
    
    @State var oldPassword = ""
    @State var newPassword = ""
    
    var body: some View {
        NavigationView {
            Form {
            
                Section(header: Text("Security")) {
                    SecureField("Old password", text: $oldPassword)
                    SecureField("New password", text: $newPassword)
                    SecureField("Confirm new password", text: $newPassword)
                }
                
                Button("Continue") {
                    
                }
                
                Button(action: {
                    
                }) {
                    Text("Discard")
                        .foregroundColor(.red)
                }
            }
        }
    }
}

#Preview {
    ChangePasswordView()
}
