class ScoreBoard{
    
    var scoreRight = 0
    var scoreLeft = 0
    var scoreSum = 0
    
    var leftGameScore = 0
    var rightGameScore = 0
    
    var serveLeftAlpha = 1
    var serveRightAlpha = 0
    
    internal init(scoreRight: Int = 0, scoreLeft: Int = 0, scoreSum: Int = 0, leftGameScore: Int = 0, rightGameScore: Int = 0, serveLeftAlpha: Int = 1, serveRightAlpha: Int = 0) {
        self.scoreRight = scoreRight
        self.scoreLeft = scoreLeft
        self.scoreSum = scoreSum
        self.leftGameScore = leftGameScore
        self.rightGameScore = rightGameScore
        self.serveLeftAlpha = serveLeftAlpha
        self.serveRightAlpha = serveRightAlpha
    }
    
}
