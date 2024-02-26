//
//  CounterView.swift
//  Friendy
//
//  Created by 濱野遥斗 on 2024/02/25.
//
//
import SwiftUI
import RealmSwift

struct CounterView: View {
    // @ObservedObject var realmManagerは、RealmManagerクラスのインスタンスを生成
    @EnvironmentObject var modelData: DBEditProfileModel

    var body: some View {
        NavigationView{
            List{
                Section(header: Text("name")){
                    TextField("", text: $modelData.name)
                }
                Section(header: Text("nick")){
                    TextField("", text: $modelData.nickname)
                }
            }.toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(action: {
                        modelData.addData()
//                        modelData.newOpenPage.toggle()
                        
                    }, label: {
                        Image(systemName: "plus")
                    })
                }
            }
        }
    }
}

struct Home: View {
    @StateObject var modelData = DBEditProfileModel()
    var body: some View {
        NavigationView{
            ScrollView{
                VStack(spacing: 10, content: {
                    Text(modelData.name)
                    Text(modelData.nickname)
                }).frame(maxWidth: .infinity)
                    .padding(10)
                    .background(.gray.opacity(0.15))
                    .cornerRadius(10)
            }.toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(action: {modelData.newOpenPage.toggle()}, label: {
                        Image(systemName: "plus")
                    })
                }
            }.sheet(isPresented: $modelData.newOpenPage, content: {
                CounterView().environmentObject(modelData)
            }).padding()
        }
    }
}


#Preview {
    Home()
}
