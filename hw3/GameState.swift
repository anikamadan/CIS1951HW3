//
//  GameState.swift
//
//

import MapKit
import SwiftUI

/// Overall state of the game. Used by ``GameViewModel`` to communicate updates to ``GameView``.
enum GameState: Equatable {
    /// The game is loading (i.e. requesting location or restaurant data.)
    case loading
    
    /// The game ran into an error while requesting location, fetching restaurants, or retrieving motion data.
    case error
 
    /// The game is in home modet, and is waiting for the player to place the device on their forehead.
    case home
    
    /// The game is active and displaying the given restaurant.
    case commons
    case accenture
    case falk
    case hill
    case houston
    case joes
    case kceh
    case lauder
    case mclelland
    case pret
    case quaker
    /// The player got an answer correct.
    case completed
    
}

enum LocationState: Equatable {
    /// The game is loading (i.e. requesting location or restaurant data.)
    case closeEnough
    case tooFar
    /// The player got an answer correct.
    
}

extension GameState {
    /// Whether the score should be shown in this state.
    
    /// The background color to use while the game is in this state.
    var background: Color {
        switch self {
        case .commons,  .accenture, .falk, .hill, .houston, .joes, .kceh, .lauder, .mclelland, .pret, .quaker:
            return .blue.opacity(0.3)
        case .completed:
            return .green
        case .error:
            return .red
        default:
            return .black
        }
    }
}
