//
//  ContentView.swift
//  SwiftUIWarCardsGame
//
//  Created by Noémi Lemonnier on 2020-07-28.
//  Copyright © 2020 Noemi Lemonnier. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    //declaring variables
    @State private var randNum1 = 2
    @State private var randNum2 = 3
    @State private var scorePlayer = 0
    @State private var scoreCPU = 0
    @State private var message = ""
    let gradient = Gradient(colors: [Color(red: 119/255, green: 212/255, blue: 119/255), Color(red: 20/255, green: 114/255, blue: 20/255, opacity: 0.1)])
    
    var body: some View {
        
        ZStack{
            //Using resizable & ignore to allow it to reach all around the safe area
            
            //Keeping the image and adding a gradient rectangle to add some effect
            Image("background")
               .resizable()
               .edgesIgnoringSafeArea(.all)
            
            Rectangle().fill(
                    RadialGradient(gradient: gradient, center: .center, startRadius: 1, endRadius: 450)
            ).edgesIgnoringSafeArea(.all)
            
            VStack{
                
                Image("logo").scaleEffect(1.25)
                    .padding(.top, 40)
                
                Spacer()
                
                HStack{
                    Image("card" + String(randNum1))
                    Image("card" + String(randNum2))
                }
                
                Text(message)
                    .fontWeight(.bold)
                    .foregroundColor(Color.white)
                    .multilineTextAlignment(.center)
                
                
                Spacer()
                
                
                HStack{
                    VStack {
                        Text("Player")
                            .bold().padding(.bottom, 20)
                        Text(String(scorePlayer))
                    }.padding(.leading, 20)
                        .foregroundColor(Color.white)
                    //adding padding so not too close to the left side
                    
                    Spacer()
                    
                    Button(action: {
                        //what happen when the button is tapped
                        
                        //1. randomized the integers (state properties)
                        self.randNum1 = Int.random(in: 2...14)
                        self.randNum2 = Int.random(in: 2...14)
                        
                        //2. IF statement to see who wins and update their score
                        if self.randNum1 > self.randNum2{
                            self.scorePlayer+=1
                            self.message = "Player won!"
                        }
                        else if self.randNum1 < self.randNum2{
                            self.scoreCPU+=1
                            self.message = "CPU won!"
                        }
                        else{
                            self.message = "It's a tie!"
                        }
                        
                        
                    }) {
                        //return element
                        Image("dealbutton").renderingMode(.original)
                        
                    }
                    
                    Spacer()
                    
                    VStack {
                        Text("CPU")
                            .bold().padding(.bottom, 20)
                        Text(String(scoreCPU))
                    }.padding(.trailing, 20)
                        .foregroundColor(Color.white)
                    
                }.padding(.bottom, 20)
                
                
                
                
            }
            
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
