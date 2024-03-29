//
//  onBoarding.swift
//  Friendy
//
//  Created by 濱野遥斗 on 2024/02/25.
//

import SwiftUI


struct OnBoarding: View {
    
    @State var offset: CGFloat = .zero
    @State var isShowBackBtn: Bool = false
    @State var isShowNextBtn: Bool = true
    @State private var progressVal = 0.0
    
    @State var inputName: String = ""//旅行名
    @State var inputDestination: String = ""//行き先
    
    @State var selection = 1
    
    var body: some View {
//        NavigationView{
            VStack(spacing: 10){
                ProgressBar(progressVal: $progressVal, selection: selection)
                
                Spacer()
                
                ScrollView(showsIndicators: false){
                    VStack{
                        if selection == 1 {
                            PageOneView()
                        } else if selection == 2 {
                            PageTwoView()
                            
                        } else {
                            PageThreeView()
                            
                        }
                
                    }.animation(.easeIn, value: selection)
                }
                
                NavigateButton(offset: $offset, progressVal: $progressVal, selection: $selection, isShowBackBtn: $isShowBackBtn, isShowNextBtn: $isShowNextBtn )
            
                
                Spacer()
            }
//        }
    }
}

extension View {
    func sync<T: Equatable>(_ published: Binding<T>, with binding: Binding<T>) -> some View {
        self
            .onChange(of: published.wrappedValue) { published in
                binding.wrappedValue = published
            }
            .onChange(of: binding.wrappedValue) { binding in
                published.wrappedValue = binding
            }
    }
}


struct OnBoarding_Previews: PreviewProvider {
    static var previews: some View {
        OnBoarding()
    }
}
