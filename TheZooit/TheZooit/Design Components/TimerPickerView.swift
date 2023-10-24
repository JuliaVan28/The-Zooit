//
//  TimerPickerView.swift
//  TheZooit
//
//  Created by Yuliia on 23/10/23.
//

import SwiftUI

struct TimerPickerView: View {
    private let pickerViewTitlePadding: CGFloat = 4.0
    
    let title: String
    let range: ClosedRange<Int>
    let binding: Binding<Int>
    
    var body: some View {
        HStack(spacing: -pickerViewTitlePadding) {
                    Picker(title, selection: binding) {
                        ForEach(range, id: \.self) { timeIncrement in
                            HStack {
                                Spacer()
                                Text("\(timeIncrement)")
                                    .foregroundColor(.white)
                                    .multilineTextAlignment(.trailing)
                            }
                        }
                    }
                    .pickerStyle(InlinePickerStyle())
                    .labelsHidden()

                    Text(title)
                        .fontWeight(.bold)
                }
    }
}

struct TimerPickerView_Previews: PreviewProvider {
    @State static var selectedSeconds = 10
    static var previews: some View {
        TimerPickerView(title: "Seconds", range: 0...59, binding: $selectedSeconds)
    }
}

