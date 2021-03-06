//
//  ViewController.swift
//  QuizApp
//
//  Created by SD on 04/04/2022.
//

import UIKit


class ViewController: UIViewController , UITextFieldDelegate {
    
    var quizQuestions: [QuizQuestion] = []
    var categoryQuestions: [QuizQuestion] = []
    var currentIndex = 0
    var score = 0
    var getScore = true
    
    @IBOutlet weak var orangeButton: UIButton!
    @IBOutlet weak var yellowButton: UIButton!
    @IBOutlet weak var redButton: UIButton!
    @IBOutlet weak var blueButton: UIButton!
    @IBOutlet weak var greenButton: UIButton!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var nextQuestion: UIButton!
    @IBOutlet weak var showAnswer: UIButton!
    @IBOutlet weak var answerField: UITextField!
    @IBOutlet weak var answerLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        answerField.delegate = self
        
        setupQuiz()
    }
    
    func setupQuiz() {
        scoreLabel.text = "score : \(score)"
        getLocalQuizData()
    }

    @IBAction func didTouchOrangeButton(_ sender: Any) {
        hideButtons()
        
        categoryQuestions = quizQuestions.filter { $0.category == .orange }
        print("categoryQuestions are: \(categoryQuestions)")
        questionLabel.text = categoryQuestions[currentIndex].question
    }
    
    
    @IBAction func didTouchRedButton(_ sender: Any) {
        hideButtons()
        
        categoryQuestions = quizQuestions.filter { $0.category == .red }
        print("categoryQuestions are: \(categoryQuestions)")
        questionLabel.text = categoryQuestions[currentIndex].question
    }
    
    @IBAction func didTouchYellowButton(_ sender: Any) {
        hideButtons()
        
        categoryQuestions = quizQuestions.filter { $0.category == .yellow }
        print("categoryQuestions are: \(categoryQuestions)")
        questionLabel.text = categoryQuestions[currentIndex].question
    }
    
    @IBAction func didTouchGreenButton(_ sender: Any) {
        hideButtons()
        
        categoryQuestions = quizQuestions.filter { $0.category == .green }
        print("categoryQuestions are: \(categoryQuestions)")
        questionLabel.text = categoryQuestions[currentIndex].question
    }
    
    @IBAction func didTouchBlueButton(_ sender: Any) {
        hideButtons()
        
        categoryQuestions = quizQuestions.filter { $0.category == .blue }
        print("categoryQuestions are: \(categoryQuestions)")
        questionLabel.text = categoryQuestions[currentIndex].question
    }
    
    @IBAction func backButton(_ sender: Any) {
        showButtons()
        answerField.text = ""
        
    }
    
    
    @IBAction func showAnswer(_ sender: Any) {
        currentIndex += 0
        answerLabel.text=categoryQuestions[currentIndex].answer
        answerLabel.isHidden = false
    }
    
    
    @IBAction func nextQuestion(_ sender: Any) {
        currentIndex += 1
        questionLabel.text=categoryQuestions[currentIndex].question
        answerLabel.isHidden = true
        setupQuiz()
        answerField.text = ""
        
    }
    
    
    
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        answerLabel.isHidden = false
        let answer = answerField.text
        
        if answer?.lowercased() == categoryQuestions[currentIndex].answer {
            answerLabel.text = "Correct ???"
            if getScore == true{
            score += 1
            scoreLabel.text = "score : \(score)"
            getScore = false
            }
        } else {
            answerLabel.text = "False ???"
        }
        
        return true
    }
    
    func hideButtons(){
        redButton.isHidden = true
        yellowButton.isHidden = true
        greenButton.isHidden = true
        blueButton.isHidden = true
        orangeButton.isHidden = true
        backButton.isHidden = false
        questionLabel.isHidden = false
        answerField.isHidden = false
        showAnswer.isHidden = false
        nextQuestion.isHidden = false
    }
    
    func showButtons(){
        redButton.isHidden = false
        yellowButton.isHidden = false
        greenButton.isHidden = false
        blueButton.isHidden = false
        orangeButton.isHidden = false
        backButton.isHidden = true
        questionLabel.isHidden = true
        answerLabel.isHidden = true
        answerField.isHidden = true
        showAnswer.isHidden = true
        nextQuestion.isHidden = true
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

