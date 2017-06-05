//
//  ThirdViewController.swift
//  QoutesApp
//
//  Created by Junaid Khan on 03/06/2017.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit
var imageBorder = false
class ThirdViewController: UIViewController {
    
    @IBOutlet weak var favStepper: UIStepper!
    @IBOutlet weak var switchBorder: UISwitch!
    @IBOutlet weak var segmentedTheme: UISegmentedControl!
    @IBOutlet var settingsLabels: [UILabel]!
    
    let savingDefaults = UserDefaults.standard
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = theme
        let index = savingDefaults.integer(forKey: "theme")
        if index == 0
        {
            view.backgroundColor = UIColor.black
            changeThemColor(color: .white)
        }
        else
        {
            view.backgroundColor = UIColor.white
            changeThemColor(color: .black)
        }
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    @IBAction func segmentPressed(_ sender: Any) {
        let index = segmentedTheme.selectedSegmentIndex
        savingDefaults.set(index, forKey: "theme")
        if index == 0
        {
            theme = UIColor.black
            changeThemColor(color: .white)
        }
        else
        {
            theme = UIColor.white
            changeThemColor(color: .black)
        }
        view.backgroundColor = theme
    }
    @IBAction func switchPressed(_ sender: Any) {
        if switchBorder.isOn
        {
            imageBorder = true
            let defaults = UserDefaults.standard
            defaults.set(imageBorder, forKey: "switch")
        }
        else
        {
            imageBorder = false
        }
    }
    func changeThemColor(color : UIColor)
    {
        for label in settingsLabels
        {
            label.textColor = color
        }
        segmentedTheme.tintColor = color
        switchBorder.onTintColor = color
        favStepper.tintColor = color
    }
}
