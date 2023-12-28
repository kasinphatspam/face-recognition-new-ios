//
//  PersonalInfo.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import SwiftUI

struct PersonalInfo: View {
    
    @StateObject private var viewModel: PersonalInfoViewModel = PersonalInfoViewModel()
    @State private var user: User? = nil
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Email: \(user?.email ?? "")")
                .font(.caption)
                .padding(.leading)
            
            Text("Personal ID: \(user?.personalId ?? "")")
                .font(.caption)
                .padding(.leading)
                .padding(.top,2)
            
            Text("Date of birth: \(user?.dob ?? "Not specified")")
                .font(.caption)
                .padding(.leading)
                .padding(.top,2)
            
            Text("Gender: \(user?.gender ?? "Not specified")")
                .font(.caption)
                .padding(.leading)
                .padding(.top,2)
        }
        .padding(.top, 4)
        .onAppear() {
            user = viewModel.fetch()
        }
    }
}

#Preview {
    PersonalInfo()
}

