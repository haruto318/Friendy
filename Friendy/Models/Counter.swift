//
//  Counter.swift
//  Friendy
//
//  Created by 濱野遥斗 on 2024/02/25.
//
//
//import Foundation
//import RealmSwift
//
//// カウンターのモデルを定義する
//class Counter: Object, ObjectKeyIdentifiable {
////    @Persisted(primaryKey: true) var id: ObjectId
//    @Persisted var exchangedDate: Date
//    @Persisted var card: Card?
//    @Persisted var comment: String
//    @Persisted var like: Bool
//    @Persisted var count: Int = 0
//}
//
//class Card: Object {
//    @Persisted var id = UUID()
//    @Persisted var image: String
//    @Persisted var name: String
//    @Persisted var nickname: String
//    @Persisted var address: String
//    @Persisted var twitter: String
//    @Persisted var instagram: String
//    @Persisted var github: String
//    @Persisted var blog: String
//}
//
//
//// 状態が変更されたときに、Viewに更新を通知するクラス
//class RealmManager: ObservableObject {
//    private(set) var localRealm: Realm?
//    @Published var counters: [Counter] = []
//    @Published var userCard: Counter = Counter()
//    // initはRealmManagerが生成されたときに呼ばれる
//    init() {
//        // Realmを開くメソッドを実行
//        openRealm()
//        // 保存されてるカウンターの情報を取得
//        getCounters()
//    }
//    // Realmとの接続を開くメソッド
//    func openRealm() {
//        do {
//            let config = Realm.Configuration(schemaVersion: 1)
//            Realm.Configuration.defaultConfiguration = config
//            localRealm = try Realm()
//        } catch {
//            print("Error opening Realm", error)
//        }
//    }
//    // カウンターを追加するメソッド
//    func addCounter(like: Bool) {
//        // if letでlocalRealmがnilでないことを確認
//        if let localRealm = localRealm {
//            // do-catchでエラー処理
//            do {
//                // Realmに書き込み
//                try localRealm.write {
//                    let newCounter = Counter()
//                    newCounter.like = false
//                    localRealm.add(newCounter)
//                    getCounters()
//                }
//            } catch {
//                print("Error adding counter to Realm: \(error)")
//            }
//        }
//    }
//    
//    // カウンターを追加するメソッド
//    func addUserCard(like: Bool) {
//        // if letでlocalRealmがnilでないことを確認
//        if let localRealm = localRealm {
//            // do-catchでエラー処理
//            do {
//                // Realmに書き込み
//                try localRealm.write {
//                    let newCard = Counter()
//                    newCard.count += 1
//                    localRealm.add(newCard)
//                    getCounters()
//                }
//            } catch {
//                print("Error adding counter to Realm: \(error)")
//            }
//        }
//    }
//    
//    // カウンターの情報を取得するメソッド
//    func getUserCard() {
//        // if letでlocalRealmがnilでないことを確認
//        if let localRealm = localRealm {
//            // Realmから全てのカウンターを取得
//            let allCounters = localRealm.objects(Counter.self)
//            // countersに全てのカウンターを代入
//            counters = []
//            // forEachでallCountersの要素をcounterに代入。配列なので、appendでcountersに追加
//            allCounters.forEach { counter in
//                counters.append(counter)
//            }
//        }
//    }
//    
//    // カウンターの情報を取得するメソッド
//    func getCounters() {
//        // if letでlocalRealmがnilでないことを確認
//        if let localRealm = localRealm {
//            // Realmから全てのカウンターを取得
//            let allCounters = localRealm.objects(Counter.self)
//            // countersに全てのカウンターを代入
//            counters = []
//            // forEachでallCountersの要素をcounterに代入。配列なので、appendでcountersに追加
//            allCounters.forEach { counter in
//                counters.append(counter)
//            }
//        }
//    }
//    // カウンターをリセットするメソッド
//    func resetCounter(id: UUID) {
//        if let localRealm = localRealm {
//            do {
//                if let counterToReset = localRealm.object(ofType: Counter.self, forPrimaryKey: id) {
//                    try localRealm.write {
//                        counterToReset.count = 0 // Reset the count to 0
//                    }
//                }
//            } catch {
//                print("Error resetting counter \(id) to Realm: \(error)")
//            }
//        }
//    }
//}
