//
//  ContentView.swift
//  SPS
//
//  Created by mini project on 18/02/24.
//

import SwiftUI

enum Choices: String, CaseIterable {
    case stone = "🪨"
    case paper = "📄"
    case scissors = "✂️"
}

struct ContentView: View {
    @State private var compChoice = Choices.paper
    @State private var outcome = ""
    @State private var userChoice = ""
    @State private var isCompChoice = false

    var body: some View {
        VStack {
            if !isCompChoice {
                Text("🤖")
                    .font(.system(size: 100))
                    .onAppear {
                        self.compChoice = Choices.allCases.randomElement()!
                    }
            } else {
                VStack {
                    Text("🤖: \(compChoice.rawValue)")
                        .font(.system(size: 40))
                    Text("You: \(userChoice)")
                        .font(.system(size: 40))
                    
                    Text(outcome)
                        .font(.headline)
                }
                    .frame(height: 160)
                    .padding(.all)
                
               
                
                
            }
            

            HStack {
                ForEach(Choices.allCases, id: \.self) { choice in
                    Button(action: {
                        self.userChoice = choice.rawValue
                        self.isCompChoice = true
                        self.calculateOutcome()
                    }) {
                        Text(choice.rawValue)
                            .font(.system(size: 50))
                            .padding()
                    }
                }
            }
        
            
            Button("Restart") {
                self.resetGame()
            }
            .font(.headline)
            .padding()
        }
        .padding()
    }

    private func calculateOutcome() {
        if userChoice == compChoice.rawValue {
            outcome = "It's a tie!"
        } else if (userChoice == Choices.stone.rawValue && compChoice == .scissors) ||
                  (userChoice == Choices.paper.rawValue && compChoice == .stone) ||
                  (userChoice == Choices.scissors.rawValue && compChoice == .paper) {
            outcome = "You win!"
        } else {
            outcome = "You lose!"
        }
    }
    
    private func resetGame() {
        self.isCompChoice = false
        self.outcome = ""
        self.userChoice = ""
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
