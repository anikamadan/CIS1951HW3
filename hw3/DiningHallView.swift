//
//  DiningHallView.swift
//  hw3
//
//  Created by Anika Madan on 3/18/25.
//

//
//  GameView.swift
//  hw2
//
//  Created by Anika Madan on 3/1/25.
//

// how to make high score on welcome page
// how to return to welcome screen once finished
// how to mantain high score when played again

import Foundation
import SwiftUI

struct DiningHallView: View {
//    @Bindable var diningHall: DiningHall
    @Binding var hall: DiningHall
    @Environment(DiningHallModel.self) var diningHallModel
        
        var body: some View {
            VStack{
                Text(hall.name)
                    .font(.largeTitle)
                    .fontWeight(.bold)
                    .foregroundColor(.blue)
                    
                if hall.isCollected {
                    VStack {
                        Image(systemName: "checkmark.circle.fill")
                            .resizable()
                            .frame(width: 100, height: 100)
                            .foregroundColor(.green)
                        
                        Text("Dining Hall Completed!")
                            .font(.title)
                            .foregroundColor(.green)
                            .padding()
                    }
                } else {
                    VStack {
                        Text("This dining hall is not collected yet.")
                            .font(.headline)
                            .foregroundColor(.gray)
                            .padding()
                            
                        Button(action: {
                            hall.isCollected = true
                        }) {
                            Text("Complete")
                                .font(.title)
                                .padding()
                                .frame(width: 200)
                                .background(Color.blue)
                                .foregroundColor(.white)
                                .cornerRadius(10)
                        }
                    }
                }
            }
            .padding()
        }
    
    
    
}
