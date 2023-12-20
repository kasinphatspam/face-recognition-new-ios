//
//  HomeTabView.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import SwiftUI

struct HomeTabView: View {
    
    @Binding var shouldPopToRootView : Bool
    @State private var showSideBar = false
    @State private var ignoreHideSideBar = false
    
    var body: some View {
        ZStack(alignment: .leading) {
            Rectangle()
                .foregroundColor(.white)
                .zIndex(0)
                .overlay(
                    BottomNavigationBar(showSideBar: $showSideBar, shouldPopToRootView: $shouldPopToRootView)
                )
            if self.showSideBar == true {
                SideMenu(ignore: $ignoreHideSideBar, showSideBar: $showSideBar)
                    .transition(.move(edge: .leading))
                    .zIndex(1)
            }
        }
    }
}

#Preview {
    HomeTabView(shouldPopToRootView: .constant(false))
}
