//
//  ProgressBar.swift
//  Friendy
//
//  Created by 濱野遥斗 on 2024/02/25.
//

import SwiftUI

struct ProgressBar: View {
    @Binding var progressVal: Double
    var body: some View {
        VStack(alignment: .leading){ ///画面上部のバー
            Text("プロフィールを編集").padding().font(.custom("NotoSansJP-Medium", size: 20.0)).foregroundStyle(Color(UIColor(hexString: "333333")))
            ProgressView(value: min(max(progressVal, 0.0), 100), total: 100)
                .animation(.easeInOut, value: progressVal)//バーのアニメーション
                .tint(Color(UIColor(hexString: "333333")))//バーの色
                .scaleEffect(x: 1, y: 0.5)//バーの高さ
        }
    }
}

//#Preview {
//    ProgressBar()
//}
