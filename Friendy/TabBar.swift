//
//  TabBar.swift
//  Friendy
//
//  Created by 濱野遥斗 on 2024/02/22.
//

import SwiftUI

struct TabBar: View{
    @State var current = "Home"
    
    var body: some View {
        ZStack(alignment: Alignment(horizontal: .center, vertical: .bottom)){
            
            TabView(selection: $current){
                HomeView().tag("Home")
                Text("Message").tag("Messages")
                Text("Account").tag("Account")
            }
            
            HStack(spacing: 0){
                TabButton(title: "Home", image: "house", selected: $current)
                
                Spacer(minLength: 0)
                
                TabButton(title: "Messages", image: "message", selected: $current)
                
                Spacer(minLength: 0)
                
                TabButton(title: "Account", image: "person", selected: $current)
            }
            .padding(.vertical, 12)
            .padding(.horizontal)
            .background(Color(.white))
            .clipShape(Capsule())
            .padding(.horizontal, 25)
            .shadow(color: .gray.opacity(0.3), radius: 10, x: 0, y: 0)
            
        }
    }
}

#Preview {
    TabBar()
}
