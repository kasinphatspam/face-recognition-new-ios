//
//  EmployeeLayout.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import SwiftUI

struct EmployeeLayout: View {
    
    @State private var user: User
    
    init(user: User) {
        self.user = user
    }
    
    var body: some View {
        NavigationLink {
            
        } label: {
            HStack {
                SmallCircleImage(image: user.image ?? "")
                VStack(alignment: .leading) {
                    Text("\(user.firstname) \(user.lastname)")
                        .font(.caption)
                        .padding(.leading,8)
                        .bold()
                        .foregroundColor(.dynamicblack)
                    Text("\(user.email)")
                        .font(.caption2)
                        .padding(.leading, 8)
                        .foregroundColor(.dynamicblack)
                }
                Spacer()
                
                if user.role?.name == "administrator" {
                    Image(systemName: "star.square.fill")
                        .frame(width: 36, height: 36)
                        .padding(.trailing)
                        .imageScale(.large)
                        .foregroundColor(.blue)
                    
                }
                
            }
            .padding(.top, 8)
            .padding(.leading, 16)
            .padding(.trailing, 16)
            .padding(.bottom, 12)
        }
    }
}

#Preview {
    EmployeeLayout(user: User(id: 1, firstname: "Kasinphat", lastname: "Ketchom", email: "kasinphat@gmail.com", gender: nil, image: nil, organization: nil, role: nil))
}

