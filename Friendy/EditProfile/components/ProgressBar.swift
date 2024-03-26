//
//  ProgressBar.swift
//  Friendy
//
//  Created by 濱野遥斗 on 2024/02/25.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var progressVal: Double
    @EnvironmentObject var viewStatus: ViewStatusModel
    @EnvironmentObject var modelData: DBEditProfileModel
    @AppStorage("isInit") var isInit: Bool = true
//    @EnvironmentObject var viewStatus: ViewStatusModel
    var selection: Int

    var body: some View {
        VStack(alignment: .leading){ ///画面上部のバー
            HStack{
                Text("プロフィールを編集").padding().font(.custom("NotoSansJP-Medium", size: 20.0)).foregroundStyle(Color(UIColor(hexString: "333333")))
                Spacer()
                
                if selection == 3 {
                    if isInit == true {
                        Button(action: {
                            modelData.addData()
                            UserDefaults.standard.set(false, forKey: "isInit") /// onBoardingを閉じる（データを更新するコードも書くこと）
                        }, label: {
                            Text("作成").padding().font(.custom("NotoSansJP-Medium", size: 20.0)).foregroundStyle(Color(UIColor(hexString: "333333")))
                        })
                    } else {
                        Button(action: {
                            modelData.addData()
                            viewStatus.isShowEditView = false /// onBoardingを閉じる（データを更新するコードも書くこと）
                        }, label: {
                            Text("保存").padding().font(.custom("NotoSansJP-Medium", size: 20.0)).foregroundStyle(Color(UIColor(hexString: "333333")))
                        })
                    }
                    
                }
                
            }
            ProgressView(value: min(max(progressVal, 0.0), 100), total: 100)
                .animation(.easeInOut, value: progressVal)//バーのアニメーション
                .tint(Color(UIColor(hexString: "333333")))//バーの色
                .scaleEffect(x: 1, y: 0.5)//バーの高さ
        }.onAppear(perform: {
            print(modelData.card)
        })
    }
}

//#Preview {
//    ProgressBar()
//}
