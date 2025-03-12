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
        let scoringStrategies: [ScoringStrategy] = [
            (playersHaveEqualNumberOfPoints, scoreWhenTied),
            (aPlayerHasAnAdvantageOrWonTheGame, scoreWhenOnePlayerHasAnAdvantageOrWon),
            ({ _,_ in true }, scoreWithLowNumberOfPoints)
        ]

        return scoringStrategies
            .first { $0.applies(player1Points, player2Points) }?
            .convertToScore(player1Points, player2Points)
    }

    private func playersHaveEqualNumberOfPoints(player1Score: Int, player2Score: Int) -> Bool {
        player1Points == player2Points
    }
    
    private func scoreWhenTied(player1Points: Int, player2Points: Int) -> String {
        let scoreWhenTied = [
            0: "Love-All",
            1: "Fifteen-All",
            2: "Thirty-All",
            3: "Deuce"
        ]
        
        return scoreWhenTied[player1Points, default: "Deuce"]
    }

    private func aPlayerHasAnAdvantageOrWonTheGame(player1Score: Int, player2Score: Int) -> Bool {
        player1Points >= 4 || player2Points >= 4
    }
    
    private func scoreWhenOnePlayerHasAnAdvantageOrWon(player1Points: Int, player2Points: Int) -> String {
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

    private func scoreWithLowNumberOfPoints(player1Points: Int, player2Points: Int) -> String {
        let pointsToScore = [
            0: "Love",
            1: "Fifteen",
            2: "Thirty",
            3: "Forty"
        ]

        return "\(pointsToScore[player1Points]!)-\(pointsToScore[player2Points]!)" 
    }
}

typealias ScoringStrategy = (applies: (Int, Int) -> Bool, convertToScore: (Int, Int) -> String)
