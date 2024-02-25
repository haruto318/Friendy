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

    let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene
    
    var body: some View {
        @State var edge = windowScene?.windows.first?.safeAreaInsets
        
        NavigationView {
            ZStack{
                Color(UIColor.init(hexString: "F4F4F4")).ignoresSafeArea()
                ScrollView {
                    HeaderView()
                    DatePickerView(selectedDate: $selectedDate)
                        .padding(.horizontal)
                        .padding()
                    
                    LazyVGrid(columns: columns, spacing: 20) {
                        ForEach(CardArray, id: \.id) { card in
                            NavigationLink(destination: DetailView(Card: card)
                            ) {
                                FriendCard(card: card)
                            }
                        }
                    }
                    .padding()
                    .padding(.bottom,edge!.bottom + 70)
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

#Preview {
    FriendListView()
}
