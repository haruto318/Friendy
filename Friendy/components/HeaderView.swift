//
//  HeaderView.swift
//  Friendy
//
//  Created by 濱野遥斗 on 2024/02/24.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 5){
                Text("けまり")
                    .font(.custom("NotoSansJP-Medium", size: 24.0))
                    .foregroundStyle(Color(UIColor.init(hexString: "333333")))
                Text("haruto.yhs318@gmail")
                    .font(.custom("NotoSansJP-Regular", size: 14.0))
                    .foregroundStyle(Color(UIColor.init(hexString: "333333")))
                    .opacity(0.5)
            }
            Spacer()
            NavigationLink(destination: {
                DetailView(Card: HeaderCard)
            }){
                Image(decorative: HeaderCard.image)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 50, height: 50)
                    .clipShape(Circle())
            }
        }.padding().padding(.horizontal)
    }
}

#Preview {
    HeaderView()
}
