//
//  SideNotifyList.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import SwiftUI

struct NotifyView: View {
    
    @StateObject var viewModel: NotifyViewModel = NotifyViewModel()
    @Environment(\.isPresented) var isPresented
    @Environment(\.openURL) var openURL
    
    var body: some View {
        Rectangle()
            .foregroundColor(.white.opacity(1))
            .ignoresSafeArea()
            .overlay(
                ScrollView(showsIndicators: false) {
                    VStack(alignment: .center) {
                        
                        let data = (1...30).map { "Item \($0)" }
                        
                        ForEach(data, id: \.self) { item in
                            NotifyLayout()
                        }
                    }
                    Spacer()
                }
            )
            .navigationTitle("Notifications")
            .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    NotifyView()
}
