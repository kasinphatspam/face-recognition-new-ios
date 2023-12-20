//
//  Button.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import SwiftUI

struct Button1: View {
    
    @State private var text: String
    
    init(text: String) {
        self.text = text
    }
    
    var body: some View {
        HStack {
            Image(systemName: "person.text.rectangle.fill").resizable().scaledToFit().frame(width: 20, height: 20).padding(.leading, 16)
            Text(text).font(.caption).padding(.leading, 8).padding(.trailing, 16)
        }
        .frame(height: 40)
        .background(Rectangle().fill(Color.gray.opacity(0.2)).cornerRadius(10))
    }
}

struct Button2: View {
    
    @State private var text: String
    
    init(text: String) {
        self.text = text
    }
    
    var body: some View {
        HStack {
            Text("Manage").font(.caption).padding(.leading, 8)
        }
        .frame(maxWidth: .infinity, minHeight: 40, maxHeight: 40)
        .background(Rectangle().fill(Color.gray.opacity(0.2)).cornerRadius(10))
        .padding(.trailing, 16)
        .padding(.leading, 16)
    }
}

#Preview {
    VStack {
        Button1(text: "Edit profile")
        Button2(text: "Manage")
    }
}

