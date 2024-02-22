//
//  HomeView.swift
//  Friendy
//
//  Created by 濱野遥斗 on 2024/02/22.
//

import SwiftUI

struct HomeView: View {
    var body: some View {
        ZStack{
            Color(UIColor.init(hexString: "F4F4F4")).ignoresSafeArea()
            VStack(alignment: .leading){
                Spacer()
                Text("Current Friendy").font(.custom("NotoSansJP-Bold", size: 30.0)).padding(.horizontal).padding(.horizontal).padding(.horizontal)
                ColorList(colors: [.blue, .green, .orange, .red, .gray, .pink, .yellow, .clear])
                Spacer()
            }
        }
    }
}

#Preview {
    HomeView()
}
