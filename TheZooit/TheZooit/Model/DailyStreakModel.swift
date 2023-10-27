//
//  DailyStreakModel.swift
//  TheZooit
//
//  Created by Gianmarco Cremisi on 27/10/23.
//

import Foundation

class DailyStreakModel{
    func recordStudySessionCompletion() {
        UserDefaults.standard.set(Date(), forKey: "currentSessionCompletionDate")
    }
    
    // Function to check and update streak
    func updateDailyStreak() {
        let calendar = Calendar.current
        
        guard let lastCompletionDate = UserDefaults.standard.object(forKey: "lastSessionCompletionDate") as? Date else {
            print("No previous completion date found, reset streak to 1")
            // No previous completion date found, reset streak
            UserDefaults.standard.set(Date(), forKey: "lastSessionCompletionDate")
            UserDefaults.standard.set(Date(), forKey: "currentSessionCompletionDate")
            UserDefaults.standard.set(1, forKey: "dailyStreak")
            return
        }
        
        // Check if the last completion date is in the same day as today
        if calendar.isDateInToday(lastCompletionDate) {
            //It is not a first session today, the streak stays the same
            UserDefaults.standard.set(Date(), forKey: "lastSessionCompletionDate")
            UserDefaults.standard.set(Date(), forKey: "currentSessionCompletionDate")
            
        } else if calendar.isDateInYesterday(lastCompletionDate){
            // It is a first study session today, increment the streak
            var currentStreak = UserDefaults.standard.integer(forKey: "dailyStreak")
            currentStreak += 1
            UserDefaults.standard.set(currentStreak, forKey: "dailyStreak")
            UserDefaults.standard.set(Date(), forKey: "lastSessionCompletionDate")
        } else {
            //Last session was more that one day ago, reset streak to 1
            UserDefaults.standard.set(1, forKey: "dailyStreak")
            UserDefaults.standard.set(Date(), forKey: "lastSessionCompletionDate")
            UserDefaults.standard.set(Date(), forKey: "currentSessionCompletionDate")

        }
    }
}
