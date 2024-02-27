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
            print("result: \(result)")
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
    }
        
    
    func addData() {
        guard name != "", nickname != "", address != "", image != nil else { return }
            
        do {
            let realm = try Realm()
            let userCard = realm.objects(Card.self).last!
            try realm.write {
                userCard.image = image
                userCard.name = name
                userCard.nickname = nickname
                userCard.address = address
                userCard.twitter = twitter
                userCard.instagram = instagram
                userCard.github = github
                userCard.blog = blog

                fetchData()
            }
        } catch {
            print("Error saving data to Realm: \(error)")
        }
    }
}
