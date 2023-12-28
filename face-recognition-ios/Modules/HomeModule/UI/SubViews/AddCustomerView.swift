//
//  AddCustomerView.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 22/12/2566 BE.
//

import SwiftUI

struct AddCustomerView: View {
    
    @State private var title: String = ""
    @State private var firstname: String = ""
    @State private var lastname: String = ""
    @State private var company: String = ""
    @State private var email: String = ""
    @State private var phone: String = ""
    @State private var lineId: String = ""
    @State private var facebook: String = ""
    @State private var customerCompany: String = ""
    
    @State private var selectedGenderIndex: Int = 0
    private var genderOptions = ["🙍‍♂️ Mr", "🙍‍♀️ Ms", "🙍‍♀️ Mrs"]
    
    @State private var dob = Date.now
    private var closedRange = Calendar.current.date(byAdding: .year, value: -100, to: Date())!
    
    @StateObject var viewModel: AddCustomerViewModel = AddCustomerViewModel()
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Form {
            Section(header: Text("Personal inforamtion")) {
                Picker("Gender", selection: $selectedGenderIndex) {
                    ForEach(0..<genderOptions.count, id: \.self) {
                        Text(self.genderOptions[$0])
                    }
                }.pickerStyle(SegmentedPickerStyle())
                TextField("First Name", text: $firstname)
                    .autocapitalization(.none)
                    
                TextField("Last Name", text: $lastname)
                    .autocapitalization(.none)
                
                DatePicker("Date of birth",
                           selection: $dob ,
                           in: closedRange...Date(),
                           displayedComponents: .date
                )
                
            }
            
            Section(header: Text("Contact inforamtion")) {
                TextField("Phone number", text: $phone)
                    .autocapitalization(.none)
                
                TextField("Email Address", text: $email)
                    .autocapitalization(.none)
                
                TextField("Line ID (optional)", text: $lineId)
                    .autocapitalization(.none)
                
                TextField("Facebook (optional)", text: $facebook)
                    .autocapitalization(.none)
            }
            
            Section(header: Text("Company inforamtion")) {
                TextField("Company name", text: $customerCompany)
                    .autocapitalization(.none)
            }
            
            Button(action: {
                
                var title = ""
                
                if selectedGenderIndex == 0 {
                    title = "Mr."
                } else if selectedGenderIndex == 1 {
                    title = "Ms."
                } else {
                    title = "Mrs."
                }

                Task {
                    try await viewModel.add(
                        title: title,
                        email: email,
                        firstname: firstname,
                        lastname: lastname,
                        mobile: phone,
                        lineId: lineId,
                        facebook: facebook,
                        customerCompany: customerCompany
                    )
                }
            }) {
                Text("Submit")
                    .foregroundColor(.blue)
            }
            
            Button(action: {
                
            }) {
                Text("Discard")
                    .foregroundColor(.red)
            }
        }
        .navigationTitle("Add new customer")
        .navigationBarTitleDisplayMode(.inline)
        .onAppear() {
            bindViewModel()
        }
    }
    
    func bindViewModel() {
        viewModel.signal.bind {
            signal in
            if signal?.command == "ADD_CUSTOMER_SUCCESS" {
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

#Preview {
    AddCustomerView()
}
