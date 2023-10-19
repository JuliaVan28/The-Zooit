//
//  MainView.swift
//  TheZooit
//
//  Created by Yuliia on 17/10/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
            ZStack {
                Color("backgroundColor").ignoresSafeArea()
                
                VStack {
                    // Upper Navigation Bar
                    HStack {
                        NavigationLink(destination: ContentView()) {
                            Image(systemName: "dollarsign.circle")
                                .foregroundStyle(Color("customLightGreen"))
                                .font(.system(size: 30))
                                .frame(width: 35, height: 35)
                            
                        }
                        //TODO: change to coins model data
                        Text("356")
                            .font(.system(size: 28))
                            .fontWeight(.regular)
                            .fontWidth(.expanded)
                        Spacer()
                        NavigationLink(destination: ContentView()) {
                            Image(systemName: "flame.circle")
                                .foregroundStyle(Color("customLightGreen"))
                                .font(.system(size: 30))
                                .frame(width: 35, height: 35)
                            
                            
                        }
                        
                        //TODO: change to streak model data
                        Text("3")
                            .font(.system(size: 28))
                            .fontWeight(.regular)
                            .fontWidth(.expanded)
                        Spacer()
                        NavigationLink(destination: ContentView()) {
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
                    Spacer()
                    
                    // Frog Image
                    //TODO: Change hardcoded image to image from model
                    Image("frog-main")
                        .padding(.bottom, 60)
                    
                    
                    // Timer section
                    Text("Timer")
                        .font(.system(size: 42))
                        .fontWeight(.bold)
                        .fontWidth(.expanded)
                        .foregroundStyle(Color("customLightGreen"))
                        
                    
                    //TODO: Link it to timer data
                    Text("10:00")
                        .font(.system(size: 60))
                        .fontWeight(.bold)
                        .fontWidth(.expanded)
                        .foregroundStyle(.white)
                    //Play and Stop buttons
                    HStack(spacing: 18) {
                        Button {
                            
                        } label: {
                            Image(systemName: "play.circle")
                                .foregroundStyle(.white)
                                .font(.system(size: 53))
                        }
                        Button {
                            
                        } label: {
                            Image(systemName: "stop.circle")
                                .foregroundStyle(.white)
                                .font(.system(size: 53))
                                .opacity(/*@START_MENU_TOKEN@*/0.8/*@END_MENU_TOKEN@*/)
                        }
                    }
                    
                }.padding(.bottom, 50)
            }
        }
}

#Preview {
    MainView()
        .environment(\.colorScheme, .dark)
}
