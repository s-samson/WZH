//
//  ViewController.swift
//  QuizApp
//
//  Created by SD on 04/04/2022.
//

import UIKit

class ViewController: UIViewController {
    
    var quizQuestions: [QuizQuestion] = []

    @IBOutlet weak var purpleButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var backButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        setupQuiz()
    }
    
    func setupQuiz() {
        getLocalQuizData()
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
    
    
    
    func getLocalQuizData() {
        // Call readLocalFile function with the name of the local file (localQuizData)
        if let localData = self.readLocalFile(forName: "localQuizData") {
            // File exists, now parse 'localData' with the parse function
            self.parse(jsonData: localData)
        }
        
    }

    // Read local file

    private func readLocalFile(forName name: String) -> Data? {
        do {
            // Check if file exists in application bundle, then try to convert it to a string, if that works return that
            if let bundlePath = Bundle.main.path(forResource: name,
                                                 ofType: "json"),
                let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error) // Something went wrong, show an alert
        }
        
        return nil
    }

    private func parse(jsonData: Data) {
        do {
            let decodedData = try JSONDecoder().decode([QuizQuestion].self,
                                                       from: jsonData)
            /*
            print("Question: ", decodedData[0].question)
            print("Answer: ", decodedData[0].answer)
            print("===================================")
            */
            
            self.quizQuestions = decodedData
            print ("quizQuestions = \(quizQuestions)")
            
        } catch {
            print("decode error")
        }
    }

    
    
    
    
    
}

