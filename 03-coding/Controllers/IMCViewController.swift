//
//  IMCViewController.swift
//  03-coding
//
//  Created by Ricardo Sanchez on 6/29/20.
//  Copyright © 2020 Ricardo Sanchez. All rights reserved.
//

import UIKit

class IMCViewController: UIViewController {

    @IBOutlet weak var stepper: UIStepper!
    @IBOutlet weak var labelKg: UILabel!
    
    @IBOutlet weak var slider: UISlider!
    @IBOutlet weak var labelCm: UILabel!
    @IBOutlet weak var textView: UITextView!
    
    var peso : Double = 0.0
    var altura : Double = 0.0
    var imc : Double = 0.0
    
    override func viewDidLoad() {
        super.viewDidLoad()

        updateLabelPeso(peso: stepper.value)
        updateLabelAltura(altura: Double(slider.value))
    }
    
@IBAction func stepperMoved(_ sender: UIStepper) {
        updateLabelPeso(peso: sender.value)
    }
    
    @IBAction func sliderMoved(_ sender: UISlider) {
        updateLabelAltura(altura: Double(sender.value))
    }
    
    @IBAction func calculateButtonPressed(_ sender: Any) {
        calculateIMC()
    }
    
    func updateLabelPeso( peso : Double) {
        self.peso = peso
        let formateo = String(format: "%.2f", peso)
        self.labelKg.text = "\(formateo) Kg"
    }
    
    func updateLabelAltura( altura : Double) {
        self.altura = altura
        let formateo = String(format: "%.2f", self.altura)
        self.labelCm.text = "\(formateo) Mts"
    }
    
    func calculateIMC() {
        let estatura = (altura*altura)
        imc = peso / (estatura)
        let formateo = String(format: "%.2f", imc)
        switch imc {
            
        case ..<16.0:
            
            self.textView.text = """
            Calificación: Bajo peso
            Delgadez Severa
            IMC: \(formateo) Kg/m^2
            """
        case 16.0...16.99:
            print(imc)
            self.textView.text = """
            Calificación: Bajo peso
            Delgadez moderada
            IMC: \(formateo) Kg/m^2
            """
        case 17.00...18.49:
            print(imc)
            self.textView.text = """
            Calificación: Delgadez leve
            IMC: \(formateo) Kg/m^2
            """
        case 18.50..<24.99:
            print(imc)
            self.textView.text = """
            Calificación: Normal
            IMC: \(formateo) Kg/m^2
            """
        case 25.00...29.99:
            print(imc)
            self.textView.text = """
            Calificación: Sobrepeso
            Preobesidad
            IMC: \(formateo) Kg/m^2
            """
        case 30.00...34.99:
            print(imc)
            self.textView.text = """
            Calificación: Obesidad
            Obesidad leve
            IMC: \(formateo) Kg/m^2
            """
        case 35.00...39.99:
            print(imc)
            self.textView.text = """
            Calificación: Obesidad
            Obesidad media
            IMC: \(formateo) Kg/m^2
            """
        default:
            print(imc)
            self.textView.text = """
            Calificación: Obesidad
            Obesidad mórbida
            IMC: \(formateo) Kg/m^2
            """
        }
    }
}
