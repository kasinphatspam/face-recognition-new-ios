//
//  Calendar.swift
//  face-recognition-ios
//
//  Created by Kasinphat Ketchom on 21/12/2566 BE.
//

import SwiftUI

struct CalendarItem: View {
    
    private var item: CalendarDate
    
    @Binding var selected: Date
    private var components: DateComponents
    
    init(item: CalendarDate, selected: Binding<Date>) {
        self.item = item
        self._selected = selected
        let calendar = Calendar.current
        self.components = calendar.dateComponents([.day], from: item.date)
    }
    
    var body: some View {
        if(!NSCalendar.current.isDate(selected, inSameDayAs: item.date)) {
            VStack {
                VStack{
                    Text(item.abbreviationMonth).font(.caption).foregroundColor(.gray)
                    Text(String(components.day!))
                        .frame(width: 40, height: 30)
                        .background(Rectangle().fill(Color.gray.opacity(0.1)).cornerRadius(10))
                        .padding(.bottom, 8)
                    
                    switch item.abbreviation {
                    case "Sun":
                        Rectangle().fill(Color.red).cornerRadius(10).frame(height: 4).padding(.horizontal, 8)
                    case "Mon":
                        Rectangle().fill(Color.yellow).cornerRadius(10).frame(height: 4).padding(.horizontal, 8)
                    case "Tue":
                        Rectangle().fill(Color.pink).cornerRadius(10).frame(height: 4).padding(.horizontal, 8)
                    case "Wed":
                        Rectangle().fill(Color.green).cornerRadius(10).frame(height: 4).padding(.horizontal, 8)
                    case "Thu":
                        Rectangle().fill(Color.orange).cornerRadius(10).frame(height: 4).padding(.horizontal, 8)
                    case "Fri":
                        Rectangle().fill(Color.blue).cornerRadius(10).frame(height: 4).padding(.horizontal, 8)
                    case "Sat":
                        Rectangle().fill(Color.purple).cornerRadius(10).frame(height: 4).padding(.horizontal, 8)
                    default:
                        Rectangle().fill(Color.white).cornerRadius(10).frame(height: 4).padding(.horizontal, 8)
                    }
                    
                }
                .frame(minWidth: 60, idealWidth: 60, maxWidth: 60, minHeight: 90, idealHeight: 90, maxHeight: 90)
            }
            
        } else {
            VStack {
                VStack{
                    Text(item.abbreviationMonth).font(.caption).foregroundColor(.gray)
                    Text(String(components.day!))
                        .frame(width: 40, height: 30)
                        .background(Rectangle().fill(Color.yellow.opacity(0.3)).cornerRadius(10))
                        .padding(.bottom, 8)
                    switch item.abbreviation {
                    case "Sun":
                        Rectangle().fill(Color.red).cornerRadius(10).frame(height: 4).padding(.horizontal, 8)
                    case "Mon":
                        Rectangle().fill(Color.yellow).cornerRadius(10).frame(height: 4).padding(.horizontal, 8)
                    case "Tue":
                        Rectangle().fill(Color.pink).cornerRadius(10).frame(height: 4).padding(.horizontal, 8)
                    case "Wed":
                        Rectangle().fill(Color.green).cornerRadius(10).frame(height: 4).padding(.horizontal, 8)
                    case "Thu":
                        Rectangle().fill(Color.orange).cornerRadius(10).frame(height: 4).padding(.horizontal, 8)
                    case "Fri":
                        Rectangle().fill(Color.blue).cornerRadius(10).frame(height: 4).padding(.horizontal, 8)
                    case "Sat":
                        Rectangle().fill(Color.purple).cornerRadius(10).frame(height: 4).padding(.horizontal, 8)
                    default:
                        Rectangle().fill(Color.white).cornerRadius(10).frame(height: 4).padding(.horizontal, 8)
                    }
                }
                .frame(minWidth: 60, idealWidth: 60, maxWidth: 60, minHeight: 90, idealHeight: 90, maxHeight: 90)
            }
        }
    }
}

struct CalendarHorizontal: View {
    
    @State private var offset: Int = 0
    @State private var position: Int?
    @State private var peroid: [CalendarDate] = []
    @Binding var selected: Date

    var body: some View {
        ScrollViewReader { scrollView in
            ScrollView(.horizontal, showsIndicators: false) {
                ZStack {
                    HStack(alignment: .top, spacing: 4) {
                        ForEach(Array(peroid.enumerated()), id: \.element) {index, item in
                            
                            if index == peroid.count - 1 {
                                CalendarItem(item: item, selected: $selected)
                                    .id(index)
                                    .onAppear() {
                                        position = index
                                    }
                                    .onTapGesture {
                                        selected = item.date
                                    }
                            } else {
                                CalendarItem(item: item, selected: $selected)
                                    .id(index)
                                    .onTapGesture {
                                        selected = item.date
                                    }
                            }
                            
                        }
                    }
                    .padding(.leading, 4)
                    .padding(.trailing, 8)
                    .scrollTargetLayout()
                    
                    GeometryReader { proxy in
                        let offset = proxy.frame(in: .named("scroll")).minX
                        Color.clear.preference(key: ViewOffsetKey.self, value: offset)
                    }
                }
            }
            .scrollPosition(id: $position)
            .coordinateSpace(name: "scroll")
            .onPreferenceChange(ViewOffsetKey.self) { value in
                if value == 0 {
                    addMoreDate(offset: offset)
                }
           }
        }
        .onAppear() {
            let sevenDaysAgo = getDateSevenDaysAgo()
            peroid = sevenDaysAgo
        }
        .onDisappear() {
            offset = -6
        }
        
    }
    
    func getAbbreviation(date: Date, format: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = format
        let currentDay = dateFormatter.string(from: date)
        return currentDay
    }
    
    func addMoreDate(offset: Int) {
        let calendar = Calendar.current
        var count = 0
        for i in stride(from: -6, to: 0, by: 1) {
            let sevenDaysAgo = calendar.date(byAdding: .day, value: i + offset, to: Date())
            let calendarDate = CalendarDate(date: sevenDaysAgo!, abbreviationMonth: getAbbreviation(date: sevenDaysAgo!, format: "MMM"), abbreviation: getAbbreviation(date: sevenDaysAgo!, format: "EEE"))
            self.peroid.insert(calendarDate ,at: 0 + count)
            count += 1
        }
        self.offset -= 6
    }
    
    func getDateSevenDaysAgo() -> [CalendarDate] {
        var peroid: [CalendarDate] = []
        
        let currentDate = Date()
        let today = CalendarDate(date: currentDate,abbreviationMonth: getAbbreviation(date: currentDate, format: "MMM"), abbreviation: getAbbreviation(date: currentDate, format: "EEE"))
        
        let calendar = Calendar.current
        for i in stride(from: -6, to: 0, by: 1) {
            let sevenDaysAgo = calendar.date(byAdding: .day, value: i, to: Date())
            let calendarDate = CalendarDate(date: sevenDaysAgo!, abbreviationMonth: getAbbreviation(date: sevenDaysAgo!, format: "MMM"), abbreviation: getAbbreviation(date: sevenDaysAgo!, format: "EEE"))
            peroid.append(calendarDate)
        }
        peroid.append(today)
        return peroid
    }
}

struct ViewOffsetKey: PreferenceKey {
    typealias Value = CGFloat
    static var defaultValue = CGFloat.zero
    static func reduce(value: inout Value, nextValue: () -> Value) {
        value += nextValue()
    }
}

#Preview {
    CalendarHorizontal(selected: .constant(Date()))
}
