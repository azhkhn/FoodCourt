//
//  OrderConfirmationViewController.swift
//  Food Aggregator
//
//  Created by Chashmeet on 31/10/18.
//  Copyright © 2018 Chashmeet Singh. All rights reserved.
//

import UIKit

class OrderConfirmationViewController: UIViewController {
    
    var order: Order! {
        didSet {
            orderPickupTimeLabel.text = "\(order.preparationTime) minutes"
            orderLabel.text = "#\(order.id)"
        }
    }
    
    var yourOrdersView = false
    
    let confirmationLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 28)
        label.textAlignment = .center
        label.text = "Thankyou for your order.\nYou order number is:"
        label.numberOfLines = 2
        return label
    }()
    
    let orderLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: "#757575")
        label.font = UIFont.systemFont(ofSize: 60)
        label.text = "#31431"
        label.textAlignment = .center
        return label
    }()
    
    let orderPickupLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 28)
        label.textAlignment = .center
        label.text = "Please pick up your order in"
        label.numberOfLines = 2
        return label
    }()
    
    let orderPickupTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: "#757575")
        label.font = UIFont.systemFont(ofSize: 22)
        label.text = "25 minutes"
        label.textAlignment = .center
        return label
    }()
    
    let orderOrderedLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.systemFont(ofSize: 28)
        label.textAlignment = .center
        label.text = "Ordered at:"
        label.numberOfLines = 2
        return label
    }()
    
    let orderOrderedTimeLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(hex: "#757575")
        label.font = UIFont.systemFont(ofSize: 22)
        label.text = "25 minutes"
        label.textAlignment = .center
        return label
    }()
    
    let yourOrderButton: UIButton = {
        let button = UIButton()
        button.setTitle("Your Orders", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = UIColor(hex: "#00E676")
        button.addTarget(self, action: #selector(yourOrdersButtonTapped), for: .touchUpInside)
        return button
    }()
    
    var timer = Timer()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if order.orderStatus == "ACTIVE" {
            title = "Order Confirmed"
        } else {
            title = "Order Complete"
        }

        view.backgroundColor = UIColor(red: 240/255, green: 240/255, blue: 240/255, alpha: 1.0)
        
        view.addSubview(confirmationLabel)
        view.addSubview(orderLabel)
        view.addSubview(orderPickupLabel)
        view.addSubview(orderPickupTimeLabel)
        
        view.addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: confirmationLabel)
        view.addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: orderLabel)
        view.addConstraintsWithFormat(format: "V:|-16-[v0]", views: confirmationLabel)
        view.addConstraint(NSLayoutConstraint(item: orderLabel, attribute: .centerY, relatedBy: .equal, toItem: self.view, attribute: .centerY, multiplier: 1, constant: -50))
        view.addConstraint(NSLayoutConstraint(item: orderLabel, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0))
        view.addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: orderPickupLabel)
        view.addConstraintsWithFormat(format: "H:|-16-[v0]-16-|", views: orderPickupTimeLabel)
        
        if !yourOrdersView {
            navigationItem.setHidesBackButton(true, animated: true)
            
            view.addSubview(yourOrderButton)
            view.addConstraintsWithFormat(format: "H:[v0(200)]", views: yourOrderButton)
            view.addConstraint(NSLayoutConstraint(item: yourOrderButton, attribute: .centerX, relatedBy: .equal, toItem: self.view, attribute: .centerX, multiplier: 1, constant: 0))
            view.addConstraintsWithFormat(format: "V:[v0]-8-[v1]-8-[v2]-16-|", views: yourOrderButton, orderPickupLabel, orderPickupTimeLabel)
        } else {
            view.addConstraintsWithFormat(format: "V:[v0]-8-[v1]-16-|", views: orderPickupLabel, orderPickupTimeLabel)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        runTimer()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(animated)
        
//        timer.invalidate()
    }
    
//    func runTimer() {
//        timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true, block: { (timer) in
//            let date1 = Date()
//            let date2 = Date(timeIntervalSince1970: TimeInterval(self.order!.preparationTime))
//            let diff = Int(date1.timeIntervalSince1970 - date2.timeIntervalSince1970) - Int(date1.timeIntervalSince1970)
//            print(diff)
//            if diff > 0 {
//                self.orderPickupTimeLabel.text = "\(diff) minutes"
//            } else {
//                self.orderPickupTimeLabel.text = "0 minutes"
//            }
//        })
//    }
    
    @objc func yourOrdersButtonTapped() {
        var viewControllers: [UIViewController] = self.navigationController!.viewControllers as [UIViewController]
        
        for controller in viewControllers.reversed() {
            if !controller.isKind(of: ClientHomeViewController.self) {
                viewControllers.removeLast()
            } else {
                break
            }
        }
        let vc = OrdersViewController(collectionViewLayout: UICollectionViewFlowLayout())
        viewControllers.insert(vc, at: viewControllers.count)
        navigationController?.setViewControllers(viewControllers, animated: true)
    }

}
