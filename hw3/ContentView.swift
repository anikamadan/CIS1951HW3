//
//  ContentView.swift
//  hw3
//
//  Created by Anika Madan on 3/18/25.
//

import SwiftUI


#Preview {
    ContentView()
}


struct ContentView: View {

    @State var diningHallModel = DiningHallModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Welcome to Penn Scavenger Hunt!")
                    .font(.largeTitle)
                    .foregroundStyle(.blue)
                    .bold()
                    .padding()
                
                Image("upenn")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(0.8)
                
                // Instead of a separate ButtonView, include the buttons directly
                // or pass the model properly
                
                NavigationLink(
                    "1920 Commons",
                    destination: DiningHallView(hall: $diningHallModel.diningHalls[0]))
                            .font(.title)
                            .padding(1)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            .background(diningHallModel.diningHalls[0].isCollected ? .green : .blue)
                            .cornerRadius(10)
                            
                NavigationLink("Accenture Cafe", destination: DiningHallView(hall: $diningHallModel.diningHalls[1]))
                    .font(.title)
                    .padding(1)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(diningHallModel.diningHalls[1].isCollected ? .green : .blue)
                    .cornerRadius(10)
                NavigationLink("Falk Kosher", destination: DiningHallView(hall: $diningHallModel.diningHalls[2]))
                    .font(.title)
                    .padding(1)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(diningHallModel.diningHalls[2].isCollected ? .green : .blue)
                    .cornerRadius(10)
                NavigationLink("Hill", destination: DiningHallView(hall: $diningHallModel.diningHalls[3]))
                    .font(.title)
                    .padding(1)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(diningHallModel.diningHalls[3].isCollected ? .green : .blue)
                    .cornerRadius(10)
                NavigationLink("Houston", destination: DiningHallView(hall: $diningHallModel.diningHalls[4]))
                    .font(.title)
                    .padding(1)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(diningHallModel.diningHalls[4].isCollected ? .green : .blue)
                    .cornerRadius(10)
                NavigationLink("Joes", destination: DiningHallView(hall: $diningHallModel.diningHalls[5]))
                    .font(.title)
                    .padding(1)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(diningHallModel.diningHalls[5].isCollected ? .green : .blue)
                    .cornerRadius(10)
                NavigationLink("Kings Court English House", destination: DiningHallView(hall: $diningHallModel.diningHalls[6]))
                    .font(.title)
                    .padding(1)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(diningHallModel.diningHalls[6].isCollected ? .green : .blue)
                    .cornerRadius(10)
                NavigationLink("Lauder", destination: DiningHallView(hall: $diningHallModel.diningHalls[7]))
                    .font(.title)
                    .padding(1)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(diningHallModel.diningHalls[7].isCollected ? .green : .blue)
                    .cornerRadius(10)
                NavigationLink("Mclelland", destination: DiningHallView(hall: $diningHallModel.diningHalls[8]))
                    .font(.title)
                    .padding(1)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(diningHallModel.diningHalls[8].isCollected ? .green : .blue)
                    .cornerRadius(10)
                NavigationLink("Pret", destination: DiningHallView(hall: $diningHallModel.diningHalls[9]))
                    .font(.title)
                    .padding(1)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(diningHallModel.diningHalls[9].isCollected ? .green : .blue)
                    .cornerRadius(10)
                NavigationLink("Quaker Kitchen", destination: DiningHallView(hall: $diningHallModel.diningHalls[10]))
                    .font(.title)
                    .padding(1)
                    .frame(maxWidth: .infinity)
                    .foregroundColor(.white)
                    .background(diningHallModel.diningHalls[10].isCollected ? .green : .blue)
                    .cornerRadius(10)
                
                Spacer()
            }
            .padding()
        }
    }
}


#Preview {
    ContentView()
}

