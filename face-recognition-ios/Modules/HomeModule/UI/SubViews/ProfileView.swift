//
//  ProfileView.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import SwiftUI

struct ProfileView: View {
    
    @Binding var visibility: Visibility
    @Binding var showSideBar: Bool
    @Binding var shouldPopToRootView : Bool
    
    var body: some View {
        
        ScrollView {
            VStack(alignment: .leading){
                UserDetails()
                EditUserMenu()
                Line()
                Subtitle(title: "Personal Information")
                PersonalInfo()
                    .padding(.bottom, 8)
                Line()
                Subtitle(title: "Organization Information")
                OrganizationInfo()
                
                NavigationLink {
                    ManageOrganizationView(shouldPopToRootView: $shouldPopToRootView).toolbarRole(.editor)
                } label: {
                    Button2(text: "Manage")
                }
               .padding(.top, 8)
               .padding(.bottom, 8)
                
//                Line()
//                Setting()
                Line()
                AccountCenter(shouldPopToRootView: $shouldPopToRootView)
                    .padding(.bottom, 8)
                
                Line()
                
                Spacer()
            }
        }
        .navigationTitle("").navigationBarTitleDisplayMode(.inline)
        .toolbar {
            ToolbarItem(placement: .navigationBarLeading) {
                Button {
                    withAnimation {
                        showSideBar.toggle()
                    }
                } label: {
                    Image(uiImage: UIImage(named: "menu")!).padding(.leading, 8)
                }
            }
            
        }
        .toolbar(visibility, for: .tabBar)
    }
}

#Preview {
    ProfileView(visibility: .constant(.visible), showSideBar: .constant(false), shouldPopToRootView: .constant(false))
}

