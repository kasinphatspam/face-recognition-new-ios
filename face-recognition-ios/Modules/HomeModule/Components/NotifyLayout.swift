//
//  NotifyLayout.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import SwiftUI

struct NotifyLayout: View {
    var body: some View {
        VStack(alignment: .leading) {
            
            ZStack(alignment: .leading) {
                Rectangle()
                    .foregroundColor(.white)
                    .cornerRadius(16)
                VStack(alignment: .leading) {
                    Text("Notification").foregroundColor(.black).font(.headline)
                    Text("Description").foregroundColor(.black).font(.caption)
                }
                .padding(.horizontal, 16)
            
            }
            Spacer()
        }
        .frame(height: 80)
        .padding(.horizontal, 16)
    }
}

#Preview {
    NotifyLayout()
}
