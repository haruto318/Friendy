//
//  ColorList.swift
//  Friendy
//
//  Created by 濱野遥斗 on 2024/02/22.
//

import SwiftUI

struct ColorList: View {
    
    var colors:[String]
    
    @State private var isTapped = false
    
    @State var isDetectingLongPress: Bool = false
    @State var totalNumberOfTaps = 0
    
    var body: some View {
        
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 300) {
                ForEach(colors, id: \.self) { color in
                    GeometryReader { geometry in
                        Image(decorative: color)
                            .resizable()
                            .scaledToFill()
                            .frame(width: 300, height: 300, alignment: .center)
                            .cornerRadius(16)
                            .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 0)
                            .rotation3DEffect(Angle(degrees: (Double(geometry.frame(in: .global).minX) - 50) / -20), axis: (x: 0, y: 1.0, z: 0))
                            .scaleEffect(self.isDetectingLongPress ? 0.97 : 1.0)
                            .onTapGesture {
                                isDetectingLongPress = true
                                DispatchQueue.main.asyncAfter(deadline: .now() + 0.2) {
                                    isDetectingLongPress = false
                                }
                            }
                            .animation(.easeOut(duration: 0.2))
                    }
                }
                GeometryReader { geometry in ///透明画像
                    Rectangle()
                        .foregroundColor(.clear)
                        .frame(width: 300, height: 300, alignment: .center)
                        .cornerRadius(16)
                        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 0)
                        .rotation3DEffect(Angle(degrees: (Double(geometry.frame(in: .global).minX) - 50) / -20), axis: (x: 0, y: 1.0, z: 0))
                }
            }.padding(.horizontal, 50)
                .padding(.vertical, 40)
            
        }
    }
}

#Preview {
    ColorList(colors: ["sample1", "sample2", "sample3", "sample4", "sample5"])
}
