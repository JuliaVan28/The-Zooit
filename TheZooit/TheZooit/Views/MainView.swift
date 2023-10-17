//
//  MainView.swift
//  TheZooit
//
//  Created by Yuliia on 17/10/23.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                Color("backgroundColor").ignoresSafeArea()
                
                VStack {
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
                }
            }
        }
        
    }
}

#Preview {
    MainView()
        .environment(\.colorScheme, .dark)
}
