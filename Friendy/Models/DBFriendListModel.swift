//
//  DBFriendListModel.swift
//  Friendy
//
//  Created by 濱野遥斗 on 2024/02/27.
//

import Foundation
import RealmSwift
import SwiftUI

extension UIImage {

    func resize(targetSize: CGSize) -> UIImage {
        return UIGraphicsImageRenderer(size:targetSize).image { _ in
            self.draw(in: CGRect(origin: .zero, size: targetSize))
        }
    }

}

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
        let resizedPicture: UIImage = image!.resize(targetSize: CGSize(width: image!.size.width / 8, height: image!.size.height / 8))

        let quality = 0.25 // 圧縮率（0.0から1.0の間の値、1.0が最高品質）
        let jpegData = resizedPicture.jpegData(compressionQuality: quality)
            
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
                friend.like = false
                realm.add(friend)
                fetchData()
            }
        } catch {
            print("Error saving data to Realm: \(error)")
        }
    }
    
    func updateLike(id: UUID) {
//        guard name != "", nickname != "", address != "", image != nil else { return }
            
        do {
            let realm = try Realm()
            let friend = realm.objects(Friend.self).where({ $0.id == id }).first
            try realm.write {
                friend!.like = !(friend!.like)
                fetchData()
            }
        } catch {
            print("Error saving data to Realm: \(error)")
        }
    }
}
