//
//  ViewController.swift
//  Circumference
//
//  Created by Adrian on 24/09/2018.
//  Copyright © 2018 Adrián Blázquez León. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var funcView: FunctionView!
    
    @IBOutlet weak var radiusSlider: UISlider!
    
     // It is done a did set: to update it
    
    var radius: Double = 0.0{
        didSet {
            funcView.setNeedsDisplay()
        }
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        funcView.R = 50.0
        radiusSlider.sendActions(for: .valueChanged)
        
    }

    @IBAction func radiusUpdate(_ sender: UISlider) {
        funcView.R = Double(150.0*sender.value)
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

