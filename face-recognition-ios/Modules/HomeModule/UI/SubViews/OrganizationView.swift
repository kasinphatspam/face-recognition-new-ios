//
//  OrganizationView.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import SwiftUI

struct OrganizationView: View {
    
    @Binding var visibility: Visibility
    @Binding var showSideBar: Bool
    @Binding var shouldPopToRootView: Bool
        
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                SearchBar()
                Subtitle(title: "Organization Details")
                OrganizationDetails()
                Subtitle(title: "Employees")
                EmployeeList()
                Spacer()
            }
        }
        .navigationTitle("Organization").navigationBarTitleDisplayMode(.inline)
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
            
            ToolbarItem(placement: .navigationBarTrailing) {
                NavigationLink {
                    ManageOrganizationView(shouldPopToRootView: $shouldPopToRootView).toolbarRole(.editor)
                } label: {
                    Image(uiImage: UIImage(named: "setting")!).padding(.trailing, 8)
                }
            }
        }
        .toolbar(visibility, for: .tabBar)
    }
}

#Preview {
    OrganizationView(visibility: .constant(.visible), showSideBar: .constant(false), shouldPopToRootView: .constant(false))
}

