//
//  ResultSessionView.swift
//  TheZooit
//
//  Created by Gianmarco Cremisi on 18/10/23.
//

import SwiftUI

struct ResultSessionView: View {
    @Environment(\.dismiss) private var dismiss
    @Environment(\.presentationMode) var presentationMode
    
    @Binding var studySession: SessionModel
    @Binding var dailyStreak: DailyStreakModel
    
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color("backgroundColor").ignoresSafeArea()
                VStack {
                    
                    Spacer()
                    Text("Horray!").bold().font(.system(size: 50))
                        .fontWidth(.expanded).foregroundStyle(Color ("customLightGreen"))
                        .padding(.bottom, 30)
                    //onlyrectangle
                    
                    ZStack(alignment: .bottom){
                        Rectangle()
                            .overlay { 
                                VStack(alignment: .leading) {
                                    Text("You have studied for")
                                    if studySession.duration != 1 { 
                                        Text("\(studySession.duration)" + " minutes!")
                                            .fontWeight(.bold)
                                            .padding(.bottom, 20)
                                    } else {
                                        Text("\(studySession.duration)" + " minute!")
                                            .fontWeight(.bold)
                                            .padding(.bottom, 20)
                                    }
                                    
                                    Text("Your reward:")
                                        .font(.system(size: 26))
                                        .fontWeight(.medium)
                                    HStack {
                                        Image(systemName: "dollarsign.circle")
                                        .fontWeight(.medium)
                                        
                                        Text("\(studySession.rewardCoins) coins")
                                            .padding(.horizontal, 5)
                                            .background(
                                                Rectangle()
                                                    .fill(Color("customLightGreen"))
                                                    .frame( height: 25))
                                            
                                            .foregroundStyle(Color("backgroundColor"))
                                            .fontWeight(.bold)
                                    }
                                }
                                .foregroundStyle(Color.white)
                                .font(.system(size: 24))
                                .fontWidth(.expanded)
                                .padding(.bottom, 180)
                            }
                            .frame( width: 298,height: 436)
                            .clipShape(RoundedRectangle(cornerRadius: 50))
                            .foregroundStyle(Color.clear)
                            .overlay(RoundedRectangle(cornerRadius: 50)
                                .stroke(Color("customGreen"), lineWidth: 1.5)).padding(.bottom, 45)
                        
                        HStack(alignment: .bottom, spacing: -35) {
                            
                            Image("SpeachBubble")
                                .overlay{
                                    Text("Good job!").foregroundStyle(Color.black)
                                        .font(.system(size: 24)).fontWeight(.bold)
                                        .fontWidth(.expanded)
                                        .padding(.bottom, 10)
                                    
                                }
                                .aspectRatio(contentMode: .fit)
                                .padding(.bottom, 200.0)
                                .frame(width: 174.0, height: 141.0)
                            
                            Image("frog-happy")
                                .resizable().aspectRatio(contentMode: .fit).padding().frame(width: 150, height: 175.0).rotationEffect(.degrees(7))
                        }
                        .padding(.leading, 100)
                    }
                    Spacer()
                    
                    //Home button
                    Button(action: {
                        withAnimation() {
                            dailyStreak.recordStudySessionCompletion()
                            dailyStreak.updateDailyStreak()
                            studySession.isFinished = true
                            dismiss()
                        }
                    }) {
                    label: do {
                        Text("Done").font(.system(size: 30))
                            .fontWeight(.bold)
                            .fontWidth(.expanded)
                            .foregroundColor(Color ("customLightGreen")).padding()
                            .overlay(
                                RoundedRectangle(cornerRadius: 56)
                                    .stroke(Color ("customLightGreen"), lineWidth: 3).frame(width: 298,height: 68)
                            )
                    }}
                    .padding(.bottom, 20 )
                }
            }
        }
    } 
}


struct ResultSessionView_Previews: PreviewProvider {
    @State static var session = SessionModel(duration: 3, rewardCoins: 3)
    @State static var streak = DailyStreakModel()
    
    static var previews: some View {
        ResultSessionView(studySession: $session, dailyStreak: $streak)
            .preferredColorScheme(.dark)
        
    }
}
