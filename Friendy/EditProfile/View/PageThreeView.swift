//
//  PageThreeView.swift
//  Friendy
//
//  Created by 濱野遥斗 on 2024/02/25.
//

import SwiftUI

struct PageThreeView: View {
    var body: some View {
        VStack(spacing: 10){
            VStack(spacing: 20){
                Text("プロフィール画像を選択してください").font(.custom("NotoSansJP-Regular", size: 20.0)).foregroundStyle(Color(UIColor(hexString: "333333"))).padding(.horizontal)
                Spacer()
                
                VStack(spacing: 10){
                    RoundedRectangle(cornerRadius: 30)
                                    .fill(Color(UIColor(hexString: "D9D9D9")))
                                    .frame(width:200, height: 200)
                }.padding(.horizontal)
                Spacer()
                
                VStack(spacing: 10){
                    HStack{
                        Spacer()
                        Text("写真を選択").font(.custom("NotoSansJP-Medium", size: 16.0)).foregroundStyle(Color(UIColor(hexString: "000000")))
                            .background(.clear)
                            .frame(width: 220, height: 50)
                            .overlay(
                                RoundedRectangle(cornerRadius: 10)
                                    .stroke(Color.black, lineWidth: 1)
                            )
                            .onTapGesture {
                                withAnimation(.none) {
                                    print("push")
//                                    imageState.toggle()
                                }
                            }
                        Spacer()
                    }
                }.padding(.horizontal)
                Spacer()
                
                Spacer()
            }.padding(.horizontal)
        }
    }
}

#Preview {
    PageThreeView()
}
