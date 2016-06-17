//
//  ViewController.swift
//  PropertyObserversDemo
//
//  Created by Pasan Premaratne on 1/28/16.
//  Copyright © 2016 Pasan Premaratne. All rights reserved.
//

import UIKit

class ViewController: UIViewController
{

    @IBOutlet weak var tempView: UIView!
    // add a stored property
    let someString: String
    
    // UIView controllers designated initialiser
    // allows UIKit to set up view controller from a storyboard instance
    init(testString: String)
    {
        someString = testString
        super.init(nibName: nil, bundle: nil) // pass in nil for both arguments
    }
    // When an app iis used the systemm saves  it state at differnet points
    // Required uses NSCoder -- system needs to achive and unaachive the state 
    // allows archived view contoroller to be unarchived 
    // init -> unarchives and assigns values
    // super.init needed so assign dummy values
    required init?(coder aDecoder: NSCoder)
    {
        someString = ""
        super.init(coder: aDecoder)
    }
    
    var value: Double = 0.0
    {
        willSet
        {
            print("Old value: \(value)")
        }
        didSet
        {
            tempView.alpha = CGFloat(value)
            print("New value: \(value)")
        }
    }
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning()
    {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func slide(sender: UISlider)
    {
        value = Double(sender.value)
    }

}

