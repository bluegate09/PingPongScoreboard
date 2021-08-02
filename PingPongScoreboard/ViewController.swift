//
//  ViewController.swift
//  PingPongScoreboard
//
//  Created by 王靖渝 on 2021/7/31.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var tvServeLeft: UILabel!
    @IBOutlet weak var tvServeRight: UILabel!
    @IBOutlet weak var leftGames: UILabel!
    @IBOutlet weak var rightGames: UILabel!
    @IBOutlet weak var clickLeft: UIButton!
    @IBOutlet weak var clickRight: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tvServeRight.alpha = 0
        storeScore()
        
    }
    
    var ScoreList: [ScoreBoard] = []
    var i: Int?
    
    var scoreRight = 0
    var scoreLeft = 0
    var scoreSum = 0
    
    var leftGameScore = 0
    var rightGameScore = 0
    
    @IBAction func clickLeft(_ sender: Any) {
        scoreLeft += 1
        clickLeft.setTitle(String(scoreLeft), for: .normal)
        
        checkServe()
        
        if(scoreLeft >= 11 && scoreLeft - scoreRight >= 2){
            leftGameScore += 1
            leftGames.text = String(leftGameScore)
            win()
        }
        
        storeScore()
        
    }
    
    @IBAction func clickRight(_ sender: Any) {
        scoreRight += 1
        clickRight.setTitle(String(scoreRight), for: .normal)
        
        checkServe()
        
        if(scoreRight >= 11 && scoreRight - scoreLeft >= 2){
            rightGameScore += 1
            rightGames.text = String(rightGameScore)
            win()
        }
        
        storeScore()
    }
    
    @IBAction func clickRewind(_ sender: Any) {
    
        
        setValue()
        
        clickLeft.setTitle(String(scoreLeft), for: .normal)
        clickRight.setTitle(String(scoreRight), for: .normal)
        leftGames.text = String(leftGameScore)
        rightGames.text = String(rightGameScore)
        
//        checkServe()
        
    }
    
    @IBAction func clickChangeSide(_ sender: Any) {
        
        swap(&leftGameScore,&rightGameScore)
        swap(&leftGames.text, &rightGames.text)
        swap(&scoreLeft,&scoreRight)
        
        
        clickLeft.setTitle(String(scoreLeft), for: .normal)
        clickRight.setTitle(String(scoreRight), for: .normal)
        
        if(tvServeRight.alpha == 0){
            tvServeLeft.alpha = 0
            tvServeRight.alpha = 1
        }else{
            tvServeLeft.alpha = 1
            tvServeRight.alpha = 0
        }
        
        storeScore()
    }
    
    @IBAction func clickReset(_ sender: Any) {
        scoreRight = 0
        scoreLeft = 0
        clickRight.setTitle(String(scoreRight), for: .normal)
        clickLeft.setTitle(String(scoreLeft), for: .normal)
        leftGameScore = 0
        rightGameScore = 0
        leftGames.text = String(leftGameScore)
        rightGames.text = String(rightGameScore)
        tvServeLeft.alpha = 1
        tvServeRight.alpha = 0
    }
    
    func checkServe(){
        scoreSum = scoreRight + scoreLeft
        if (scoreLeft > 11 || scoreRight > 11){
            if(tvServeRight.alpha == 0){
                tvServeLeft.alpha = 0
                tvServeRight.alpha = 1
            }else{
                tvServeLeft.alpha = 1
                tvServeRight.alpha = 0
            }
        }else if (scoreSum >= 2 && scoreSum % 2 == 0) {
            if(tvServeRight.alpha == 0){
                tvServeLeft.alpha = 0
                tvServeRight.alpha = 1
            }else{
                tvServeLeft.alpha = 1
                tvServeRight.alpha = 0
            }
        }
    }

    func win(){
        
        let controller = UIAlertController(title: "Game Set", message: "", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        
        controller.addAction(okAction)
        present(controller, animated: true, completion: nil)
        
        scoreRight = 0
        scoreLeft = 0
        clickRight.setTitle(String(scoreRight), for: .normal)
        clickLeft.setTitle(String(scoreLeft), for: .normal)
    }
    
    func storeScore(){
        
        if(i == nil){
            i = 0
            
            ScoreList.append(ScoreBoard(scoreRight: scoreRight, scoreLeft: scoreLeft, scoreSum: scoreSum, leftGameScore: leftGameScore, rightGameScore: rightGameScore, serveLeftAlpha: Int(tvServeLeft.alpha), serveRightAlpha: Int(tvServeRight.alpha)))
            
        }else{
            if(i! >= ScoreList.count){
                ScoreList.append(ScoreBoard(scoreRight: scoreRight, scoreLeft: scoreLeft, scoreSum: scoreSum, leftGameScore: leftGameScore, rightGameScore: rightGameScore, serveLeftAlpha: Int(tvServeLeft.alpha), serveRightAlpha: Int(tvServeRight.alpha)))
            }else{
                ScoreList[i!] = ScoreBoard(scoreRight: scoreRight, scoreLeft: scoreLeft, scoreSum: scoreSum, leftGameScore: leftGameScore, rightGameScore: rightGameScore, serveLeftAlpha: Int(tvServeLeft.alpha), serveRightAlpha: Int(tvServeRight.alpha))
            }
            
        }
        
        i! += 1

    }
    
    func setValue(){
        
        if(i == nil){
            return
        }
        
        i! -= 1
        if(i! < 1){
            i = 1
        }
        
        scoreRight = ScoreList[i!-1].scoreRight
        scoreLeft = ScoreList[i!-1].scoreLeft
        scoreSum = ScoreList[i!-1].scoreSum
        
        leftGameScore = ScoreList[i!-1].leftGameScore
        rightGameScore = ScoreList[i!-1].rightGameScore
        
        tvServeLeft.alpha = CGFloat(ScoreList[i!-1].serveLeftAlpha)
        print(ScoreList[i!-1].serveLeftAlpha)
        tvServeRight.alpha = CGFloat(ScoreList[i!-1].serveRightAlpha)
        print(ScoreList[i!-1].serveRightAlpha)
        
        
    }
    
}

