//
//  MainView.swift
//  TheZooit
//
//  Created by Yuliia on 17/10/23.
//

import SwiftUI


struct MainView: View {
    @AppStorage("userCoins") var userCoins: Int = 0

    @StateObject private var timerModel = TimerViewModel()
    @State var dailyStreak = DailyStreakViewModel()
    @StateObject var music = MusicViewModel()
    
    @State private var isCanceledTimer: Bool = false
    @State private var showTimerSettingsModal: Bool = false
    @State private var timerValue: Int = 0

    var body: some View {
        ZStack {
            Color("backgroundColor").ignoresSafeArea()
            
            VStack {
                //MARK:  Upper Navigation Bar
                HStack {
                    // NavigationLink(destination: ContentView()) {
                    Image(systemName: "dollarsign.circle")
                        .foregroundStyle(Color("customLightGreen"))
                        .font(.system(size: 30))
                        .frame(width: 35, height: 35)
                    
                    //  }
                    Text("\(userCoins)")
                        .font(.system(size: 28))
                        .fontWeight(.regular)
                        .fontWidth(.expanded)
                        .contentTransition(.numericText())
                        .onChange(of: timerModel.studySession.isFinished && timerModel.studySession.isFinished != false ) {
                            withAnimation(.default.speed(0.7).delay(0.5)) {
                                userCoins += timerModel.studySession.rewardCoins
                            }
                        }
                    Spacer()
                    Image(systemName: "flame.circle")
                        .foregroundStyle(Color("customLightGreen"))
                        .font(.system(size: 30))
                        .frame(width: 35, height: 35)
                    
                    Text("\(dailyStreak.dailyStreakCounter)")
                        .font(.system(size: 28))
                        .fontWeight(.regular)
                        .fontWidth(.expanded)
                    Spacer()
                    //Music button
                    NavigationLink(destination: MusicView(music: music).preferredColorScheme(.dark)) {
                        Image(systemName: "music.note.list")
                            .foregroundStyle(Color("customLightGreen"))
                            .font(.system(size: 16))
                            .frame(width: 30, height: 30)
                            .overlay(
                                Circle()
                                    .stroke(Color("customLightGreen"), lineWidth: 2.5)
                            )
                        
                        
                    }
                    
                }.padding(.horizontal, 20)
                //: Upper Navigation bar
                Spacer()
                
                //MARK:  Frog Image
                //TODO: Change hardcoded image to image from model
                ZStack {
                    CircularProgressView(progress: $timerModel.animationProgress, timerModel: timerModel)
                        .frame(width: 350)
                        .padding(.bottom, 30)
                        .opacity(timerModel.state == .active || timerModel.state == .paused || timerModel.state == .resumed ? 1 : 0)
                    withAnimation {
                        Image("frog-main")
                            .resizable()
                            .frame(width: 260, height: 310)
                            .padding(.bottom, 30)
                            .onTapGesture {
                                if timerModel.state == .cancelled {
                                    music.playFrogSound()
                                }
                            }
                    }.scaleEffect(timerModel.state == .active || timerModel.state == .paused || timerModel.state == .resumed ? 0.9 : 1.0)
                        .scaleEffect(timerModel.state == .cancelled ? 1.0 : 0.9)
                        .opacity(timerModel.state == .active || timerModel.state == .paused || timerModel.state == .resumed ? 0.7 : 1)
                }
                //MARK: Timer Section
                Text("Timer")
                    .font(.system(size: 50))
                    .fontWeight(.bold)
                    .fontWidth(.expanded)
                    .foregroundStyle(Color("customLightGreen"))
                    .padding(.top, 10)
                
                Button {
                    if timerModel.state == .cancelled {
                        showTimerSettingsModal.toggle()
                    }
                } label: {
                    Text( timerModel.state == .active || timerModel.state == .paused || timerModel.state == .resumed ? timerValue.asTimestamp : timerModel.getTotalTime().asTimestamp)
                        .contentTransition(.numericText())
                        .onChange(of: timerModel.secondsToCompletion) {
                            withAnimation(.default.speed(1)) {
                                timerValue = timerModel.secondsToCompletion
                            }
                        }
                        .font(.system(size: 54))
                        .fontWeight(.bold)
                        .fontWidth(.expanded)
                        .foregroundStyle(.white)
                }.padding(.bottom, 20)
                
                //MARK: Timer Settings
                    .sheet(isPresented: $showTimerSettingsModal) {
                        ZStack {
                            Color("backgroundColor").ignoresSafeArea()
                            VStack {
                                HStack {
                                    TimerPickerView(title: "hours", range: timerModel.hoursRange, binding: $timerModel.selectedHoursAmount)
                                    TimerPickerView(title: "min", range: timerModel.minutesRange, binding: $timerModel.selectedMinutesAmount)
                                    TimerPickerView(title: "sec", range: timerModel.secondsRange, binding: $timerModel.selectedSecondsAmount)
                                }
                                .padding(.all, 32)
                                .frame(maxWidth: .infinity, maxHeight: .infinity)
                                .background(Color("backgroundColor"))
                                .foregroundColor(.white)
                                
                                Button {
                                    showTimerSettingsModal = false
                                } label: {
                                    ZStack {
                                        Rectangle()
                                            .frame( width: 210,height: 60)
                                            .clipShape(RoundedRectangle(cornerRadius: 56))
                                            .foregroundStyle(Color.clear)
                                            .overlay(RoundedRectangle(cornerRadius: 56)
                                                .stroke(Color("customLightGreen"), lineWidth: 3))
                                        HStack {
                                            Text("Done")
                                                .bold()
                                                .fontWidth(.expanded)
                                                .font(.system(size: 30))
                                        }                                    .foregroundColor(Color("customLightGreen"))
                                    }.padding(.bottom, 20)
                                }
                            }
                            
                        }
                        .presentationDetents([.medium])
                        .presentationDragIndicator(.visible)
                        .colorScheme(.dark)
                        
                    }
                //: Timer Section
                
                //MARK: Timer buttons
                switch timerModel.state {
                case .active, .resumed:
                    withAnimation {
                        HStack (spacing: 30) {
                            Button {
                                timerModel.state = .paused
                            } label: {
                                
                                Image(systemName: "pause.circle.fill")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 57))
                            }
                            
                            Button {
                                timerModel.state = .paused
                                isCanceledTimer = true
                            } label: {
                                Image(systemName: "xmark.circle")
                                    .foregroundStyle(.white)
                                    .font(.system(size: 57))
                                    .opacity(0.9)
                            }
                            //MARK: Alert
                            .alert(isPresented: $isCanceledTimer) {
                                Alert(
                                    title: Text("Are you sure you want to cancel the study session?"),
                                    primaryButton: .default(
                                        Text("Yes"),
                                        action: {
                                            timerModel.isTimerFinished = true
                                            withAnimation(.easeIn(duration: 0.3)) {
                                                timerModel.state = .cancelled
                                            }
                                        }),
                                    secondaryButton: .cancel(
                                        Text("No"),
                                        action: {
                                            withAnimation(.easeIn(duration: 0.3)) {
                                                timerModel.state = .resumed
                                            }
                                        }))
                            }
                        }.padding(.top, 1)
                    }
                    
                case .paused:
                    HStack (spacing: 30) {
                        Button {
                            timerModel.state = .resumed
                        } label: {
                            
                            Image(systemName: "play.circle.fill")
                                .foregroundStyle(.white)
                                .font(.system(size: 57))
                            
                        }
                        
                        Button {
                            isCanceledTimer = true
                        } label: {
                            Image(systemName: "xmark.circle")
                                .foregroundStyle(.white)
                                .font(.system(size: 57))
                                .opacity(0.9)
                        }.alert(isPresented: $isCanceledTimer) {
                            Alert(
                                title: Text("Are you sure you want to cancel the study session?"),
                                primaryButton: .default(
                                    Text("Yes"),
                                    action: {
                                        withAnimation(.easeIn(duration: 0.3)) {
                                            timerModel.state = .cancelled
                                        }
                                    }),
                                secondaryButton: .cancel(
                                    Text("No"),
                                    action: {
                                        withAnimation(.easeIn(duration: 0.3)) {
                                            timerModel.state = .resumed
                                        }
                                    }))
                        }
                    }.padding(.top, 1)
                case .cancelled:
                    Button {
                        isCanceledTimer = false
                        withAnimation(.easeIn(duration: 0.3)) {
                            timerModel.state = .active
                        }
                    } label: {
                        withAnimation {
                            ZStack {
                                Rectangle()
                                    .frame( width: 210,height: 60)
                                    .clipShape(RoundedRectangle(cornerRadius: 56))
                                    .foregroundStyle(Color("customLightGreen"))
                                    .overlay(RoundedRectangle(cornerRadius: 56)
                                        .stroke(Color("customLightGreen"), lineWidth: 3))
                                HStack {
                                    Image(systemName: "play.fill")
                                        .font(.system(size: 24))
                                    Text("Start")
                                        .bold()
                                        .fontWidth(.expanded)
                                        .font(.system(size: 30))
                                }
                                .foregroundColor(Color("backgroundColor"))
                            }.padding(.top, 5)
                        }
                    }
                }
            }.padding(.bottom, 20)
            .fullScreenCover(
                isPresented: $timerModel.isTimerFinished,
                    content: {
                        ResultSessionView(studySession: $timerModel.studySession, dailyStreak: $dailyStreak)
                            .preferredColorScheme(/*@START_MENU_TOKEN@*/.dark/*@END_MENU_TOKEN@*/)
                    })
        }.onAppear {
            // Checking if the last study session was 2 or more days ago
            let dayBeforeYesterdayDate: Date! = Calendar.current.date(byAdding: .day, value: -2, to: Date())
            if let lastCompletionDate = UserDefaults.standard.object(forKey: "lastSessionCompletionDate") as? Date {
                if lastCompletionDate <= dayBeforeYesterdayDate {
                    UserDefaults.standard.set(0, forKey: "dailyStreak")
                }
            }

        }
    }
}

#Preview {
    MainView()
        .environment(\.colorScheme, .dark)
}
