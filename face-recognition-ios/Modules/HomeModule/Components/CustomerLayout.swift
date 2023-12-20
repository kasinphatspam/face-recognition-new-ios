//
//  CustomerLayout.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import SwiftUI

struct CustomerLayout: View {
    
    @State private var contact: Contact
    
    init(contact: Contact) {
        self.contact = contact
    }
    
    var body: some View {
        NavigationLink {
            CustomerDetailView(contact: contact)
        } label: {
            HStack {
                
                SmallCircleImage(image: contact.image ?? "")
                VStack(alignment: .leading) {
                    Text("\(contact.firstname) \(contact.lastname)")
                        .font(.caption)
                        .padding(.leading,8)
                        .bold()
                        .foregroundColor(.dynamicblack)
                    Text("\(contact.mobile ?? "")")
                        .font(.caption2)
                        .padding(.leading, 8)
                        .foregroundColor(.dynamicblack)
                }
                Spacer()
                
                if contact.encodedId == nil {
                    Image(systemName: "faceid")
                        .frame(width: 36, height: 36)
                        .foregroundColor(.red)
                } else {
                    Image(systemName: "faceid")
                        .frame(width: 36, height: 36)
                        .foregroundColor(.blue)
                }

            }
            .padding(.top, 8)
            .padding(.leading, 16)
            .padding(.trailing, 8)
            .padding(.bottom, 12)
        }
    }
}

#Preview {
    CustomerLayout(contact: Contact(id: 1, firstname: "Tony", lastname: "Stark", company: "Stack Industry", title: "Mr", officePhone: "000-000-0000", mobile: "000-000-0000", email1: "tony@gmail.com", email2: "stark@gmail.com", dob: nil, owner: nil, createdTime: "2003-05-21 07:00:00", modifiedTime: "2003-05-21 07:00:00", lineId: "tonyline", facebook: "tonyfacebook", linkedin: "tonylinkedin", encodedId: nil, image: "example"))
}

