//
//  SearchView.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import SwiftUI

struct SearchView: View {
    
    @State private var text = ""
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        VStack {
            HStack {
                HStack(spacing: 15) {
                    HStack(spacing: 8) {
                        Image(uiImage: UIImage(named: "search")!)
                            .resizable()
                            .frame(width: 12, height: 12)
                            .padding(.leading, 8)
                        
                        TextField("Search", text: $text)
                            .font(.caption)
                            .padding(.leading, 8)
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding(.vertical, 10)
                    .padding(.horizontal, 15)
                    .background {
                        RoundedRectangle(cornerRadius: 4, style: .continuous)
                            .fill(.gray)
                            .opacity(0.1)
                    }
                }
                .padding(.leading)
                .padding(.trailing, 8)
                
                Button(action: {
                    self.presentationMode.wrappedValue.dismiss()
                }, label: {
                    Text("Cancel").font(.subheadline)
                })
                .padding(.trailing)
            }
            
            EmployeeList()
            CustomerList()
            
            Spacer()
        }
        .padding(.top, 8)
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    SearchView()
}

