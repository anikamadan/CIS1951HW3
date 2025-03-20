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
//    @Bindable var diningHalls = DiningHallModel()
    
    var body: some View {
        if(hall.isCollected){
            VStack{
                Text("collected")
            }
            
        }
        else{
            VStack{
                Text("\(hall.isCollected)")
                Text(hall.name)
                Button(action: {
                    hall.completeHall()
                }) {
                    Text("Complete")
                        .foregroundStyle(.red)
                }
            }
            
        }
        
    }
    
    
    
    
}
