import Foundation

class TennisGame1: TennisGame {
    private let player1Name: String
    private let player2Name: String
    private var player1Points: Int
    private var player2Points: Int
    
    required init(player1: String, player2: String) {
        self.player1Name = player1
        self.player2Name = player2
        self.player1Points = 0
        self.player2Points = 0
    }

    func wonPoint(_ playerName: String) {
        if playerName == "player1" {
            player1Points += 1
        } else {
            player2Points += 1
        }
    }
    
    var score: String? {
        if player1Points == player2Points {
            return scoreWhenTied()
        } else if player1Points >= 4 || player2Points >= 4 {
            return scoreWhenOnePlayerHasAnAdvantageOrWon()
        } else {
            return scoreWithLowNumberOfPoints()
        }
    }
    
    private func scoreWhenTied() -> String {
        switch player1Points {
        case 0:
            "Love-All"
        case 1:
            "Fifteen-All"
        case 2:
            "Thirty-All"
        default:
            "Deuce"
        }
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
