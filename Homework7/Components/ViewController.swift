//
//  ViewController.swift
//  Components
//
//  Created by Kerem Demir on 4.03.2024.
//

import UIKit

class ViewController: UIViewController {
    
    /* UIViewController yaşam döngüsü methodları arastir.
     ve kullanilabilecek ornek senaryolari yaziniz */
    @IBOutlet weak var greetingText: UILabel!
    @IBOutlet weak var messageTextField: UITextField!
    @IBOutlet weak var saveButton: UIButton!
    @IBOutlet weak var switchButton: UISwitch!
    @IBOutlet weak var sliderButton: UISlider!
    @IBOutlet weak var stepperButton: UIStepper!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .systemBackground
        // Do any additional setup after loading the view.
        print("Hello, welcome to mobile programming lesson!")
        
//       window or view.overrideUserInterfaceStyle = .dark // always dark mode
        
            let frame = CGRect(x: 0, y: 0, width: 200, height:  300)
            let label = UILabel(frame: frame)
            
            label.backgroundColor = .red
            label.text = "Hello, welcome to mobile programming lesson!"
    //        label.textColor = .white
            label.textColor = UIColor(red: 20/255, green: 50/255, blue: 96/255, alpha: 1)
            label.tintColor = .green
            label.numberOfLines = 0
            label.font = UIFont(name: "Avenir", size: 30)
    //        label.font = UIFont.systemFont(ofSize: 30)
//            view.addSubview(label)
        
        switchButton.addTarget(self, action: #selector(switchChangeValue), for: .valueChanged)
    }
    
    @IBAction func switchChangeValue(_ sender: UISwitch) {
        if switchButton.isOn {
            greetingText.text = "Settings is active."
        } else {
            greetingText.text = "Settings is inactive."
        }
    }
    
    @IBAction func sliderAction(_ sender: UISlider) {
        print("Slider Value : \(sender.value)")
    }
    
    // Stepper button function added.
    @IBAction func stepperAction(_ sender: UIStepper) {
        //The button count to 5
        stepperButton.maximumValue = 5
        // Casting double to ınteger value.
        let stIntVal = Int(sender.value)
        print("Stepper value : \(stIntVal)")
    }
    
    @IBAction func saveAction(_ sender: UIButton) {
        
//        greetingText.isHidden = !greetingText.isHidden
//
//        if greetingText.isHidden {
//            saveButton.setTitle("Show", for: .normal)
//        } else {
//            saveButton.setTitle("Hide", for: .normal)
//        }
//         
//        ----------------
//        

        if sender.currentTitle == "Show" {
            greetingText.isHidden = false
            saveButton.setTitle("Hide", for: .normal)
        } else {
            saveButton.setTitle("Show", for: .normal)
            greetingText.isHidden = true
        }
        let message = messageTextField.text
        greetingText.text = message
        
//        ----------------
        
//        var isClear: Bool = sender.titleLabel?.text == "Save"
//        if isClear {
//            sender.setTitle("Clear", for: .normal)
//            var message = messageTextField.text
//            greetingText.text = message
//            messageTextField.text = ""
//            isClear = false
//        } else {
//            sender.setTitle("Save", for: .normal)
//            isClear = true
//            greetingText.text = ""
//        }
    }
    
    

}

