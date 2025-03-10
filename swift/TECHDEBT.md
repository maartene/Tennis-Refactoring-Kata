#  TECHDEBT

## ⚠️ TODO
- `player1Score` and `player2Score` can get a default value - i.e. dont need to be set in initiazer
- `player1Name` and `player2Name never seem to be used`
- is the hard coded name 'player1' a bug? 
- in `score` in the final else block, we are looping over the two players in a weird kinda way
 
## ✅ DONE
- Rename `player1` and `player2` to `player1Name` and `player2Name`
- Rename `score1` and `score2` to `player1Score` and `player2Score`
- Rename `player1Score` and `player2Score` to `player1Points` and `player2Points` 
- rename `tempPoints` in `score` to `points`
- rename `minusResult` in `score` to `pointsAdvantagePlayer1`
- extract method to determine score when the game state is a tie
- result from `scoreWhenTied` can be returned directly
- extract method to determine score when one player has an advantage or won the game into a seperate function

