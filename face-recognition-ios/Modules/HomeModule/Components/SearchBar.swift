//
//  SearchBar.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import SwiftUI

struct SearchBar: View {
    
    var body: some View {
        
        NavigationLink {
            SearchView()
        } label: {
            HStack(spacing: 15) {
                HStack(spacing: 8) {
                    Image(uiImage: UIImage(named: "search")!)
                        .resizable()
                        .frame(width: 12, height: 12)
                        .padding(.leading, 8)
                    
                    Text("Search")
                        .font(.caption)
                        .padding(.leading, 8)
                    Spacer()
                }
                .frame(maxWidth: .infinity)
                .padding(.vertical, 10)
                .padding(.horizontal, 15)
                .background {
                    RoundedRectangle(cornerRadius: 4, style: .continuous)
                        .fill(.gray)
                        .opacity(0.1)
                }
            }
            .padding(.horizontal)
        }
    }
}

#Preview {
    SearchBar()
}


