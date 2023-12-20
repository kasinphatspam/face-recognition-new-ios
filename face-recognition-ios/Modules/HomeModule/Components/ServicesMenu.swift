//
//  ServiceMenu.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import SwiftUI

struct ServicesMenu: View {
    
    @Binding var visibility: Visibility
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(alignment: .top, spacing: 16) {
                
                NavigationLink {
                    DetectorCameraView()
                       .navigationTitle("Face Detector")
                       .toolbarTitleDisplayMode(.inline)
                       .onAppear() {
                           visibility = .hidden
                       }
                       .onDisappear() {
                           visibility = .visible
                       }
               } label: {
                   HStack {
                       Image(systemName: "faceid").resizable().frame(width: 20, height: 20)
                       Text("Face scan").font(.caption).padding(.leading, 8)
                   }
                   .frame(width: 140, height: 40)
                   .background(Rectangle().fill(Color.gray.opacity(0.2)).cornerRadius(10))
               }
                
                HStack {
                    Image(systemName: "person.badge.plus").resizable().scaledToFit().frame(width: 20, height: 20)
                    Text("Customer Registration").font(.caption).padding(.leading, 4)
                }
                .frame(width: 200, height: 40)
                .background(Rectangle().fill(Color.gray.opacity(0.2)).cornerRadius(10))
                
            }
            .padding(.leading, 16)
            .padding(.trailing, 16)
        }
    }
}

#Preview {
    ServicesMenu(visibility: .constant(.visible))
}
