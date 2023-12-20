//
//  PersonalInfo.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import SwiftUI

struct PersonalInfo: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Email: \("-")")
                .font(.caption)
                .padding(.leading)
            
            Text("Personal ID: \("-")")
                .font(.caption)
                .padding(.leading)
                .padding(.top,2)
            
            Text("Date of birth: \( "-")")
                .font(.caption)
                .padding(.leading)
                .padding(.top,2)
            
            Text("Gender: \( "-")")
                .font(.caption)
                .padding(.leading)
                .padding(.top,2)
        }
        .padding(.top, 4)
    }
}

#Preview {
    PersonalInfo()
}

