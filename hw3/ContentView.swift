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
    
   
    @State var diningHallModel = DiningHallModel()
    @State var viewModel = GameViewModel()
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
                        ForEach(0..<diningHallModel.diningHalls.count, id: \.self) { i in
                            Button(diningHallModel.diningHalls[i].name) {
                                viewModel.changeHall(index: diningHallModel.diningHalls[i].index)
                            }
                            .padding(1)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                        }
                    }
                    
                case .commons, .accenture, .falk, .hill, .houston, .joes, .kceh, .lauder, .mclelland, .pret, .quaker:
                    VStack {
                        Spacer()
                            Button("Home"){
                                viewModel.changeHall(index: -1)
                            }
                            .padding(1)
                            .frame(maxWidth: .infinity)
                            .foregroundColor(.white)
                            Spacer()
                        Text("Dining Hall: " + viewModel.getName() )
                        Spacer()
                            switch viewModel.locState {
                            case .closeEnough:
                                Text("You may collect the dining hall by shaking your phone")
                            case .tooFar:
                                Text("You are too far, please move closer to this dining hall before attempting to collect it")
                            }
                        Spacer()
                        }
                case .completed:
                    VStack{
                        Spacer()
                        Button("Home"){
                            viewModel.changeHall(index: -1)
                        }
                        .padding(1)
                        .frame(maxWidth: .infinity)
                        .foregroundColor(.white)
                        Spacer()
                        Text("Completed")
                        Spacer()
                        Spacer()
                    }
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

