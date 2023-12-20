//
//  DashboardView.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import SwiftUI

struct DashboardView: View {
    
    @Binding var visibility: Visibility
    @Binding var showSideBar: Bool
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                SearchBar()
                Subtitle(title: "Enterprise Details")
                OrganizationDetails()
                Subtitle(title: "Services")
                ServicesMenu(visibility: $visibility)
                Subtitle(title: "Weekly Report")
                WeeklyReport()
                Spacer()
            }
        }
        .navigationTitle("Face Prove").navigationBarTitleDisplayMode(.inline)
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
                Button {
                    
                } label: {
                    Image(uiImage: UIImage(named: "notify")!).padding(.trailing, 8)
                }
            }
        }
        .toolbar(visibility, for: .tabBar)
    }
}

#Preview {
    DashboardView(visibility: .constant(.visible), showSideBar: .constant(true))
}
