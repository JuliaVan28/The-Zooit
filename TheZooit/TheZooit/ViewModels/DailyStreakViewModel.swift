//
//  DailyStreakModel.swift
//  TheZooit
//
//  Created by Gianmarco Cremisi on 27/10/23.
//

import Foundation
import SwiftUI

class DailyStreakViewModel{
    
    @AppStorage("lastSessionCompletionDate") var lastSessionCompletionDate: Date?
    @AppStorage("currentSessionCompletionDate") var currentSessionCompletionDate: Date?
    @AppStorage("dailyStreak") var dailyStreakCounter: Int = 0
    
    func recordStudySessionCompletion() {
        UserDefaults.standard.set(Date(), forKey: "currentSessionCompletionDate")
    }
    
    // Function to check and update streak
    func updateDailyStreak() {
        let calendar = Calendar.current
        
        guard let lastCompletionDate = UserDefaults.standard.object(forKey: "lastSessionCompletionDate") as? Date else {
            // No previous completion date found, reset streak to 1
            lastSessionCompletionDate = Date()
            currentSessionCompletionDate = Date()
            dailyStreakCounter = 1
            return
        }
        
        // Check if the last completion date is in the same day as today
        if calendar.isDateInToday(lastCompletionDate) {
            //It is not a first session today, the streak stays the same
            lastSessionCompletionDate = Date()
            currentSessionCompletionDate = Date()
        } else if calendar.isDateInYesterday(lastCompletionDate){
            // It is a first study session today, increment the streak
            dailyStreakCounter += 1
            lastSessionCompletionDate = Date()
        } else {
            //Last session was more that one day ago, reset streak to 1
            lastSessionCompletionDate = Date()
            currentSessionCompletionDate = Date()
            dailyStreakCounter = 1
        }
    }
}
