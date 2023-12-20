//
//  CustomerDetailsView.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import SwiftUI

struct ContactInformationView: View {
    
    var contact: Contact?
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("Contact Information")
                .font(.subheadline)
                .bold()
                .padding(.top)
                .padding(.leading)
            
            HStack(alignment: .top) {
                
                VStack(alignment: .leading) {
                    Text("Email 1: \(contact?.email1 ?? "-")")
                        .font(.caption)
                        .padding(.leading)
                    
                    Text("Tel: \(contact?.mobile ?? "-")")
                        .font(.caption)
                        .padding(.leading)
                        .padding(.top,2)
                    
                    Text("Facebook: \(contact?.facebook ?? "-")")
                        .font(.caption)
                        .padding(.leading)
                        .padding(.top,2)
                    Text("LinkedIn: \(contact?.linkedin ?? "-")")
                        .font(.caption)
                        .padding(.leading)
                        .padding(.top,2)
                }
                
                VStack(alignment: .leading) {
                    Text("Email 2: \(contact?.email2 ?? "-")")
                        .font(.caption)
                        .padding(.leading)
                    
                    Text("Office: \(contact?.officePhone ?? "-")")
                        .font(.caption)
                        .padding(.leading)
                        .padding(.top,2)
                    
                    Text("Line: \(contact?.lineId ?? "-")")
                        .font(.caption)
                        .padding(.leading)
                        .padding(.top,2)
                }
            }.padding(.top,2)
        }
    }
}

struct OtherInformationView: View {
    
    var contact: Contact?
    var body: some View {
        VStack(alignment: .leading) {
            Text("Other Information")
                .font(.subheadline)
                .bold()
                .padding(.top)
                .padding(.leading)
            
            HStack(alignment: .top) {
                
                VStack(alignment: .leading) {
                    Text("Contact owner: \(contact?.owner ?? "-")")
                        .font(.caption)
                        .padding(.leading)
                    
                    Text("Create At: \(contact?.createdTime ?? "-")")
                        .font(.caption)
                        .padding(.leading)
                        .padding(.top,2)
                }
            }.padding(.top,2)
        }
    }
}

struct CustomerDetailView: View {
    
    @Environment(\.presentationMode) var presentationMode
    @StateObject var viewModel: CustomerDetailViewModel = CustomerDetailViewModel()
    var contact: Contact?
    
    init(contact: Contact?) {
        self.contact = contact
    }
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            VStack {
                
                LargeProfileCircleImage(image: "mahiru")
                    .padding(.top)
                
                Text("\(contact?.firstname ?? "") \(contact?.lastname ?? "")").bold()
                Text("\(contact?.company ?? "Freelance")")
                    .foregroundColor(.gray)
                
                Divider().padding(.top).padding(.leading).padding(.trailing)
                
                HStack {
                    ContactInformationView(contact: contact)
                        .padding(.leading)
                        .padding(.trailing)
                    Spacer()
                }
                
                Divider().padding(.top).padding(.leading).padding(.trailing)
                
                HStack {
                    OtherInformationView(contact: contact)
                        .padding(.leading)
                        .padding(.trailing)
                    Spacer()
                }
                
                Divider().padding(.top).padding(.leading).padding(.trailing)
                
                HStack {

                    Button("Edit") {
                        
                    }
                    .padding(.top)
                    .padding(.leading,32)
                    
                    Spacer()
                }
                
                HStack {

                    Button("Delete") {
                        
                    }
                    .foregroundColor(.red)
                    .padding(.top)
                    .padding(.leading,32)
                    
                    Spacer()
                }
                
                Spacer()
                
            }
        }
        .navigationTitle("")
        .navigationBarTitleDisplayMode(.inline)
        .onDisappear() {
            self.presentationMode.wrappedValue.dismiss()
        }
    }
}

#Preview {
    CustomerDetailView(contact: nil)
}

