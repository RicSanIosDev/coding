//
//  ThirdViewController.swift
//  03-coding
//
//  Created by Ricardo Sanchez on 6/27/20.
//  Copyright © 2020 Ricardo Sanchez. All rights reserved.
//

import UIKit

class ThirdViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    
    var familíes : [String] = []
    
    var fonts : [String : [String]] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        familíes = UIFont.familyNames.sorted( by: { return $0 < $1 })
        for fam in familíes {
            fonts[fam] = UIFont.fontNames(forFamilyName: fam)
            
        }
        // Do any additional setup after loading the view.
    }
    

    
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "ShowFontsForFamily" {
            let navController = segue.destination as! UINavigationController
            let destinationVC = navController.topViewController as! FontDetailViewController
            let idx = self.tableView.indexPathForSelectedRow!.row
            destinationVC.familyName = self.familíes[idx]
            destinationVC.fonts = self.fonts[self.familíes[idx]]!
        }
    }
    
    //Mark: -protocol UITableViewDataSource
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.familíes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FontFamilyCell", for: indexPath)
        let fontFamily = familíes[indexPath.row]
        cell.textLabel?.text = fontFamily
        cell.textLabel?.font = UIFont(name: fontFamily, size: 20.0)
        return cell
    }
    
    
    
    //Mark: -protocol UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = indexPath.row
        let fontFamily = familíes[row]
        let familyFonts = fonts[fontFamily]!
        print(familyFonts)
    }
    
}
