//
//  ResultSessionView.swift
//  TheZooit
//
//  Created by Gianmarco Cremisi on 18/10/23.
//

import SwiftUI

struct ResultSessionView: View {
    var body: some View {
        NavigationStack {
            ZStack {
                
                Color("backgroundColor").ignoresSafeArea()
                
                
                VStack {
                    //Top buttons
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
                                        .stroke(Color("customLightGreen"), lineWidth: 2.5))
                        }
                        
                    }.padding(.horizontal, 20)
                    
                    Spacer()
                    
                    Text("Horray!").bold().font(.system(size: 42))
                        .fontWidth(.expanded).foregroundStyle(Color ("customLightGreen"))
                        .padding(.bottom, 30)
                    //onlyrectangle
                    Rectangle()
                        .frame( width: 298,height: 436)
                        .clipShape(RoundedRectangle(cornerRadius: 50))
                        .foregroundStyle(Color("backgroundColor"))
                        .overlay(RoundedRectangle(cornerRadius: 50)
                            .stroke(Color("customGreen"), lineWidth: 1.2)
                        )
                    
                        .padding(.bottom, 70)
                    //Home button
                    NavigationLink(destination: ContentView()) {
                        
                        HStack{
                            ZStack{
                                
                                Text("Home").font(.system(size: 28))
                                    .fontWeight(.bold)
                                    .fontWidth(.expanded).foregroundStyle(Color ("customLightGreen"))
                                
                                Rectangle()
                                    .frame( width: 298,height: 68)
                                    .clipShape(RoundedRectangle(cornerRadius: 50))
                                    .foregroundStyle(Color("backgorundColor"))
                                    .overlay(RoundedRectangle(cornerRadius: 50)
                                        .stroke(Color("customLightGreen"), lineWidth: 3)
                                    )
                                   
                            }
                            .padding(.bottom, 20 )
                        }
                        
                    }
                }
                
                
                
                
            }
            
            
        }
        
    }
}


#Preview {
    ResultSessionView().environment(\.colorScheme, .dark)
}
