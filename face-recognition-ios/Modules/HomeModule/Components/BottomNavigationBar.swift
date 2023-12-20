//
//  BottomNavigationBar.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import SwiftUI

import SwiftUI

struct BottomNavigationBar: View {
    
    @State private var tabTitle = "Dashboard"
    @State private var selection = 1
    @State private var searchText = ""
    @State private var visibility: Visibility = .visible
    @Binding var showSideBar: Bool
    @Binding var shouldPopToRootView : Bool
    
    var body: some View {
        
        TabView(selection:$selection) {
            NavigationView {
                DashboardView(visibility: $visibility, showSideBar: $showSideBar)
            }
            .tabItem {
                Image(uiImage: UIImage(named: "home")!)
                Text("Home")
            }
            .tag(1)
            
            NavigationView {
                OrganizationView(visibility: $visibility, showSideBar: $showSideBar)
            }
            .tabItem {
                Image(uiImage: UIImage(named: "enterprise")!)
                Text("Organization")
            }
            .tag(2)
            
            NavigationView {
                CustomerView(visibility: $visibility, showSideBar: $showSideBar)
            }
            .tabItem {
                Image(uiImage: UIImage(named: "group")!)
                Text("Customers")
            }
            .tag(3)
            
            NavigationView {
                ProfileView(visibility: $visibility, showSideBar: $showSideBar, shouldPopToRootView: $shouldPopToRootView)
            }
            .tabItem {
                Image(uiImage: UIImage(named: "me")!)
                Text("Me")
            }
            .tag(4)
        }
        .accentColor(.black)
    }
}

#Preview {
    BottomNavigationBar(showSideBar: .constant(false), shouldPopToRootView: .constant(false))
}
