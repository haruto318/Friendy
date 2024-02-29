//
//  PageThreeView.swift
//  Friendy
//
//  Created by 濱野遥斗 on 2024/02/25.
//

import SwiftUI
import PhotosUI

struct PageThreeView: View {
    
    /// フォトピッカー内で選択したアイテムが保持されるプロパティ
    @State var selectedItem: PhotosPickerItem?
    /// PhotosPickerItem -> UIImageに変換したアイテムを格納するプロパティ
    @State var selectedImage: Data?
    @EnvironmentObject var modelData: DBEditProfileModel
    
    var body: some View {
        VStack(spacing: 10){
            VStack(spacing: 20){
                Text("プロフィール画像を選択してください").font(.custom("NotoSansJP-Regular", size: 20.0)).foregroundStyle(Color(UIColor(hexString: "333333"))).padding(.horizontal)
                Spacer()
                
                VStack(spacing: 10){
                    if let uiImage = UIImage(data: modelData.image) {
                        Image(uiImage: uiImage)
                            .resizable()
                            .scaledToFill()
                            .frame(width:200, height: 200)
                            .cornerRadius(30)
                    } else {
                        RoundedRectangle(cornerRadius: 30)
                            .fill(Color(UIColor(hexString: "D9D9D9")))
                            .frame(width:200, height: 200)
                    }
                }.padding(.horizontal)
                Spacer()
                
                VStack(spacing: 10){
                    HStack{
                        Spacer()
                        PhotosPicker(selection: $selectedItem) {
                            Text("写真を選択").font(.custom("NotoSansJP-Medium", size: 16.0)).foregroundStyle(Color(UIColor(hexString: "000000")))
                                .background(.clear)
                                .frame(width: 220, height: 50)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.black, lineWidth: 1)
                                )
                        }// PhotosPickerItem -> Data -> UIImageに変換
                        .onChange(of: selectedItem) {  item in
                            
                            Task {
                                guard let data = try? await item?.loadTransferable(type: Data.self) else { return }
                                guard let uiImage = UIImage(data: data) else { return }
                                modelData.image = uiImage.pngData()!
                            }
                        }
                        Spacer()
                    }
                }.padding(.horizontal)
                Spacer()
                
                Spacer()
            }.padding(.horizontal)
        }
    }
}


struct imagePicker: View {
    var category: String
    @Binding var inputInfo: String
    var body: some View {
        TextField(category, text: $inputInfo)
            .padding()
//            .padding(.horizontal)
            .foregroundColor(Color(UIColor(hexString: "333333")))
            .font(.custom("NotoSansJP-Regular", size: 14))
            .background(
                RoundedRectangle(cornerRadius: 10)
                    .stroke(Color(UIColor(hexString: "C9C9C9")), lineWidth: 1)
                .foregroundColor(.clear)
                .frame(height: 40)
            )
    }
}

#Preview {
    PageThreeView().environmentObject(DBFriendListModel()).environmentObject(DBEditProfileModel())
}
