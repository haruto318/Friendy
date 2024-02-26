//
//  PageTwoView.swift
//  Friendy
//
//  Created by 濱野遥斗 on 2024/02/25.
//

import SwiftUI

struct PageTwoView: View {
    @EnvironmentObject var modelData: DBEditProfileModel
    var body: some View {
        VStack(spacing: 20){
            VStack(spacing: 20){
                Text("プロフィールに表示する情報を入力してください").font(.custom("NotoSansJP-Regular", size: 20.0)).foregroundStyle(Color(UIColor(hexString: "333333"))).padding(.horizontal)
                Spacer()
                
                VStack(spacing: 10){
                    HStack{
                        Text("連絡用メールアドレス").font(.custom("NotoSansJP-Regular", size: 20.0)).foregroundStyle(Color(UIColor(hexString: "333333")))
                        Spacer()
                    }
                    CustomTextField(category: "メールアドレスを入力してください", inputInfo: $modelData.address)
                }.padding(.horizontal)
                    .padding(.bottom, 20)
                
                Divider()
                
                VStack(spacing: 20){
                    HStack{
                        Text("SNSアカウント").font(.custom("NotoSansJP-Regular", size: 20.0)).foregroundStyle(Color(UIColor(hexString: "333333")))
                        Spacer()
                    }
                    CustomTextField(category: "X(旧Twitter)", inputInfo: $modelData.twitter)
                    CustomTextField(category: "Instagram", inputInfo: $modelData.instagram)
                    CustomTextField(category: "GitHub", inputInfo: $modelData.github)
                    CustomTextField(category: "その他 (Qiita/Zenn/Noteなど)", inputInfo: $modelData.blog)
                }.padding(.horizontal)
                    .padding(.top, 10)
                Spacer()
                
                Spacer()
            }.padding(.horizontal)
        }
    }
}

#Preview {
    PageTwoView()
}
