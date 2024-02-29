//
//  ViewStatusModel.swift
//  Friendy
//
//  Created by 濱野遥斗 on 2024/02/25.
//

import Foundation

class ViewStatusModel: ObservableObject {
    @Published var isShowEditView: Bool = false
    @Published var introPage: Int = 1
}
