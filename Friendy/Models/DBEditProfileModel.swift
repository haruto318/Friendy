//
//  DBEditProfileModel.swift
//  Friendy
//
//  Created by 濱野遥斗 on 2024/02/26.
//

import Foundation
import RealmSwift
import SwiftUI

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
        
        let results = realm.objects(Card.self)
        print("results: \(results)")
        
        if let result = realm.objects(Card.self).first {
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
//        guard name != "", nickname != "", address != "", image != nil else { return }
        
        let quality = 0.25 // 圧縮率（0.0から1.0の間の値、1.0が最高品質）

        do {
            let realm = try Realm()
            if let userCard = realm.objects(Card.self).first {
                print("userCard: \(userCard)")
                try realm.write {
                    userCard.image = image
                    userCard.name = name
                    userCard.nickname = nickname
                    userCard.address = address
                    userCard.twitter = twitter
                    userCard.instagram = instagram
                    userCard.github = github
                    userCard.blog = blog
                    print("card updated")
                }
            } else {
                guard let uiImage = UIImage(data: image) else {
                    print("Error converting Data to UIImage")
                    return
                }
                
                let resizedPicture: UIImage = uiImage.resize(targetSize: CGSize(width: uiImage.size.width / 8, height: uiImage.size.height / 8))
                    
                guard let jpegData = resizedPicture.jpegData(compressionQuality: quality) else {
                    print("Error converting UIImage to JPEG Data")
                    return
                }
                let newCard = Card()
                newCard.image = jpegData
                newCard.name = name
                newCard.nickname = nickname
                newCard.address = address
                newCard.twitter = twitter
                newCard.instagram = instagram
                newCard.github = github
                newCard.blog = blog
                try realm.write {
                    realm.add(newCard)
                    print("card created")
                }
            }
            fetchData()
        } catch {
            print("Error saving data to Realm: \(error)")
        }
    }
}
