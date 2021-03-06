//
//  ViewController.swift
//  Week01Task
//
//  Created by алтынпончик on 5/30/20.
//  Copyright © 2020 алтынпончик. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    var currentValueRed = 0
    var currentValueGreen = 0
    var currentValueBlue = 0
    
    @IBOutlet weak var RedSlider: UISlider!
    @IBOutlet weak var GreenSlider: UISlider!
    @IBOutlet weak var BlueSlider: UISlider!
    
    @IBOutlet weak var RedLabel: UILabel!
    @IBOutlet weak var GreenLabel: UILabel!
    @IBOutlet weak var BlueLabel: UILabel!
    
    @IBOutlet weak var ColorName: UILabel!
    
    @IBOutlet weak var setColorButton: UIButton!
    
    @IBOutlet weak var resetButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func RedValueChange(_ sender: UISlider) {
        RedLabel.text = "\(RedSlider.value.rounded())"
        currentValueRed = Int(RedSlider.value.rounded())
    }
    
    @IBAction func GreenValueChange(_ sender: UISlider) {
        GreenLabel.text = "\(GreenSlider.value.rounded())"
        currentValueGreen = Int(GreenSlider.value.rounded())
    }
    
    @IBAction func BlueValueChange(_ sender: UISlider) {
        BlueLabel.text = "\(BlueSlider.value.rounded())"
        currentValueBlue = Int(BlueSlider.value.rounded())
    }
    
    @IBAction func setColor(_ sender: UIButton) {
        
        var txtColor: UITextField?
        
        let alert = UIAlertController(title: "Color", message: "Set color name", preferredStyle: .alert)
        
        let setAction = UIAlertAction(title: "Set", style: .default) { (i) in
            if let clr = txtColor?.text {
                self.ColorName.text = "\(clr)"
                self.ChangeColor()
                print("color name is: \(clr)")
            } else {
                print("No color")
            }
        }
        
        alert.addTextField { (i) in
            txtColor = i
            txtColor?.placeholder = "Name your color"
        }
        
        alert.addAction(setAction)
        
        self.present(alert, animated: true, completion: nil)
        
    }
    
    func ChangeColor() {
        self.view.backgroundColor = UIColor(red: CGFloat(self.RedSlider.value.rounded()/255.0), green: CGFloat(self.GreenSlider.value.rounded()/255), blue: CGFloat(self.BlueSlider.value.rounded()/255), alpha: 1)
    }
    
    
    @IBAction func resetEntered(_ sender: UIButton) {
        Reset()
    }
    
    func Reset() {
        
        currentValueRed = 0
        currentValueGreen = 0
        currentValueBlue = 0
        
        updateLabels()
        
        //view.backgroundColor = UIColor.white
    }
    
    func updateLabels() {
        
        RedLabel.text = String(0)
        GreenLabel.text = String(0)
        BlueLabel.text = String(0)
        
        ColorName.text = "Custom color name"
        
        //view.backgroundColor = UIColor.white
    }
}
