//
//  ContentView.swift
//  War Card Game
//
//  Created by Darragh Murphy on 13/12/2022.
//

import SwiftUI

struct ContentView: View {
    
    //Variables
    @State var playerCard = "card2"
    @State var cpuCard = "card3"
    @State var playerScore: Int = 0
    @State var cpuScore: Int = 0
    var deal_button = Image("button")
    
    //Permenant
    let textColour = Color.white
    
    var body: some View {
        
        ZStack {
            Image("background-wood-grain").ignoresSafeArea()
            
            VStack{
                Image("logo").padding()
                HStack{
                    Spacer()
                    Image(playerCard).padding()
                    Spacer()
                    Image(cpuCard).padding()
                    Spacer()
                }
                
                Button(action: {
                    //generate random number 2-14
                    let playerRand = Int.random(in: 2...14)
                    let cpuRand = Int.random(in: 2...14)
                    
                    
                    //update cards
                    playerCard = "card" + String(playerRand)
                    cpuCard = "card" + String(cpuRand)
                    
                    //update scores
                    if playerRand > cpuRand {
                        playerScore += 1
                    }
                    else if cpuRand > playerRand {
                        cpuScore += 1
                    }
                    
                }, label: {
                    deal_button
                    
                })
                
                
                HStack{
                    Spacer()
                    VStack{
                        Text("Player").padding()
                        Text(String(playerScore))
                    }
                    .font(.largeTitle).padding()
                    .foregroundColor(Color.white)
            
                    VStack{
                        Text("CPU").padding()
                        Text(String(cpuScore))
                    }
                    .font(.largeTitle).padding()
                    .foregroundColor(textColour)
                    Spacer()
                }
            }
            
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
