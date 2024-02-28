//
//  PageOneView.swift
//  Friendy
//
//  Created by 濱野遥斗 on 2024/02/25.
//

import SwiftUI


struct PageOneView: View {
    
    @EnvironmentObject var modelData: DBEditProfileModel
    
    var body: some View {
        VStack(spacing: 10){
            VStack(spacing: 20){
                Text("名前と表示名を入力してください").font(.custom("NotoSansJP-Regular", size: 20.0)).foregroundStyle(Color(UIColor(hexString: "333333"))).padding(.horizontal)
                Spacer()
                
                VStack(spacing: 10){
                    HStack{
                        Text("名前").font(.custom("NotoSansJP-Regular", size: 20.0)).foregroundStyle(Color(UIColor(hexString: "333333")))
                        Spacer()
                    }
                    CustomTextField(category: "名前を入力してください", inputInfo: $modelData.name)
                }.padding(.horizontal)
                Spacer()
                
                VStack(spacing: 10){
                    HStack{
                        Text("表示名").font(.custom("NotoSansJP-Regular", size: 20.0)).foregroundStyle(Color(UIColor(hexString: "333333")))
                        Spacer()
                    }
                    CustomTextField(category: "ニックネームを入力してください", inputInfo: $modelData.nickname)
                }.padding(.horizontal)
                Spacer()
                
                Spacer()
            }.padding(.horizontal)
        }
    }
}


struct PageOneView_Previews: PreviewProvider {
    static var previews: some View {
//        OnBoarding()
        PageOneView().environmentObject(DBFriendListModel()).environmentObject(DBEditProfileModel())
    }
}
