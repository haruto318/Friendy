//
//  FriendListView.swift
//  Friendy
//
//  Created by 濱野遥斗 on 2024/02/24.
//

import SwiftUI

struct FriendListView: View {
    var columns = [GridItem(.adaptive(minimum: 150), spacing: 5)]
    
    @State var selectedDate: Date = Date()
    
    var body: some View {
        NavigationView {
            ZStack{
                Color(UIColor.init(hexString: "F4F4F4")).ignoresSafeArea()
                ScrollView {
                    HeaderView()
                    DatePicker("日付指定:", selection: $selectedDate, displayedComponents: .date).environment(\.locale, Locale(identifier: "ja_JP"))
                        .padding(.vertical, 7)
                        .padding(.horizontal, 25)
                        .background(.white)
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .padding()
                        
                    
//                    VStack{
//                        HStack(spacing: 10){
//                            Text("日付指定")
//                                .font(.custom("NotoSansJP-Medium", size: 16.0))
//                                .foregroundStyle(Color(UIColor.init(hexString: "333333")))
//                                .padding(5)
//                                .background(.gray)
//                                .padding(5)
//                            DatePicker(selection: $selectedDate) {
//                                Text("日付指定")
//                            }.onChange(of: $selectedDate) {
//                                print("gewo")
//                            }
//                            
//                        }
//                    }.background(.white).cornerRadius(10)
                    
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
