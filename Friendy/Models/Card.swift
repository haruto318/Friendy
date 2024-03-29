//
//  Card.swift
//  Friendy
//
//  Created by 濱野遥斗 on 2024/02/24.
//

import Foundation
import RealmSwift

class Card: Object, Identifiable{
    @Persisted var id: UUID = UUID()
    @Persisted var image: Data
    @Persisted var name: String = ""
    @Persisted var nickname: String = ""
    @Persisted var address: String = ""
    @Persisted var twitter: String = ""
    @Persisted var instagram: String = ""
    @Persisted var github: String = ""
    @Persisted var blog: String = ""
    @Persisted var like: Bool = false
}

class Friend: Object, Identifiable{
    @Persisted var id: UUID = UUID()
    @Persisted var image: Data
    @Persisted var name: String = ""
    @Persisted var nickname: String = ""
    @Persisted var address: String = ""
    @Persisted var twitter: String = ""
    @Persisted var instagram: String = ""
    @Persisted var github: String = ""
    @Persisted var blog: String = ""
    @Persisted var like: Bool = false
}



struct CardData: Identifiable, Hashable {
    var id = UUID()
    let image: String
    let name: String
    let nickname: String
    let address: String
    let twitter: String
    let instagram: String
    let github: String
    let blog: String
    let like: Bool
}

var CardArray: [CardData] = [CardData(image: "sample1" ,name: "はまの はると", nickname: "けまり", address: "haruto.yhs318@gmail.com", twitter: "https://twitter.com/ApplivGames", instagram: "https://twitter.com/ApplivGames", github: "https://twitter.com/ApplivGames", blog: "https://twitter.com/ApplivGames", like: false), CardData(image: "sample2" ,name: "はまの はると", nickname: "けまり", address: "haruto.yhs318@gmail.com", twitter: "https://twitter.com/ApplivGames", instagram: "https://twitter.com/ApplivGames", github: "https://twitter.com/ApplivGames", blog: "https://twitter.com/ApplivGames", like: false), CardData(image: "sample3" ,name: "はまの はると", nickname: "けまり", address: "haruto.yhs318@gmail.com", twitter: "https://twitter.com/ApplivGames", instagram: "https://twitter.com/ApplivGames", github: "https://twitter.com/ApplivGames", blog: "https://twitter.com/ApplivGames", like: false), CardData(image: "sample4" ,name: "はまの はると", nickname: "けまり", address: "haruto.yhs318@gmail.com", twitter: "https://twitter.com/ApplivGames", instagram: "https://twitter.com/ApplivGames", github: "https://twitter.com/ApplivGames", blog: "https://twitter.com/ApplivGames", like: false), CardData(image: "sample5" ,name: "はまの はると", nickname: "けまり", address: "haruto.yhs318@gmail.com", twitter: "https://twitter.com/ApplivGames", instagram: "https://twitter.com/ApplivGames", github: "https://twitter.com/ApplivGames", blog: "https://twitter.com/ApplivGames", like: false)]

var HeaderCard: CardData = CardData(image: "sample1" ,name: "はまの はると", nickname: "けまり", address: "haruto.yhs318@gmail.com", twitter: "https://twitter.com/ApplivGames", instagram: "https://twitter.com/ApplivGames", github: "https://twitter.com/ApplivGames", blog: "https://twitter.com/ApplivGames", like: false)
