//
//  HeaderView.swift
//  Friendy
//
//  Created by 濱野遥斗 on 2024/02/24.
//

import SwiftUI

struct HeaderView: View {
    @EnvironmentObject var modelData: DBEditProfileModel
    var body: some View {
        HStack{
            VStack(alignment: .leading, spacing: 5){
                Text(modelData.nickname)
                    .font(.custom("NotoSansJP-Medium", size: 24.0))
                    .foregroundStyle(Color(UIColor.init(hexString: "333333")))
                Text(modelData.address)
                    .font(.custom("NotoSansJP-Regular", size: 14.0))
                    .foregroundStyle(Color(UIColor.init(hexString: "333333")))
                    .opacity(0.5)
            }
            Spacer()
            NavigationLink(destination: {
                ProfileView(Card: modelData.card, isDetailView: true)
            }){
                if let uiImage = UIImage(data: modelData.image) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(contentMode: .fill)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                } else {
                    Circle().frame(width: 50, height: 50).foregroundColor(.gray)
                }
            }
        }.padding().padding(.horizontal)
    }
}

#Preview {
    HeaderView()
}
