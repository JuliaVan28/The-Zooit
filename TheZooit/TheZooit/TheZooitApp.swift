//
//  TheZooitApp.swift
//  TheZooit
//
//  Created by Yuliia on 17/10/23.
//

import SwiftUI
import UIKit //for UIApplication
@main
struct TheZooitApp: App {
    var body: some Scene {
        WindowGroup {
            NavigationStack {
                MainView()
                    .environment(\.colorScheme, .dark)
                    .onAppear(){
                        UIApplication.shared.isIdleTimerDisabled = true //the screen dosen't block when you star the timer
                    }
            }
        }
    }
}


