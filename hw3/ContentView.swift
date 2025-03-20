//
//  ContentView.swift
//  hw3
//
//  Created by Anika Madan on 3/18/25.
//

import SwiftUI

struct ContentView: View {
    
    var body: some View {
        NavigationStack{
            VStack {
                Text("Welcome to Penn Scavenger Hunt!")
                    .font(.largeTitle)
                    .font(.custom("Staatliches-Regular", size: 32))
                    .foregroundStyle(.blue)
                    .bold()
                    .padding()
                Image("upenn")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .scaleEffect(0.8)
                ButtonView()

                
                Spacer()
            }
            .padding()
        }
    }
}

#Preview {
    ContentView()
}

struct ButtonView: View {
    var body: some View {
        @State var diningHall = DiningHallModel()
        
        @State var commons: String = "1920 Commons"
        @State var accenture: String = "Accenture Cafe"
        @State var falk: String = "Falk Kosher"
        @State var hill: String = "Hill"
        @State var houston: String = "Houston"
        @State var joes: String = "Joes"
        @State var kceh: String = "Kceh"
        @State var lauder: String = "Lauder"
        @State var mclelland: String = "Mclelland"
        @State var pret: String = "Pret"
        @State var quaker: String = "Quaker"
        
        NavigationLink(
            "1920 Commons",
            destination: DiningHallView(hall: $diningHall.diningHalls[0]))
                .font(.title)
                .padding(1)
                .frame(maxWidth: .infinity)
                .foregroundColor(.white)
                .background(.blue)
                .cornerRadius(10)
            
        NavigationLink("Accenture Cafe", destination: DiningHallView(hall: $diningHall.diningHalls[1]))
            .font(.title)
            .padding(1)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
        NavigationLink("Falk Kosher", destination: DiningHallView(hall: $diningHall.diningHalls[2]))
            .font(.title)
            .padding(1)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
        NavigationLink("Hill", destination: DiningHallView(hall: $diningHall.diningHalls[3]))
            .font(.title)
            .padding(1)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
        NavigationLink("Houston", destination: DiningHallView(hall: $diningHall.diningHalls[4]))
            .font(.title)
            .padding(1)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
        NavigationLink("Joes", destination: DiningHallView(hall: $diningHall.diningHalls[5]))
            .font(.title)
            .padding(1)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
        NavigationLink("Kings Court English House", destination: DiningHallView(hall: $diningHall.diningHalls[6]))
            .font(.title)
            .padding(1)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
        NavigationLink("Lauder", destination: DiningHallView(hall: $diningHall.diningHalls[7]))
            .font(.title)
            .padding(1)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
        NavigationLink("Mclelland", destination: DiningHallView(hall: $diningHall.diningHalls[8]))
            .font(.title)
            .padding(1)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
        NavigationLink("Pret", destination: DiningHallView(hall: $diningHall.diningHalls[9]))
            .font(.title)
            .padding(1)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
        NavigationLink("Quaker Kitchen", destination: DiningHallView(hall: $diningHall.diningHalls[10]))
            .font(.title)
            .padding(1)
            .frame(maxWidth: .infinity)
            .foregroundColor(.white)
            .background(.blue)
            .cornerRadius(10)
    }
}
