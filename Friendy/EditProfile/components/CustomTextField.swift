//
//  CustomTextField.swift
//  Friendy
//
//  Created by 濱野遥斗 on 2024/02/25.
//

import SwiftUI

struct CustomTextField: View {
    var category: String
    @Binding var inputInfo: String
    var body: some View {
        TextField(category, text: $inputInfo)
            .padding()
//            .padding(.horizontal)
            .foregroundColor(Color(UIColor(hexString: "333333")))
            .font(.custom("NotoSansJP-Regular", size: 14))
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(UIColor(hexString: "C9C9C9")), lineWidth: 1)
                .foregroundColor(.clear)
                .frame(height: 40)
            )
    }
}

//#Preview {
//    CustomTextField(category: "名前を入力してください")
//}
