import Foundation

class TennisGame1: TennisGame {
    private let player1Name: String
    private let player2Name: String
    private var player1Points = 0
    private var player2Points = 0
    
    required init(player1: String, player2: String) {
        self.player1Name = player1
        self.player2Name = player2
    }

    func wonPoint(_ playerName: String) {
        if playerName == "player1" {
            player1Points += 1
        } else {
            player2Points += 1
        }
    }

    var score: String? {
        if playersHaveEqualNumberOfPoints {
            return scoreWhenTied()
        } else if aPlayerHasAnAdvantageOrWonTheGame {
            return scoreWhenOnePlayerHasAnAdvantageOrWon()
        } else {
            return scoreWithLowNumberOfPoints()
        }
    }

    private var playersHaveEqualNumberOfPoints: Bool {
        player1Points == player2Points
    }
    
    private func scoreWhenTied() -> String {
        let scoreWhenTied = [
            0: "Love-All",
            1: "Fifteen-All",
            2: "Thirty-All",
            3: "Deuce"
        ]
        
        return scoreWhenTied[player1Points, default: "Deuce"]
    }

    private var aPlayerHasAnAdvantageOrWonTheGame: Bool {
        player1Points >= 4 || player2Points >= 4
    }
    
    private func scoreWhenOnePlayerHasAnAdvantageOrWon() -> String {
        let pointsAdvantagePlayer1 = player1Points - player2Points
        return switch pointsAdvantagePlayer1 {
        case 1:
            "Advantage player1"
        case -1:
            "Advantage player2"
        case 2...:
            "Win for player1"
        default:
            "Win for player2"
        }
    }

    private func scoreWithLowNumberOfPoints() -> String {
        let pointsToScore = [
            0: "Love",
            1: "Fifteen",
            2: "Thirty",
            3: "Forty"
        ]

        return "\(pointsToScore[player1Points]!)-\(pointsToScore[player2Points]!)" 
    }
}
