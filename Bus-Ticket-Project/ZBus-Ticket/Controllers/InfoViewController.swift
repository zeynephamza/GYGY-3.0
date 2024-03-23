//
//  InfoViewController.swift
//  ZBus-Ticket
//
//  Created by Zeynep Özcan on 23.03.2024.
//

import UIKit

class InfoViewController: UIViewController {
    
    @IBOutlet weak var frameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        
        let labelRect = CGRect(x: 16, y: 300, width: 200, height: 400)
        let label = UILabel(frame: labelRect)
        label.text = ticket.print()
        label.numberOfLines = 15
        label.font = UIFont(name: "Helvetica", size: 20)
        view.addSubview(label)
    }
    
    @IBAction func exitButton(_ sender: UIButton) {
        exit(0)
    }

}
