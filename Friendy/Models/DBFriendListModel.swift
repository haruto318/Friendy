//
//  DBFriendListModel.swift
//  Friendy
//
//  Created by 濱野遥斗 on 2024/02/27.
//

import Foundation
import RealmSwift
import SwiftUI

class DBFriendListModel: ObservableObject{
    @Published var image: Data = Data()
    @Published var name: String = ""
    @Published var nickname: String = ""
    @Published var address: String = ""
    @Published var twitter: String = ""
    @Published var instagram: String = ""
    @Published var github: String = ""
    @Published var blog: String = ""
    
    @Published var friends: [Friend] = []
    
    @Published var newOpenPage: Bool = false
    
    init(){
        fetchData()
    }
    
    func fetchData() {
        let realm = try! Realm()
        
        let result = realm.objects(Friend.self)
        
        print(result)
        
        self.friends = result.compactMap({ Friend in
            return Friend
        })
            
    }
        
    
    func addSample() {
//        guard name != "", nickname != "", address != "", image != nil else { return }
        
        let image = UIImage(named: "sample1")
        let quality = 0.5 // 圧縮率（0.0から1.0の間の値、1.0が最高品質）
        let jpegData = image!.jpegData(compressionQuality: quality)
            
        do {
            let realm = try Realm()
            let friend = Friend()
            try realm.write {
//                card.id = id
                friend.image = jpegData!
                friend.name = "harutoHamano"
                friend.nickname = "kemari"
                friend.address = "haruto.yhs318@gmail.com"
                friend.twitter = "haruto.twitter"
                friend.instagram = "haruto.instagram"
                friend.github = "haruto.github"
                friend.blog = "haruto.blog"
                realm.add(friend)
                fetchData()
            }
        } catch {
            print("Error saving data to Realm: \(error)")
        }
    }
    
//    func addData() {
//        guard name != "", nickname != "", address != "", image != nil else { return }
//
//        do {
//            let realm = try Realm()
//            let card = Card()
//            try realm.write {
////                card.id = id
//                card.image =
//                card.name = name
//                card.nickname = nickname
//                card.address = address
//                card.twitter = twitter
//                card.instagram = instagram
//                card.github = github
//                card.blog = blog
//                realm.add(card)
//                fetchData()
//            }
//        } catch {
//            print("Error saving data to Realm: \(error)")
//        }
//    }
}
