//
//  TimerViewModel.swift
//  TheZooit
//
//  Created by Yuliia on 20/10/23.
//

import Foundation
import SwiftUI

class TimerViewModel: ObservableObject {
    @Published var selectedHoursAmount = 0
    @Published var selectedMinutesAmount = 10
    @Published var selectedSecondsAmount = 0
    
    @Published var secondsToCompletion: Int = 0
    @Published var progress: Float = 0.0
    @Published var animationProgress: Double = 0.0
    @Published var isTimerFinished: Bool = false
    @Published var studySession: SessionModel = SessionModel()

    
    
    let hoursRange = 0...23
    let minutesRange = 0...59
    let secondsRange = 0...59
    
    // States the timer can be in
    enum TimerState {
        case active
        case paused
        case resumed
        case cancelled
    }
    
    // MARK: Private Properties
    private var timer = Timer()
    private  var animationTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    private var totalTimeForCurrentSelection: Int {
        (selectedHoursAmount * 3600) + (selectedMinutesAmount * 60) + selectedSecondsAmount
    }
    private var defaultTimerSettings: Int = 600
    
    //MARK: Getters
    func getTotalTime () -> Int {
        totalTimeForCurrentSelection
    }
    
    // MARK: Public Properties
    @Published var state: TimerState = .cancelled {
        didSet {
            
            switch state {
            case .cancelled:
                // Cancel the timer and reset all progress properties
                withAnimation {
                    studySession.duration = Int((totalTimeForCurrentSelection - secondsToCompletion) / 60)
                    studySession.rewardCoins = studySession.duration * 10
                    
                    timer.invalidate()
                    animationTimer.upstream.connect().cancel()
                    
                    secondsToCompletion = defaultTimerSettings
                    progress = 0
                    animationProgress = 0
                    isTimerFinished = true
                    
                }
                
            case .active:
                // Starts the timer and sets all progress properties to their initial values
                startTimer()
                
                animationTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
                
                secondsToCompletion = totalTimeForCurrentSelection
                progress = 1.0
                studySession.rewardCoins = 0
                studySession.duration = 0
                isTimerFinished = false
                studySession.isFinished = false
                
            case .paused:
                    animationTimer.upstream.connect().cancel()
                    timer.invalidate()
                
            case .resumed:
                withAnimation {
                    startTimer()
                }
            }
        }
    }
    
    private func startTimer() {
        timer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: { [weak self] _ in
            guard let self else { return }
            
            self.secondsToCompletion -= 1
            self.progress = Float(self.secondsToCompletion) / Float(self.totalTimeForCurrentSelection)
            
            self.animationProgress += 1
            animationTimer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
            
            if self.secondsToCompletion < 1 {
                withAnimation {
                    self.state = .cancelled
                }
            }
        })
        
    }
    
    
}





