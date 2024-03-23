//
//  ViewController.swift
//  ZzzBusTicket
//
//  Created by Zeynep Özcan on 20.03.2024.
//

import UIKit
import CoreData

class ViewController: UIViewController {
    

    @IBOutlet weak var enteredName: UITextField!
    @IBOutlet weak var enteredSurname: UITextField!
    @IBOutlet weak var enteredID: UITextField!
    @IBOutlet weak var enteredFrom: UITextField!
    @IBOutlet weak var enteredTo: UITextField!
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    

    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        
        // First time the user install the app
        if Core.share.isNewUser() {
            var token = "testdeneme"
            var filledseats = "111111000000000000000000000000000000000000000"
            
            UserDefaults.standard.set(token, forKey: "mytoken")
            UserDefaults.standard.set(filledseats, forKey: "filledSeatsCore")
            UserDefaults.standard.synchronize()
            //setSeatsToCore(filledseats)
            
            // show onboarding
            let vc = storyboard?.instantiateViewController(withIdentifier: "onboarding") as! OnboardingViewController
            Core.share.setIsNotNewUser()
            vc.modalPresentationStyle = .fullScreen
            present(vc, animated: true)
        }
    }
/*
    func setSeatsToCore(_ seats: [Int] ){
        let context = getContext()
        let seatentity = NSEntityDescription.entity(forEntityName: "SeatAvailability", in: context)
        
        let seatThatSave = NSManagedObject(entity: seatentity!, insertInto: context)
        
        seatThatSave.setValue(seats, forKey: "seatsDC")
        
        (UIApplication.shared.delegate as! AppDelegate).saveContext()
    }
    
    func getContext() -> NSManagedObjectContext {
        return (UIApplication.shared.delegate as! AppDelegate).persistentContainer.viewContext
    }
    */
    
    //If the user clicks next, the information has been
    //entered and this information is saved.
    @IBAction func saveUserInfo(_ sender: UIButton) {
        
        if enteredName.text!.isEmpty ||
            enteredSurname.text!.isEmpty ||
            enteredID.text!.isEmpty  ||
            enteredTo.text!.isEmpty ||
            enteredFrom.text!.isEmpty
        {
          
            showAlertMessage(title: "Alert", message: "Please check the informations before continue.")
            
        } else {
            if enteredID.text?.isInt == false {
                showAlertMessage(title: "Alert", message: "The ID must be a numerical number.")
            }
            else {
                passenger = Passenger(name: enteredName.text!, surname: enteredSurname.text!, id: Int(enteredID.text!)!)
            }
            
          
            
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(withIdentifier: "seatsView") as! SeatsViewController
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .flipHorizontal
            present(vc, animated: true)
            
            
        }
    }
    
    
    @IBAction func isDateEntered(_ sender: UIDatePicker) {
        
        let components = sender.calendar.dateComponents([.day,.month,.year,.hour,.minute], from: sender.date)
        
        date = Date(day: components.day!, month: components.month!, year: components.year!)
        
        time = Time(hour: components.hour!, minute: components.minute!)
        
    }
    
    
}

extension String {
    var isInt: Bool {
        return Int(self) != nil
    }
}



class Core {
    static let share = Core()
    
    func isNewUser() -> Bool {
        return !UserDefaults.standard.bool(forKey: "isNewUser")
        
    }
    
    func setIsNotNewUser() {
        UserDefaults.standard.set(true, forKey: "isNewUser")
    }
}

