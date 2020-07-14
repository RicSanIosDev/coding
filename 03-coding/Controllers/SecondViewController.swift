//
//  SecondViewController.swift
//  03-coding
//
//  Created by Ricardo Sanchez on 6/27/20.
//  Copyright © 2020 Ricardo Sanchez. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {
    
    @IBOutlet weak var labelNumber: UILabel!
    @IBOutlet weak var textViewResult: UITextView!
    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var labelGoldNum: UILabel!
    
    var fibonacci : [Int] = [0,1]
    var fibId = 1
    var wantGoldNum = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        updateLabel(id: Int(stepper.value))
    }

    func generatFibNumbers() {
        
        fibonacci = [0,1]
        for i in 2...fibId {
            fibonacci.append(fibonacci[i-1] + fibonacci[i-2])
        }
       
        let fibStr : [String] = fibonacci.compactMap({ String($0)})
        let result : String = fibStr.joined(separator: "\n")
        self.textViewResult.text = result	
    }

    @IBAction func stepperPressed(_ sender: UIStepper) {
        
        updateLabel(id: Int(sender.value))
    }
    
    func updateLabel(id: Int) {
        self.fibId = id
        self.labelNumber.text = "\(fibId)"
        generatFibNumbers()
        calculateGoldNum()
    }
    @IBAction func switchMoved(_ sender: UISwitch) {
        wantGoldNum = sender.isOn
        calculateGoldNum()
    
    }
    
    func calculateGoldNum() {
        if (wantGoldNum){
            let last = Double(fibonacci[fibonacci.count-1])
            let previous = Double(fibonacci[fibonacci.count-2])
            let goldNum = last/previous
            self.labelGoldNum.text = "\(goldNum)"
        }else {
            self.labelGoldNum.text = "Ver numero de oro"
        }
    }
}

