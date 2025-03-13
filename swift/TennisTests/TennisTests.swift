import Testing

let parameters = [
    (0, 0, "Love-All"),
    (1, 1, "Fifteen-All"),
    (2, 2, "Thirty-All"),
    (3, 3, "Deuce"),
    (4, 4, "Deuce"),

    (1, 0, "Fifteen-Love"),
    (0, 1, "Love-Fifteen"),
    (2, 0, "Thirty-Love"),
    (0, 2, "Love-Thirty"),
    (3, 0, "Forty-Love"),
    (0, 3, "Love-Forty"),
    (4, 0, "Win for player1"),
    (0, 4, "Win for player2"),

    (2, 1, "Thirty-Fifteen"),
    (1, 2, "Fifteen-Thirty"),
    (3, 1, "Forty-Fifteen"),
    (1, 3, "Fifteen-Forty"),
    (4, 1, "Win for player1"),
    (1, 4, "Win for player2"),

    (3, 2, "Forty-Thirty"),
    (2, 3, "Thirty-Forty"),
    (4, 2, "Win for player1"),
    (2, 4, "Win for player2"),

    (4, 3, "Advantage player1"),
    (3, 4, "Advantage player2"),
    (5, 4, "Advantage player1"),
    (4, 5, "Advantage player2"),
    (15, 14, "Advantage player1"),
    (14, 15, "Advantage player2"),

    (6, 4, "Win for player1"),
    (4, 6, "Win for player2"),
    (16, 14, "Win for player1"),
    (14, 16, "Win for player2")
]

@Suite struct TennisTests {
    @Test(arguments: parameters) func testAllScoresTennisGame1(testcase: (player1Points: Int, player2Points: Int, expectedScore: String)) {
        let game = TennisGame1(player1: "player1", player2: "player2")

        changeGameToTestcaseState(game: game, player1Points: testcase.player1Points, player2Point: testcase.player2Points)

        #expect(game.score == testcase.expectedScore)
    }

    @Test func testScoreWithRealNames() {
        let game = TennisGame1(player1: "Maarten", player2: "Iris")

        changeGameToTestcaseState(game: game, player1Points: 4, player1Name: "Maarten", player2Point: 4, player2Name: "Iris")

        #expect(game.score == "Deuce")
    }

    @Test(arguments: parameters) func testAllScoresTennisGame2(testcase: (player1Points: Int, player2Points: Int, expectedScore: String)) {
        let game = TennisGame2(player1: "player1", player2: "player2")

        changeGameToTestcaseState(game: game, player1Points: testcase.player1Points, player2Point: testcase.player2Points)

        #expect(game.score == testcase.expectedScore)
    }

    @Test(arguments: parameters) func testAllScoresTennisGame3(testcase: (player1Points: Int, player2Points: Int, expectedScore: String)) {
        let game = TennisGame3(player1: "player1", player2: "player2")

        changeGameToTestcaseState(game: game, player1Points: testcase.player1Points, player2Point: testcase.player2Points)

        #expect(game.score == testcase.expectedScore)
    }

    private func changeGameToTestcaseState(game: TennisGame, player1Points: Int, player1Name: String = "player1", player2Point: Int, player2Name: String = "player2") {
        let highestScore = max(player1Points, player2Point)
        for i in 0..<highestScore {
            if i < player1Points {
                game.wonPoint(player1Name)
            }
            if i < player2Point {
                game.wonPoint(player2Name)
            }
        }
    }
}
