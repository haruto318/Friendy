//
//  DBEditProfileModel.swift
//  Friendy
//
//  Created by 濱野遥斗 on 2024/02/26.
//

import Foundation
import RealmSwift

class DBEditProfileModel: ObservableObject{
    @Published var image: Data = Data()
    @Published var name: String = ""
    @Published var nickname: String = ""
    @Published var address: String = ""
    @Published var twitter: String = ""
    @Published var instagram: String = ""
    @Published var github: String = ""
    @Published var blog: String = ""
    
    @Published var card: Card = Card()
    
    @Published var newOpenPage: Bool = false
    
    init(){
        fetchData()
    }
    
    func fetchData() {
        guard let dbRef = try? Realm() else { return }
        
        let result = dbRef.objects(Card.self)
        
        print(result)
        
        if let result = dbRef.objects(Card.self).last {
            self.card = result
            name = card.name
            nickname = card.nickname
            print(card)
        }
    }
    
    func addData(){
//        if name == "" || nickname == "" || address == "" || address == "" { return }
        
        let card = Card()
//        card.image = image
        card.name = name
        card.nickname = nickname
//        card.address = address
//        card.twitter = twitter
//        card.instagram = instagram
//        card.github = github
//        card.blog = blog
        
        guard let dbRef = try? Realm() else { return }
        
        try? dbRef.write{
            dbRef.add(card)
            
            fetchData()
        }
        
    }
}
