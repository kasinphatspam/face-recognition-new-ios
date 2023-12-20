//
//  EmployeeList.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import SwiftUI

struct EmployeeList: View {
    
    @StateObject var viewModel: EmployeeListViewModel = EmployeeListViewModel()
    @State private var users: [User]? = []
    
    var body: some View {
        VStack {
            if users != nil {
                ForEach(users!) { user in
                    EmployeeLayout(user: user)
                }
            }
            
        }
        .onAppear() {
            bindViewModel()
            Task {
                try await viewModel.fetch()
            }
        }
    }
    
    func bindViewModel() {
        viewModel.users.bind { users in
            self.users = users
         }
    }
}

#Preview {
    EmployeeList()
}

