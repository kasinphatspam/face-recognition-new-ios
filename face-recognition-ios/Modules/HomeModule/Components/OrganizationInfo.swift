//
//  OrganizationInfo.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import SwiftUI

struct OrganizationInfo: View {
    
    @StateObject var viewModel: OrganizationDetailsViewModel = OrganizationDetailsViewModel()
    @State private var organization: Organization? = nil
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Organization name: \(organization?.name ?? "")")
                .font(.caption)
                .padding(.leading)
            
            Text("Passcode: \(organization?.passcode ?? "")")
                .font(.caption)
                .padding(.leading)
                .padding(.top,2)
            
            Text("Created At: \(organization?.codeCreatedTime ?? "")")
                .font(.caption)
                .padding(.leading)
                .padding(.top,2)
            
            Text("Dataset ID: \(organization?.packageKey ?? "")")
                .font(.caption)
                .padding(.leading)
                .padding(.top,2)
        }
        .padding(.top, 4)
        .onAppear() {
            Task {
                organization = viewModel.fetch()
            }
        }
    }
}

#Preview {
    OrganizationInfo()
}
