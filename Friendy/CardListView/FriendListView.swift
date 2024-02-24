//
//  FriendListView.swift
//  Friendy
//
//  Created by 濱野遥斗 on 2024/02/24.
//

import SwiftUI

struct FriendListView: View {
    var columns = [GridItem(.adaptive(minimum: 150), spacing: 5)]
    
    var body: some View {
        NavigationView {
            ZStack{
                Color(UIColor.init(hexString: "F4F4F4")).ignoresSafeArea()
                ScrollView {
                    HeaderView()
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(CardArray, id: \.id) { card in
                            FriendCard(card: card)
                            //                            .environmentObject(cartManager)
                        }
                    }
                    .padding()
                }
//                .navigationTitle(Text("Sweater Shop"))
                //            .toolbar {
                //                NavigationLink {
                //                    CartView()
                //                        .environmentObject(cartManager)
                //                } label: {
                //                    CartButton(numberOfProducts: cartManager.products.count)
                //                }
                //            }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    FriendListView()
}
