//
//  SeatsViewController.swift
//  ZBus-Ticket
//
//  Created by Zeynep Özcan on 22.03.2024.
//

import UIKit
import CoreData

class SeatsViewController: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var seatsCollectionView: UICollectionView!
    @IBOutlet weak var enteredSeatNumbers: UITextField!
    @IBOutlet weak var purchaseButton: UIButton!
    
    @IBOutlet weak var showTicketButton: UIButton!
    
    
    var seats = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10","11","12","13","14","15","16","17","18","19","20",
                 "21", "22", "23", "24", "25", "26", "27", "28", "29", "30",
                 "31", "32", "33", "34", "35", "36", "37", "38", "39" ,"40",
                 "41", "42", "43", "44", "45"]
    
    var filledseatsStringRead = UserDefaults.standard.string(forKey: "filledSeatsCore")?.compactMap{Int(String($0))}
    
    var filledSeats = [Int]()
    
    var seatCellImages = [UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge"),UIImage(systemName: "chair.lounge")]
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        seatsCollectionView.delegate = self
        seatsCollectionView.dataSource = self
        filledSeats = filledseatsStringRead!
        
        showTicketButton.isHidden = true
        for i in 0...44 {
            if filledSeats[i]==1{
                seatCellImages[i]=UIImage(systemName: "chair.lounge.fill")
                
            }
            
        }
        
        let layout = self.seatsCollectionView.collectionViewLayout as! UICollectionViewFlowLayout
        layout.sectionInset = UIEdgeInsets(top: 0, left: 5, bottom: 0, right: 5)
        layout.minimumInteritemSpacing = 5
        layout.itemSize = CGSize(width: (self.seatsCollectionView.frame.size.width - 20)/2 , height: self.seatsCollectionView.frame.size.height/3)
        
        
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return seats.count
        
    }
    @IBAction func purchaseTicket(_ sender: UIButton) {
        filledseatsStringRead = UserDefaults.standard.string(forKey: "filledSeatsCore")?.compactMap{Int(String($0))}
        filledSeats = filledseatsStringRead!
        
        let seatNumberStr = enteredSeatNumbers.text
        let arrayInt = seatNumberStr!.components(separatedBy: " ")
        if Int(arrayInt[0]) != nil {
            let seatNumberIntArray = arrayInt.map{Int($0)!-1}
            var canBuy=true
            let totalTicketNext = ticket.seats!.count + seatNumberIntArray.count
            
            let MAXPOSSIBLETICKETS = 5
            
            var validSeat = true
            
            if totalTicketNext > MAXPOSSIBLETICKETS {
                showAlertMessage(title: "Alert", message: "You can not have more than 5 tickets.")
            }
            
            // 5 ten yuksek degilse almayi deneyebilir
            // suan almaya calistigi bilet sayisi 0 dan buyuk olmali
            else if seatNumberIntArray.count > 0 {

                // almaya calistigi yerler bos mu ?
                for i in seatNumberIntArray {
                    if i <= 0 || i > 45 {
                        canBuy = false
                        validSeat = false
                        showAlertMessage(title: "Alert", message: "This seat does not exist.")
                        break
                    
                    }
                    if filledSeats[i]==1{
                        canBuy = false
                    }

                    
                }
                // If the places he is trying to take are empty, he can take them
                if canBuy {
                    // Take seats one by one and show them full
                    for i in seatNumberIntArray {
                        seatCellImages[i]=UIImage(systemName: "chair.lounge.fill")
                        filledSeats[i]=1
                    }
                    //hidden button, "show my tickets", go to the next page
                    
                    // Once received, add the current tickets to the tickets I have.
                    //ticket.seats?.append(contentsOf: seatNumberIntArray)
                    
                    for i in seatNumberIntArray {
                        ticket.seats?.append(i + 1)
                    }
                    
                    // show ticket sale button
                    showAlertMessage(title: "Success", message: "You have bought tickets.")
                    showTicketButton.isHidden = false
                    
                    let filledSeatStringTOWRITE = filledSeats.map { String($0) }.joined()
                    UserDefaults.standard.set(filledSeatStringTOWRITE, forKey: "filledSeatsCore")
                    
                    
                    //Ticket construction called
                    ticket = Ticket(passenger: passenger, date: date, time: time, seats: ticket.seats!, seatCount: (ticket.seats?.count)!)
                    
                } else if validSeat == true {
                    showAlertMessage(title: "Alert", message: "One or more of your selected seats are occupied.")
                }
            }
            else{
                showAlertMessage(title: "Alert", message: "Please select a seat to continue.")
            }
        }
        else{
            showAlertMessage(title: "Alert", message: "Please enter a valid seat numbers.")
        }
        
        
        seatsCollectionView.reloadData()
    }
    
    
    @IBAction func showTicket(_ sender: UIButton)
    {
        
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "infoVC") as! InfoViewController
        vc.modalPresentationStyle = .fullScreen
        vc.modalTransitionStyle = .coverVertical
        present(vc, animated: true)
        
    }
    
    
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "aSeatCell", for: indexPath) as! SeatCollectionViewCell
        
        cell.seatLabel.text = seats[indexPath.item]
        cell.seatImage.image = seatCellImages[indexPath.item]
        
        return cell
    }

    

}
