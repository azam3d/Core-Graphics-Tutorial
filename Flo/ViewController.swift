//
//  ViewController.swift
//  Flo
//
//  Created by Muhammad Azam Bin Baderi on 2/13/17.
//  Copyright © 2017 Muhammad Azam Bin Baderi. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var graphView: GraphView!
    @IBOutlet weak var counterView: CounterView!
    @IBOutlet weak var counterLabel: UILabel!
    
    var isGraphViewShowing = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        counterLabel.text = String(counterView.counter)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func btnPushButton(button: PushButtonView) {
        if button.isAddButton {
            counterView.counter += 1
        } else {
            if counterView.counter > 0 {
                counterView.counter -= 1
            }
        }
        counterLabel.text = String(counterView.counter)
        
        if isGraphViewShowing {
            counterViewTap(gesture: nil)
        }
    }
    
    @IBAction func counterViewTap(gesture:UITapGestureRecognizer?) {
        if (isGraphViewShowing) {
            UIView.transition(from: graphView,
                              to: counterView,
                              duration: 1.0,
                              options: [UIViewAnimationOptions.transitionFlipFromLeft, UIViewAnimationOptions.showHideTransitionViews],
                              completion:nil)
        } else {
            UIView.transition(from: counterView,
                              to: graphView,
                              duration: 1.0,
                              options: [UIViewAnimationOptions.transitionFlipFromRight, UIViewAnimationOptions.showHideTransitionViews],
                              completion: nil)
        }
        isGraphViewShowing = !isGraphViewShowing
    }
}
