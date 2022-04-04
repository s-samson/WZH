//
//  ViewController.swift
//  QuizApp
//
//  Created by SD on 04/04/2022.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var purpleButton: UIButton!
    
    @IBOutlet weak var yellowButton: UIButton!
    
    @IBOutlet weak var greenButton: UIButton!
    
    @IBOutlet weak var blueButton: UIButton!
    
    @IBOutlet weak var redButton: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func ButtonOne(_ sender: Any) {
        hideButtons()
    }
    
    @IBAction func ButtonTwo(_ sender: Any) {
        hideButtons()
    }
    
    @IBAction func buttonThree(_ sender: Any) {
        hideButtons()
    }
    
    @IBAction func buttonFour(_ sender: Any) {
        hideButtons()
    }
    
    @IBAction func buttonFive(_ sender: Any) {
        hideButtons()
    }
    
  
    @IBAction func backButton(_ sender: Any) {
        showButtons()
    }
    
    func hideButtons(){
        redButton.isHidden = true
        yellowButton.isHidden = true
        greenButton.isHidden = true
        blueButton.isHidden = true
        purpleButton.isHidden = true
        backButton.isHidden = false
    }
    func showButtons(){
        redButton.isHidden = false
        yellowButton.isHidden = false
        greenButton.isHidden = false
        blueButton.isHidden = false
        purpleButton.isHidden = false
        backButton.isHidden = true
    }
}

