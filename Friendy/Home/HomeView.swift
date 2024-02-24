//
//  HomeView.swift
//  Friendy
//
//  Created by 濱野遥斗 on 2024/02/22.
//

import SwiftUI

struct HomeView: View {
    
    @State var show: Bool = false
    @Namespace var namespace
    @State var currentCard: CardData =
    CardData(image: "sample5" ,name: "はまの はると", nickname: "けまり", address: "haruto.yhs318@gmail.com", twitter: "https://twitter.com/ApplivGames", instagram: "https://twitter.com/ApplivGames", github: "https://twitter.com/ApplivGames", blog: "https://twitter.com/ApplivGames")
    
    var body: some View {
        ZStack{
            Color(UIColor.init(hexString: "F4F4F4")).ignoresSafeArea()
                
            ColorList(cards: CardArray, show: $show, currentCard: $currentCard)
            
        }
    }
}

#Preview {
    HomeView()
}
