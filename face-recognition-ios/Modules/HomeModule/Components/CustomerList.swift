//
//  CustomerList.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import SwiftUI

struct CustomerList: View {
    @StateObject var viewModel: CustomerListViewModel = CustomerListViewModel()
    @State private var contacts: [Contact]? = []
    
    var body: some View {
        VStack {
            VStack {
                if contacts != nil {
                    ForEach(contacts!) { contact in
                        CustomerLayout(contact: contact)
                    }
                }
                
            }
        }
        .onAppear() {
            Task {
                bindViewModel()
                try await viewModel.fetch()
            }
        }
    }
    
    func bindViewModel() {
        viewModel.contacts.bind { contacts in
            self.contacts = contacts
         }
    }
}

#Preview {
    CustomerList()
}

