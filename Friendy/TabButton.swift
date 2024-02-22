//
//  TabButton.swift
//  Friendy
//
//  Created by 濱野遥斗 on 2024/02/22.
//

import SwiftUI

struct TabButton: View {
    var title: String
    var image: String
    
    @Binding var selected : String
    var body: some View {
        Button(action: {
            withAnimation(.spring()){selected = title}
        }){
            HStack(spacing: 0){
                Image(systemName: image)
                    .resizable()
                    .renderingMode(.template)
                    .frame(width: 25, height: 25)
                    .foregroundColor(.black)
                
                if selected == title {
                    Text(title)
                        .fontWeight(.bold)
                        .foregroundStyle(.black)
                        .padding(.horizontal)
                }
            }
            .padding(.vertical, 10)
            .padding(.horizontal)
            .background(Color.black.opacity(selected == title ? 0.08 : 0))
            .clipShape(Capsule())
        }
    }
}

#Preview {
    TabBar()
}
