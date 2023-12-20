//
//  Logo.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import SwiftUI

struct LogoView: View {
    var body: some View {
        HStack(spacing: 4) {
            Image(uiImage: UIImage(named: "icon")!)
                .resizable()
                .frame(width: 60, height: 60)
        }
    }
}

#Preview {
    LogoView()
}

