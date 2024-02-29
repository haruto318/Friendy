//
//  IntroView.swift
//  Friendy
//
//  Created by 濱野遥斗 on 2024/02/28.
//

import SwiftUI

struct IntroView: View {
//    @Binding var page: Int
    
    var body: some View {
        VStack(){
            Spacer()
            VStack(spacing: 20){
                Image(decorative: "logo").resizable().scaledToFit()
                    .frame(width: 300)
                HStack{
                    Spacer()
                    Text("プロフィールを作成").font(.custom("NotoSansJP-Medium", size: 16.0)).foregroundStyle(Color(UIColor(hexString: "000000")))
                        .background(.clear)
                        .frame(width: 220, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                        ).onTapGesture {
                            withAnimation(){
//                                page = 2
                            }
                        }
                    Spacer()
                }
            }
            Spacer()
            Spacer()
        }
    }
}
//
#Preview {
    IntroView()
}
