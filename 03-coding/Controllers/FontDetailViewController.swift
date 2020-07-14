//
//  FontDetailViewController.swift
//  03-coding
//
//  Created by Ricardo Sanchez on 6/28/20.
//  Copyright © 2020 Ricardo Sanchez. All rights reserved.
//

import UIKit

class FontDetailViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    

    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var pickerFonts: UIPickerView!
    @IBOutlet weak var textView: UITextView!
    
    var familyName : String = ""
    var fonts : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.labelTitle.text = familyName
        self.labelTitle.font = UIFont(name: familyName, size: 22.0)
        self.textView.font = UIFont(name: familyName, size: 14.0)
        
        if fonts.count == 0 {
            self.pickerFonts.isHidden = true
        }
        
        self.pickerFonts.dataSource = self
        self.pickerFonts.delegate = self
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

    @IBAction func doneButtonPressed(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - UIPickerView DataSource Methods
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.fonts.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return fonts[row]
    }
    
    // MARK: - UIPickerView Delegate Methods
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let font = fonts[row]
        self.textView.font = UIFont(name: font, size: 14.0)
    }
}
