//
//  ContentView.swift
//  CaptureTheFlag
//
//  Created by Faza Amal Sophian on 29/06/2024.
//

import SwiftUI

struct Question {
    var correctCountry = ""
    var flagsShown: [String] = []
    var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria",
    "Poland", "Spain", "UK", "Ukraine", "US"]
    var correctAnswer = Int.random(in: 0...2)
    
    init(){
        setupQuestion()
    }
    
    mutating func setupQuestion (){
        flagsShown=[]
        correctCountry = countries[Int.random(in: 0..<countries.count)]
        flagsShown.append(correctCountry)

        for _ in 0...1{
            flagsShown.append((countries.filter{!flagsShown.contains($0)}.randomElement() ?? "UK") as String)
        }
    }
    
    mutating func nextQuestion(){
        
    }
 
}

struct ContentView: View {
    @State private var score = 0
    @State private var countries = ["Estonia", "France", "Germany", "Ireland", "Italy", "Nigeria", "Poland", "Spain", "UK", "Ukraine", "US"].shuffled()
//    @State private var flags: [String] = []
    @State private var correctAnswer = Int.random(in: 0...2)
    @State private var showingAlert = false
    @State private var isAnswerCorrect = false

    func shuffle(){
        countries = countries.shuffled()
        correctAnswer = Int.random(in: 0...2)
    }
    
    func checkAnswer (_ clickedAnswer: Int) -> Bool {
        if(clickedAnswer == correctAnswer){
            return true
        }
        
        return false
    }
    
    var body: some View {

        ZStack{
            LinearGradient(colors: [.blue, .black], startPoint: .top, endPoint: .bottom).ignoresSafeArea()
            
            VStack(spacing: 100){
                VStack {
                    Text("Click the correct flag!")
                    Text(countries[correctAnswer]).font(.system(.largeTitle))
                }.foregroundStyle(Color.white)

                
                VStack(spacing:30) {
                    ForEach(0..<3) { i in
                        Button {
                            print("Clicked")
                            
                            
                            isAnswerCorrect = checkAnswer(i)
                            
                            if(isAnswerCorrect){
                                score += 1
                            }
                            
                            showingAlert = true
                        } label: {
                            Image(countries[i])
                        }.shadow(color: .white,radius: 20)
                            .alert(isPresented: $showingAlert, content: {
                                Alert(
                                    title: Text(isAnswerCorrect ? "Well done!" : "Oh no!"),
                                    message: Text("Score is \(score)"),
                                    dismissButton: .default(Text("OK")) {
                                        shuffle()
                                    }
                                )
                            })
                        
                    }
                }
                
//                Button() {
//                    question.setupQuestion()
//                } label: {
//                    Text("Next").padding(20)
//                }.foregroundColor(.white).background(.black).cornerRadius(10)
        }
       
        }
    }
}

#Preview {
    ContentView()
}
