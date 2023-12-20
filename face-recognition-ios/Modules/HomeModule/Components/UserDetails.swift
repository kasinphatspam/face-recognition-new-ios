//
//  UserDetails.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import SwiftUI

struct UserDetails: View {
    @StateObject var viewModel: HeaderInformationViewModel = HeaderInformationViewModel()
    @State private var user: User? = nil
    
    var body: some View {
        HStack {
            ProfileCircleImage(image: user?.image ?? "").padding(.leading).padding(.top).padding(.bottom)
            VStack(alignment: .leading) {
                Text(user?.getFullName() ?? "").font(.headline).bold()
                Text(verbatim: "\(user?.email ?? "")").font(.caption).foregroundColor(.gray)
            }
            .padding(.top, 8)
            .padding(.leading)
            .padding(.bottom, 8)
            Spacer()
        }
        .padding(.leading)
        .onAppear() {
            user = viewModel.fetch()
        }
    }
}

#Preview {
    UserDetails()
}
