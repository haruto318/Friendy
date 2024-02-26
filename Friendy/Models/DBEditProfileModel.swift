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
        let realm = try! Realm()

        if let result = realm.objects(Card.self).last {
            print(result)
            self.card = result
            image = card.image
            name = card.name
            nickname = card.nickname
            address = card.address
            twitter = card.twitter
            instagram = card.instagram
            github = card.github
            blog = card.blog
        }
        
        
//        guard let dbRef = try? Realm() else { return }
//        
//        let result = dbRef.objects(Card.self)
//        
////        print(result)
//        
//        if let result = dbRef.objects(Card.self).last {
//            print(result)
//            self.card = result
//            image = card.image
//            name = card.name
//            nickname = card.nickname
//            address = card.address
//            twitter = card.twitter
//            instagram = card.instagram
//            github = card.github
//            blog = card.blog
//            print(card)
//        }
    }
    
//    func addData(){
////        if name == "" || nickname == "" || address == "" || address == "" { return }
//        
//        let card = Card()
//        card.image = image
//        card.name = name
//        card.nickname = nickname
//        card.address = address
//        card.twitter = twitter
//        card.instagram = instagram
//        card.github = github
//        card.blog = blog
//        
//        print(card)
//        
//        guard let dbRef = try? Realm() else { return }
//        
//        try? dbRef.write{
//            dbRef.add(card)
//            
//            fetchData()
//        }
//        
//    }
    
    func addData() {
            guard name != "", nickname != "", address != "" else { return }
            
            let card = Card()
            card.image = image
            card.name = name
            card.nickname = nickname
            card.address = address
            card.twitter = twitter
            card.instagram = instagram
            card.github = github
            card.blog = blog
            
            print(card)
            
            do {
                let realm = try Realm()
                try realm.write {
                    realm.add(card)
                    fetchData()
                }
            } catch {
                print("Error saving data to Realm: \(error)")
            }
        }
}
