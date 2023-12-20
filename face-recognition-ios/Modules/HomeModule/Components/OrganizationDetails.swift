//
//  OrganizationDetails.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import SwiftUI

struct OrganizationDetails: View {
    
    @StateObject var viewModel: OrganizationPasscodeViewModel = OrganizationPasscodeViewModel()
    @State private var organization: Organization? = nil
    
    var body: some View {
        
        ZStack {
            RoundedRectangle(cornerRadius: 8, style: .continuous)
                .fill(.darkgray)

            VStack {
                HStack {
                    Text(organization?.name ?? "")
                        .font(.subheadline)
                        .foregroundColor(.white)
                        .bold()

                    Spacer()
                }

                HStack {
                    Text("Your organization passcode is **\(organization?.passcode ?? "")**")
                        .font(.caption)
                        .foregroundColor(.white)
                    Spacer()
                }

            }
            .padding(16)
            .multilineTextAlignment(.center)

        }
        .padding(.leading, 16)
        .padding(.trailing, 16)
        .onAppear() {
            Task {
                organization = viewModel.fetch()
            }
        }
        
    }
}

