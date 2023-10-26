//
//  CircularProgressView.swift
//  TheZooit
//
//  Created by Yuliia on 21/10/23.
//

import SwiftUI

struct CircularProgressView: View {
    
    @Binding var progress: Double
    @ObservedObject var timerModel: TimerViewModel
    
    var body: some View {
        ZStack {
            // Gray circle
            Circle()
                .stroke(lineWidth: 8.0)
                .opacity(0.3)
                .foregroundColor(.gray)

             // Foreground circle
            Circle()
                .trim(from: 0.0, to:  progress/Double(timerModel.getTotalTime()))
                .stroke(style: StrokeStyle(lineWidth: 8.0,
                    lineCap: .round, lineJoin: .round))
                .foregroundColor(Color("customGreen"))
                .rotationEffect(Angle(degrees: -90))
            
                    
        }
        .animation(Animation.linear(duration: 1), value: progress)
    }
}

#Preview {
    CircularProgressView(progress: .constant(10), timerModel: TimerViewModel())
}
