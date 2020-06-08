/*
 * Copyright (c) 2015 Razeware LLC
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var targetLabel: UILabel!
    @IBOutlet weak var targetTextLabel: UILabel!
    @IBOutlet weak var guessLabel: UILabel!
    
    @IBOutlet weak var redLabel: UILabel!
    @IBOutlet weak var greenLabel: UILabel!
    @IBOutlet weak var blueLabel: UILabel!
    
    @IBOutlet weak var redSlider: UISlider!
    @IBOutlet weak var greenSlider: UISlider!
    @IBOutlet weak var blueSlider: UISlider!
    
    @IBOutlet weak var roundLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var game = BullsEyeGame(score: 0, round: 1, targetColor: RGB(r: 127, g: 127, b: 127), guessColor: RGB(r: 127, g: 127, b: 127))
    var rgb = RGB()
    
    @IBAction func aSliderMoved(sender: UISlider) {
        game.guessColor = RGB(r: Int(redSlider.value.rounded()), g: Int(greenSlider.value.rounded()), b: Int(blueSlider.value.rounded()))
        updateView()
    }
    
    @IBAction func showAlert(sender: AnyObject) {
        
        let difference = game.guessColor.difference(target: game.targetColor)
        var scoreInThisRound = game.calculateScore(withDifference: difference)
        game.score = game.score + scoreInThisRound
        
        let title: String
        if scoreInThisRound == 100 {
            title = "Perfect!"
            scoreInThisRound += 100
        } else if scoreInThisRound > 95 {
            title = "You almost had it!"
            if scoreInThisRound == 99 {
                scoreInThisRound += 50
            }
        } else if scoreInThisRound > 80 {
            title = "Pretty good!"
        } else {
            title = "Not even close..."
        }
        
        game.round += 1
        
        let message = "You scored \(scoreInThisRound) points"
        let alert = UIAlertController(title: title, message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Awesome", style: .default, handler: {
            action in
            self.updateView()
        })
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    @IBAction func startOver(sender: AnyObject) {
        game.targetColor = game.createNewTargetColor()
        targetLabel.backgroundColor = UIColor(rgbStruct: game.targetColor)
        
        game.guessColor = RGB(r: 127, g: 127, b: 127)
        redSlider.value = Float(game.guessColor.r)
        greenSlider.value = Float(game.guessColor.g)
        blueSlider.value = Float(game.guessColor.b)
        
        game.score = 0
        game.round = 1
        
        updateView()
    }
    
    func updateView() {
        guessLabel.backgroundColor = UIColor(rgbStruct: game.guessColor)
        scoreLabel.text = "Score: " + String(game.score)
        roundLabel.text = "Round: " + String(game.round)
        redLabel.text = "R " + String(Int(redSlider.value.rounded()))
        redLabel.text = "G " + String(Int(redSlider.value.rounded()))
        redLabel.text = "B " + String(Int(redSlider.value.rounded()))
        updateHintOnSliders()
    }
    
    func updateHintOnSliders() { 
      redSlider.minimumTrackTintColor = UIColor.blue.withAlphaComponent(CGFloat(abs(game.targetColor.r - game.guessColor.r))/100.0)
      greenSlider.minimumTrackTintColor = UIColor.blue.withAlphaComponent(CGFloat(abs(game.targetColor.g - game.guessColor.g))/100.0)
      blueSlider.minimumTrackTintColor = UIColor.blue.withAlphaComponent(CGFloat(abs(game.targetColor.b - game.guessColor.b))/100.0)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        startOver(sender: self)
    }
}

