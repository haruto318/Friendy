//
//  NavigateButton.swift
//  Friendy
//
//  Created by 濱野遥斗 on 2024/02/25.
//

import SwiftUI

struct NavigateButton: View {
    @Binding var offset: CGFloat
    
    @Binding var progressVal: Double
    @Binding var selection: Int
    @Binding var isShowBackBtn: Bool
    @Binding var isShowNextBtn: Bool
    var body: some View {
        HStack(spacing: 50) {///画面下部の矢印ボタン
            Spacer()
            Button {
                backToPriveousPage()
                progressVal -= 50
                selection -= 1
            } label: {
                Image(systemName: "arrowtriangle.backward.fill")
                    .foregroundColor(Color(UIColor(hexString: "D9D9D9")))
                    .font(.system(size: 50))
                
            }
            .disabled(!isShowBackBtn)
            .opacity(isShowBackBtn ? 1 : 0)
            .animation(.easeInOut, value: getIndex())
            
            HStack(spacing: 20) {
                ForEach(0..<3, id: \.self) { index in
                    
                    Circle()
                        .fill(Color(UIColor(hexString: index == selection-1 ? "9C9C9C" : "D9D9D9")))
                        .frame(width: 12, height: 12)
                        .scaleEffect(index == selection-1 ? 1.2 : 1)
                        .animation(.easeInOut, value: selection)
                }
            }
            .frame(maxWidth: .infinity)
            
            
            Button {
                goToNextPage()
                progressVal += 50
                selection += 1
            } label: {
                Image(systemName: "arrowtriangle.forward.fill")
                    .foregroundColor(Color(UIColor(hexString: "D9D9D9")))
                    .font(.system(size: 50))
                
            }
            .disabled(!isShowNextBtn)
            .opacity(isShowNextBtn ? 1 : 0)
            .animation(.easeInOut, value: getIndex())
            Spacer()
        }
        .padding(.vertical)
    }
    
    
    
    func getIndex() -> Int {
        let process = offset / getScreenBounds().width
        return Int(process)
    }
    
    func goToNextPage() {
        let index = selection + 1
        if(index == 1){
            isShowBackBtn = false
            isShowNextBtn = true
        } else if (index == 3) {
            isShowNextBtn = false
            isShowBackBtn = true
        } else {
            isShowBackBtn = true
            isShowNextBtn = true
        }
    }
    
    func backToPriveousPage() {
        let index = selection - 1
        if(index == 1){
            isShowBackBtn = false
            isShowNextBtn = true
        } else if (index == 3) {
            isShowNextBtn = false
            isShowBackBtn = true
        } else {
            isShowBackBtn = true
            isShowNextBtn = true
        }
    }
}

//extension View {
//    
//    func getScreenBounds() -> CGRect {
//        return UIScreen.main.bounds
//    }
//    
//}

//#Preview {
//    NavigateButton()
//}
