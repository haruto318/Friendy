//
//  FriendyApp.swift
//  Friendy
//
//  Created by 濱野遥斗 on 2024/02/22.
//

import SwiftUI

@main
struct FriendyApp: App {
    @StateObject var modelData = DBEditProfileModel()
    @StateObject var friendModel = DBFriendListModel()
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(modelData).environmentObject(friendModel)
        }
    }
}
