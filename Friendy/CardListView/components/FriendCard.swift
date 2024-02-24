//
//  FriendCard.swift
//  Friendy
//
//  Created by 濱野遥斗 on 2024/02/24.
//

import SwiftUI

struct FriendCard: View {
    var card: CardData
    var body: some View {
        VStack(spacing: 10) {
            Image(decorative: card.image)
                .resizable()
                .scaledToFill()
                .frame(width: 140, height: 140)
                .clipShape(Rectangle())
                .cornerRadius(15.0)
                .padding(.top, 10)

            
            HStack(alignment: .bottom){
                VStack(alignment: .leading, spacing: 5) {
                    Text(card.nickname)
                        .font(.custom("NotoSansJP-Medium", size:20.0))
                        .foregroundStyle(Color(UIColor.init(hexString: "333333")))
                    
                    Text(card.name)
                        .font(.custom("NotoSansJP-Regular", size:10.0))
                        .foregroundStyle(Color(UIColor.init(hexString: "333333")))
                }
//                .padding(.horizontal)
                Spacer()
                Button(action: {
//                    card.like = !card.like
                }){
                    Image(systemName: card.like ? "heart.fill": "heart").foregroundColor(card.like ? .red: .black)
                        .font(.system(size: 20))
                }
            }
            .padding(.horizontal)
            Spacer()
        }
        .frame(width: 160, height: 230)
        .background(Color(UIColor(hexString: "FFFFFF")))
        .cornerRadius(20.0)
        .shadow(color: Color.gray.opacity(0.3), radius: 10, x: 0, y: 0)
    }
}

#Preview {
    FriendCard(card: CardArray[0])
}
