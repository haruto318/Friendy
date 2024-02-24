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
                        Circle().frame(width: 50, height: 50)
                    }.padding().padding(.horizontal)
                    
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
