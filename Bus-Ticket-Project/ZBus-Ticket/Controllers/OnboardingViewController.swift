//
//  OnboardingViewController.swift
//  ZBus-Ticket
//
//  Created by Zeynep Özcan on 21.03.2024.
//

import UIKit

class OnboardingViewController: UIViewController {
    
    @IBOutlet var holderView: UIView!
    @IBOutlet weak var pageControl: UIPageControl!
    
    var currentPage = 0
    let scrollView = UIScrollView()
    let titles = ["Welcome ZBus App", "Get a Card", "Enjoy Your Ride"]
    let subTitles = ["Easily book anywhere in the city.",
                    "Get a membership card and get surprise discounts.",
                     "Fasten your seat belts, ready to go on an adventure."]
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    override func viewDidLayoutSubviews() {
        super.viewDidLayoutSubviews()
        configure()
    }
    
    private func configure() {
        // Scroll view setting
        
        scrollView.frame = holderView.bounds
        holderView.addSubview(scrollView)
        //let titles = ["Welcome", "Card", "Ride"]
        for x in 0..<3 {
            let pageView = UIView(frame: CGRect(x: Int(CGFloat(x) * holderView.frame.size.width), y: 0, width: Int(holderView.frame.size.width), height: Int(holderView.frame.size.height)))
            
            scrollView.addSubview(pageView)
            
            // adding title image and buttons
            let label = UILabel(frame: CGRect(x: 10, y: 10, width: pageView.frame.size.width - 20, height: 120))
            
            
            let subLabel = UILabel(frame: CGRect(x: 10, y: 70, width: pageView.frame.size.width - 20, height: 120))
            
            let imageView = UIImageView(frame: CGRect(x: 10, y: 10+120+10, width: pageView.frame.size.width - 20, height: pageView.frame.size.height-60 - 130 - 10))
            
            let button = UIButton(frame: CGRect(x: 10, y: pageView.frame.size.height-60, width: pageView.frame.size.width - 20, height: 50))
            
            label.textAlignment = .center
            label.font = UIFont(name: "Helvetica-Bold", size: 32)
            pageView.addSubview(label)
            label.text = titles[x]
            
            subLabel.textAlignment = .center
            subLabel.font = UIFont(name: "Helvetica", size: 20)
            subLabel.lineBreakMode = .byWordWrapping
            subLabel.numberOfLines = 0;

            pageView.addSubview(subLabel)
            subLabel.text = subTitles[x]
            
            
            imageView.contentMode = .scaleAspectFit
            imageView.image = UIImage(named: "welcome_\(x+1)")
            pageView.addSubview(imageView)
            
           
            
            button.setTitleColor(.white, for: .normal)
            button.backgroundColor = .black
            button.setTitle("Continue", for: .normal)
            if x == 2 {
                button.setTitle("Ged Started", for: .normal)
            }
            button.addTarget(self, action: #selector(didTapButton(_:)), for: .touchUpInside)
            pageView.addSubview(button)
        }
        scrollView.contentSize = CGSize(width: holderView.frame.size.width*3, height: 0)
        scrollView.isPagingEnabled = true
    }
    
    @objc func didTapButton(_ button: UIButton) {
        /*
        guard button.tag < 3 else {
            //dismiss
            return
        }
        scrollView.setContentOffset(CGPoint(x: holderView.frame.size.width*CGFloat(button.tag), y: 0), animated: true)*/
        pageControl.currentPage += 1
        if scrollView.contentOffset.x <= self.view.bounds.width * CGFloat(titles.count-2) {
                scrollView.contentOffset.x +=  self.view.bounds.width
        } else {
            print("Get started")
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let vc = storyboard.instantiateViewController(identifier: "MainMenuVC")
            vc.modalPresentationStyle = .fullScreen
            vc.modalTransitionStyle = .coverVertical
            //Core.share.setIsNotNewUser()
            present(vc, animated: true)
            
        }
        
        
        
    }
    
}
