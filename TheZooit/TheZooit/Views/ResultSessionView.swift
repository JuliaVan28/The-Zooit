//
//  ResultSessionView.swift
//  TheZooit
//
//  Created by Gianmarco Cremisi on 18/10/23.
//

import SwiftUI

struct ResultSessionView: View {
    @Environment(\.dismiss) private var dismiss
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
                        
                    }
                    .padding(.horizontal, 20)
                    
                    
                    Text("Horray!").bold().font(.system(size: 42))
                        .fontWidth(.expanded).foregroundStyle(Color ("customLightGreen"))
                        .padding(.bottom, 30)
                    //onlyrectangle
                    
                    ZStack(alignment: .bottom){
                        Rectangle()
                            .overlay { 
                                VStack(alignment: .leading){
                                    Text("You have studied for 10 minutes!").foregroundStyle(Color.white).font(.system(size: 24))
                                        .fontWidth(.expanded).padding(.bottom, 20)
                                    
                                    Text("Your reward:")
                                        .foregroundStyle(Color.white).font(.system(size: 24)).fontWeight(.medium)
                                        .fontWidth(.expanded)
                                    HStack{
                                        Image(systemName:
                                                "dollarsign.circle").foregroundStyle(Color.white)
                                            .font(.system(size: 24)).fontWeight(.medium)
                                            .fontWidth(.expanded)
                                        Text("10 coins")
                                            .foregroundStyle(Color.white).font(.system(size: 24)).fontWeight(.regular)
                                            .fontWidth(.expanded)
                                    }
                                }
                                .padding(.bottom, 180)
                            }
                            .frame( width: 298,height: 436)
                            .clipShape(RoundedRectangle(cornerRadius: 50))
                            .foregroundStyle(Color("backgroundColor"))
                            .overlay(RoundedRectangle(cornerRadius: 50)
                                .stroke(Color("customGreen"), lineWidth: 1.2)).padding(.bottom, 45)
                        
                        HStack(alignment: .bottom, spacing: -35){
                            
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
                    
                    
                    .padding(.bottom, 30)
                    //Home button
                    Button(action: {
                        dismiss()
                    }) {
                    label: do {
                        Text("Home").font(.system(size: 28))
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




#Preview {
    ResultSessionView().environment(\.colorScheme, .dark)
}
