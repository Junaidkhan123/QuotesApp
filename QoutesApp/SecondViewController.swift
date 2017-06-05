//
//  SecondViewController.swift
//  QoutesApp
//
//  Created by Junaid Khan on 03/06/2017.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit

class SecondViewController: UIViewController {

    @IBOutlet weak var favImage: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewWillAppear(_ animated: Bool) {
        view.backgroundColor = theme
        super.viewWillAppear(animated)
        let savingDefaults = UserDefaults.standard
        let index = savingDefaults.integer(forKey: "Fav")
        favImage.image = UIImage(named: String(index))
        let defaults = UserDefaults.standard
       let boolValue = defaults.bool(forKey: "switch")
        imageBorder = boolValue
        if imageBorder
        {
            favImage.layer.borderColor = UIColor.red.cgColor
            favImage.layer.borderWidth = 5.0
        }
        else
        {
            favImage.layer.borderWidth = 0
        }
    }
}

