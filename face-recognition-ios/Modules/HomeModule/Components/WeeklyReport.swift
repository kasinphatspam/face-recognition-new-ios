//
//  WeeklyReport.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import SwiftUI

struct WeeklyReport: View {
    @State private var selected: Date = Date()
    var body: some View {
        VStack {
            CalendarHorizontal(selected: $selected)
                .onChange(of: selected) {
                    
                }
            let data = (1...5).map { "Item \($0)" }
            
            ForEach(data, id: \.self) { item in
                
                HStack {
                    SmallCircleImage(image: "asdasd")
                    VStack(alignment: .leading) {
                        Text("Kasinphat Ketchom")
                            .font(.caption)
                            .padding(.leading,8)
                            .bold()
                            .foregroundColor(.dynamicblack)
                        Text("18:00 AM")
                            .font(.caption2)
                            .padding(.leading, 8)
                            .foregroundColor(.dynamicblack)
                    }
                    Spacer()
                    
                    Text("Confirmed")
                        .font(.caption2)
                        .padding(.trailing,4)
                        .foregroundColor(.green)
                }
                .padding(.top, 8)
                .padding(.leading, 16)
                .padding(.trailing, 16)
            }
        }
    }
}

#Preview {
    WeeklyReport()
}

