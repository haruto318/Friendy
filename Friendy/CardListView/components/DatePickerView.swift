//
//  DatePickerView.swift
//  Friendy
//
//  Created by 濱野遥斗 on 2024/02/24.
//

import SwiftUI

struct DatePickerView: View {
    @Binding var selectedDate: Date
    
    var body: some View {
        DatePicker("日付指定:", selection: $selectedDate, displayedComponents: .date).environment(\.locale, Locale(identifier: "ja_JP"))
            .padding(.vertical, 7)
            .padding(.horizontal, 25)
            .background(.white)
            .cornerRadius(10)
    }
}

//#Preview {
//    DatePickerView(selectedDate: Binding<Date>)
//}
