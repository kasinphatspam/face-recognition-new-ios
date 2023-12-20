//
//  CustomerView.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import SwiftUI

struct CustomerView: View {
    
    @Binding var visibility: Visibility
    @Binding var showSideBar: Bool
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            VStack {
                SearchBar()
                CustomerList()
                Spacer()
            }
        }
        .navigationTitle("Customers").navigationBarTitleDisplayMode(.inline)
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
                    Image(uiImage: UIImage(named: "personadd")!).padding(.trailing, 8)
                }
            }
        }
        .toolbar(visibility, for: .tabBar)
    }
}

#Preview {
    CustomerView(visibility: .constant(.visible), showSideBar: .constant(false))
}
