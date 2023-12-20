//
//  OrganizationInfo.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import SwiftUI

struct OrganizationInfo: View {
    var body: some View {
        VStack(alignment: .leading) {
            Text("Enterprise name: \("-")")
                .font(.caption)
                .padding(.leading)
            
            Text("Passcode: \("-")")
                .font(.caption)
                .padding(.leading)
                .padding(.top,2)
            
            Text("Joined since: \( "-")")
                .font(.caption)
                .padding(.leading)
                .padding(.top,2)
        }
        .padding(.top, 4)
    }
}

#Preview {
    OrganizationInfo()
}
