import SwiftUI

struct ColorList: View {
    
    var cards: [CardData]
    
    @State private var isTapped = false
    
    @State var isDetectingLongPress: Bool = false
    @State var totalNumberOfTaps = 0
    
    @Binding var show: Bool
    @Binding var currentCard: CardData
    @Namespace var namespace
    
    var body: some View {
        if show == true {
            ZStack {
                Color(UIColor.init(hexString: "F4F4F4")).ignoresSafeArea()
                ScrollView  {
                    Image(currentCard.image)
                        .resizable()
                        .aspectRatio(1,contentMode: .fit)
                        .edgesIgnoringSafeArea(.bottom)
                        .cornerRadius(16, corners: [.bottomLeft, .bottomRight])
                        .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 0)
                        .zIndex(1)
                        .matchedGeometryEffect(id: "image\(currentCard.id)", in: namespace)
                        .animation(.easeInOut, value: show)
                        .overlay(
                            VStack{
                                HStack{
                                    Spacer()
                                    Button(action: {
                                        withAnimation(.easeIn(duration: 0.5)){
                                            show.toggle()
                                        }
                                    }){
                                        Image(systemName: "xmark.circle.fill").foregroundStyle(.white.opacity(0.8)).font(.system(size: 25)).padding(.horizontal)
                                    }
                                }
                                Spacer()
                            }.padding()
                        )
                    
                    DescriptionView(Card: currentCard, isDetailView: false).zIndex(0)
                }
            }
            .edgesIgnoringSafeArea(.all)        }
        else {
            VStack{
                HeaderView()
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 300) {
                        ForEach(cards, id: \.self) { card in
                            GeometryReader { geometry in
                                Image(decorative: card.image)
                                    .resizable()
                                    .scaledToFill()
                                    .frame(width: 300, height: 300, alignment: .center)
                                    .cornerRadius(16)
                                    .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 0)
                                    .rotation3DEffect(Angle(degrees: (Double(geometry.frame(in: .global).minX) - 50) / -20), axis: (x: 0, y: 1.0, z: 0))
                                    .scaleEffect(self.isDetectingLongPress ? 0.97 : 1.0)
                                    .matchedGeometryEffect(id: "image\(card.id)", in: namespace)
                                    .onTapGesture {
                                        withAnimation(.spring(response: 0.6, dampingFraction: 0.8)){
                                            show.toggle()
                                            currentCard = card
                                            print(card.image)
                                        }
                                    }
                            }
                        }
                        GeometryReader { geometry in ///透明画像
                            Rectangle()
                                .foregroundColor(.clear)
                                .frame(width: 300, height: 300, alignment: .center)
                                .cornerRadius(16)
                                .shadow(color: Color.black.opacity(0.3), radius: 20, x: 0, y: 0)
                                .rotation3DEffect(Angle(degrees: (Double(geometry.frame(in: .global).minX) - 50) / -20), axis: (x: 0, y: 1.0, z: 0))
                        }
                    }.padding(.horizontal, 50)
                        .padding(.vertical, 100)
                    
                }
            }
        }
    }
}

#Preview {
    HomeView()
}

//#Preview {
//    ColorList(colors: ["sample1", "sample2", "sample3", "sample4", "sample5"], show: Binding<Bool> )
//}
