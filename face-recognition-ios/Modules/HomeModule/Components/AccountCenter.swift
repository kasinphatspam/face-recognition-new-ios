//
//  AccountCenter.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import SwiftUI

struct AccountCenter: View {
    
    @StateObject var viewModel: AccountCenterViewModel = AccountCenterViewModel()
    @Binding var shouldPopToRootView : Bool
    @State private var isPresentingLogoutConfirm: Bool = false
    @State private var isPresentingDeleteAccountConfirm: Bool = false
    
    var body: some View {
        
        VStack(alignment: .leading, content: {
            Text("Account Center")
                .font(.caption)
                .foregroundColor(.dynamicblack)
                .bold()
                .padding(.top, 16)
                .padding(.leading, 16)
            
            Text("If you delete your account, it will be removed within 24 hours.")
                .font(.caption)
                .foregroundColor(.dynamicblack)
                .padding(.leading, 16)
        
            
            Button {
                isPresentingLogoutConfirm = true
           } label: {
               HStack {
                   Text("Sign out").font(.caption).padding(.leading, 8).foregroundColor(.red)
               }
               .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
               .background(Rectangle().fill(Color.gray.opacity(0.2)).cornerRadius(10))
           }
           .padding(.top, 8)
           .padding(.trailing, 16)
           .padding(.leading, 16)
            
            Button {
                isPresentingDeleteAccountConfirm = true
           } label: {
               HStack {
                   Text("Delete account").font(.caption).padding(.leading, 8).foregroundColor(.red)
               }
               .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
               .background(Rectangle().fill(Color.gray.opacity(0.2)).cornerRadius(10))
           }
           .padding(.top, 8)
           .padding(.trailing, 16)
           .padding(.leading, 16)
        })
        .confirmationDialog("Are you sure?",
             isPresented: $isPresentingDeleteAccountConfirm) {
             Button("Delete account ?", role: .destructive) {
                 
              }
            }
        .confirmationDialog("Are you sure?",
             isPresented: $isPresentingLogoutConfirm) {
             Button("Sign out ?", role: .destructive) {
                 viewModel.logout()
                 self.shouldPopToRootView = true
              }
            }
    }
}

#Preview {
    AccountCenter(shouldPopToRootView: .constant(false))
}
