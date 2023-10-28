//
//  SessionModel.swift
//  TheZooit
//
//  Created by Yuliia on 26/10/23.
//

import Foundation

struct SessionModel: Identifiable, Equatable {
    let id = UUID()
    
    var isFinished: Bool = false
    var duration: Int = 0
    var rewardCoins: Int = 0
    
}
