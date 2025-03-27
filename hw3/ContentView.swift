//
//  ContentView.swift
//  hw3
//
//  Created by Anika Madan on 3/18/25.
//

/// The game UI.

import SwiftUI


#Preview {
    ContentView()
}


struct ContentView: View {
    
    @State var viewModel = GameViewModel()
    @State var diningHallModel = DiningHallModel()
//    @State var index: Int
    
    var body: some View {
        ZStack(alignment: .topTrailing) {
            Group {
                switch viewModel.state {
                case .loading:
                    VStack(spacing: 32) {
                        ProgressView()
                            .controlSize(.large)
                        Text("Loading...")
                    }
                case .error:
                    VStack(spacing: 32) {
                        Text("Oh no! There was an error.")
                        Button("Retry") {
                            viewModel.loadGame()
                        }
                        .buttonStyle(.bordered)
                        .tint(.primary)
                    }
                case .home:
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
                        Button("Commons"){
                            viewModel.changeHall(index: 0)
                        }
                            .padding(1)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                        Button("Accenture Cafe"){
                            viewModel.changeHall(index: 1)
                        }
                            .padding(1)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                        Button("Falk Kosher"){
                            viewModel.changeHall(index: 2)
                        }
                            .padding(1)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                        Button("Hill"){
                            viewModel.changeHall(index: 3)
                        }
                            .padding(1)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                        Button("Houston"){
                            viewModel.changeHall(index: 4)
                        }
                            .padding(1)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                        Button("Joe's Cafe"){
                            viewModel.changeHall(index: 5)
                        }
                            .padding(1)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                        Button("Kceh"){
                            viewModel.changeHall(index: 6)
                        }
                            .padding(1)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                        Button("Lauder"){
                            viewModel.changeHall(index: 7)
                        }
                            .padding(1)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                        Button("McLelland"){
                            viewModel.changeHall(index: 8)
                        }
                            .padding(1)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                        Button("Pret"){
                            viewModel.changeHall(index: 9)
                        }
                            .padding(1)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                        Button("Quaker Kitchen"){
                            viewModel.changeHall(index: 10)
                        }
                            .padding(1)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                    }
                    
                case .commons, .accenture, .falk, .hill, .houston, .joes, .kceh, .lauder, .mclelland, .pret, .quaker:
                    VStack {
                            Button("Home"){
                                viewModel.changeHall(index: -1)
                            }
                            .padding(1)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            
                            Text("Dining Hall")
                            
                            switch viewModel.locState {
                            case .closeEnough:
                                Text("You may collect the dining hall by shaking your phone")
                            case .tooFar:
                                Text("You are too far, please move closer to this dining hall before attempting to collect it")
                            }
                        }
                case .completed:
                    Text("Completed")
                }
                
            }
            .multilineTextAlignment(.center)
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
        }
        .padding()
        .background(viewModel.state.background, ignoresSafeAreaEdges: .all)
        .preferredColorScheme(.dark)
        .onAppear {
            viewModel.loadGame()
        }
    }

}


#Preview {
    @Previewable @State var diningHallModel = DiningHallModel()
    ContentView()
        .environment(diningHallModel)
}

