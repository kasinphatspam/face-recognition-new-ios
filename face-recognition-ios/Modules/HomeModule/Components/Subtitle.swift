//
//  Subtitle.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import SwiftUI

struct Subtitle: View {
    
    @State private var title: String
    
    init(title: String) {
        self.title = title
    }
    
    var body: some View {
        HStack {
            Text(self.title)
                .font(.caption)
                .foregroundColor(.dynamicblack)
                .bold()
                .padding(.top, 16)
                .padding(.leading, 16)
            Spacer()
        }
        .padding(.top, 8)
    }
}

#Preview {
    Subtitle(title: "Title")
}

