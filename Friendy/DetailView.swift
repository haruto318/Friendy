//
//  DetailView.swift
//  Friendy
//
//  Created by 濱野遥斗 on 2024/02/23.
//

import SwiftUI

struct DetailView: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @EnvironmentObject var modelData: DBEditProfileModel
    var Card: Friend
    var isDetailView: Bool
    
    let windowScene = UIApplication.shared.connectedScenes.first as? UIWindowScene

    
    var body: some View {
        @State var edge = windowScene?.windows.first?.safeAreaInsets
        
        ZStack {
            Color(UIColor.init(hexString: "F4F4F4")).ignoresSafeArea()
            ScrollView  {
                if let uiImage = UIImage(data: modelData.image) {
                    Image(uiImage: uiImage)
                        .resizable()
                        .aspectRatio(1,contentMode: .fit)
                        .edgesIgnoringSafeArea(.bottom)
                        .cornerRadius(28, corners: [.bottomLeft, .bottomRight])
                        .shadow(color: Color.black.opacity(0.3), radius: 30, x: 0, y: 0)
                        .zIndex(1)
                        .overlay(
                            VStack{
                                HStack{
                                    Spacer()
                                    Button(action: {
                                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)){
                                            presentationMode.wrappedValue.dismiss()
                                        }
                                    }){
                                        Image(systemName: "xmark.circle.fill").foregroundStyle(.white.opacity(0.8)).font(.system(size: 25)).padding()
                                    }
                                }
                                Spacer()
                            }.padding()
                        )
                }
                
                DescriptionView(Card: Card, isDetailView: isDetailView).zIndex(0).padding(.bottom,edge!.bottom + 70)
            }
        }
        .edgesIgnoringSafeArea(.all)
        .navigationBarBackButtonHidden(true)
//        .navigationBarItems(leading: BackButton(action: {presentationMode.wrappedValue.dismiss()}), trailing: Image(systemName: "chevron.backward"))
    }
}


struct DescriptionView: View {
    var Card: Friend
    var isDetailView: Bool
    @EnvironmentObject var viewStatus: ViewStatusModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20){
            
            VStack (alignment: .leading, spacing: 10) {
                VStack(alignment: .leading, spacing: 10){
                    Text(Card.nickname)
                        .font(.custom("NotoSansJP-Medium", size: 24.0))
                    Text(Card.name)
                        .font(.custom("NotoSansJP-Regular", size: 14.0))
                }
                
                HStack(spacing: 15){
                    Image(systemName: "envelope")
                    Text(Card.address)
                        .font(.custom("NotoSansJP-Light", size: 14.0))
                    Spacer()
                }.padding(.horizontal)
            }
            .background(Color(UIColor.init(hexString: "F4F4F4")).ignoresSafeArea())
            
            Divider()
            
            VStack (alignment: .leading, spacing: 15) {
                VStack(alignment: .leading, spacing: 10){
                    Text("SNS")
                        .font(.custom("NotoSansJP-Medium", size: 24.0))
                }
                if Card.twitter != ""{
                    HStack(spacing: 15){
                        Image(decorative: "logo-black")
                            .resizable()
                            .frame(width: 15, height: 15)
                            .offset(x: 1)
                        Text(Card.twitter)
                            .font(.custom("NotoSansJP-Light", size: 14.0))
                        Spacer()
                    }.padding(.horizontal)
                }
                if Card.instagram != ""{
                    HStack(spacing: 15){
                        Image(decorative: "Instagram_Glyph_Black")
                            .resizable()
                            .frame(width: 17, height: 17)
                            .offset(x: 0.5)
                        Text(Card.instagram)
                            .font(.custom("NotoSansJP-Light", size: 14.0))
                        Spacer()
                    }.padding(.horizontal)
                }
                if Card.github != ""{
                    HStack(spacing: 15){
                        Image(decorative: "github-mark")
                            .resizable()
                            .frame(width: 18, height: 18)
                        Text(Card.github)
                            .font(.custom("NotoSansJP-Light", size: 14.0))
                        Spacer()
                    }.padding(.horizontal)
                }
                if Card.blog != ""{
                    HStack(spacing: 15){
                        Image(systemName: "bookmark")
                            .frame(width: 18, height: 18)
                            .offset(x: -0.1)
                        Text(Card.blog)
                            .font(.custom("NotoSansJP-Light", size: 14.0))
                        Spacer()
                    }.padding(.horizontal)
                }
            }
            .background(Color(UIColor.init(hexString: "F4F4F4")).ignoresSafeArea())
            
            Spacer()
            
            if isDetailView {
                HStack{
                    Spacer()
                    Text("プロフィールを編集").font(.custom("NotoSansJP-Medium", size: 16.0)).foregroundStyle(Color(UIColor(hexString: "000000")))
                        .background(.clear)
                        .frame(width: 320, height: 50)
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(Color.black, lineWidth: 1)
                        )
                        .onTapGesture {
                            withAnimation(.none) {
                                print("push")
                                viewStatus.isShowEditView = true
                                //                                    imageState.toggle()
                            }
                        }
                    Spacer()
                }
                Spacer()
            }
            
        }.padding().padding(.horizontal)
        
    }
}

//struct RoundedCorner: Shape {
//
//    var radius: CGFloat = .infinity
//    var corners: UIRectCorner = .allCorners
//
//    func path(in rect: CGRect) -> Path {
//        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
//        return Path(path.cgPath)
//    }
//}
//
//extension View {
//    func cornerRadius(_ radius: CGFloat, corners: UIRectCorner) -> some View {
//        clipShape( RoundedCorner(radius: radius, corners: corners) )
//    }
//}
//
//
//struct BackButton: View {
//    let action: () -> Void
//    var body: some View {
//        Button(action: action) {
//            Image(systemName: "chevron.backward")
//                .foregroundColor(.black)
//                .padding(.all, 12)
//                .background(Color.white)
//                .cornerRadius(8.0)
//        }
//    }
//}


//#Preview {
//    DetailView(Card: CardData(image: "sample5" ,name: "はまの はると", nickname: "けまり", address: "haruto.yhs318@gmail.com", twitter: "https://twitter.com/ApplivGames", instagram: "https://twitter.com/ApplivGames", github: "https://twitter.com/ApplivGames", blog: "https://twitter.com/ApplivGames", like: true), isDetailView: true)
//}
