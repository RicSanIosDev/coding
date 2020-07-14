//
//  FirstViewController.swift
//  03-coding
//
//  Created by Ricardo Sanchez on 6/27/20.
//  Copyright © 2020 Ricardo Sanchez. All rights reserved.
//

import UIKit

class FirstViewController: UIViewController, UITextFieldDelegate{

    @IBOutlet weak var labelAge: UILabel!
    @IBOutlet weak var sliderAge: UISlider!
    
    var userAge = -1
    var userName = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        userAge = Int(sliderAge.value)
        labelAge.text = "\(userAge)"
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder() //cerramos el teclado
        print("Hemos pulsado la tecla enter en un textfield")
        if let theText = textField.text {
            print(theText)
            self.userName = theText
        }
        return true
    }
    
    @IBAction func sliderAgeMoved(_ sender: UISlider) {
       
        userAge = Int(sender.value)
        self.labelAge.text = "\(userAge)"
    }
    @IBAction func validateData(_ sender: UIButton) {
    
        if userName == "Juan" {
            print("Puedes pasar a la fiesta")
            self.view.backgroundColor = UIColor(red: 49/255, green: 237/255, blue: 93/255, alpha: 0.7)
        } else {
            if userAge >= 18 {
                print("Puedes pasar a la fiesta por ser mayor de edad")
            } else{
                print("Esta fiesta es privada, no puedes pasar...")
            }
        }
        
    }
}

