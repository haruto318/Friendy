//
//  SampleView.swift
//  Friendy
//
//  Created by 濱野遥斗 on 2024/02/27.
//

import SwiftUI

struct SampleView: View {
    @EnvironmentObject var friendModel: DBFriendListModel
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/).onAppear(perform: {
            friendModel.addSample()
        })
    }
}

#Preview {
    SampleView()
}
