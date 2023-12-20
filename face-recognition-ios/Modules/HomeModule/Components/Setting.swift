//
//  Setting.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import SwiftUI

struct Setting: View {
    
    @State private var showGreeting = true
    
    var body: some View {
        Text("Settings")
            .font(.caption)
            .foregroundColor(.dynamicblack)
            .bold()
            .padding(.top, 16)
            .padding(.leading, 16)
        
        Toggle(isOn: $showGreeting) {
            Text("Notification")
                .font(.caption)
                .padding(.leading, 16)
        }
        .padding(.trailing, 16)
        
        Toggle(isOn: $showGreeting) {
            Text("Alert me if someone detects my customers")
                .font(.caption)
                .padding(.leading, 16)
        }
        .padding(.trailing, 16)
    }
}

#Preview {
    Setting()
}

