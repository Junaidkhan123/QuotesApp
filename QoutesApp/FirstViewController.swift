//
//  FirstViewController.swift
//  QoutesApp
//
//  Created by Junaid Khan on 03/06/2017.
//  Copyright © 2017 mac. All rights reserved.
//

import UIKit
var theme : UIColor = UIColor.black
class FirstViewController:UIViewController
{
    @IBOutlet weak var savedLAbel: UILabel!
    
    @IBOutlet weak var qoutesImage: UIImageView!
    var quotesArray = [String]()
    var arrayIndex =  0
    // changing color
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        view.backgroundColor = theme
        let defaults = UserDefaults.standard
        let boolValue = defaults.bool(forKey: "switch")
        imageBorder = boolValue
        if imageBorder
        {
            qoutesImage.layer.borderColor = UIColor.red.cgColor
            qoutesImage.layer.borderWidth = 5.0
        }
        else
        {
          qoutesImage.layer.borderWidth = 0
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        for i in 0..<5
        {
            quotesArray.append(String(i))
        }
    }
    
    
    @IBAction func nextPressed(_ sender: Any) {
        if arrayIndex < quotesArray.count - 1
        {
            arrayIndex += 1
            let index = quotesArray[arrayIndex]
            let takeImage = UIImage(named: index)
            qoutesImage.image = takeImage
        }
    }
  
    @IBAction func BackPressed(_ sender: Any) {
        if arrayIndex > 0
        {
            arrayIndex -= 1
            let index = quotesArray[arrayIndex]
            let takeImage = UIImage(named: index)
            qoutesImage.image = takeImage
        }
    }
    
    
    @IBAction func savedPressed(_ sender: Any) {
        let savingDefaults = UserDefaults.standard
        savingDefaults.set(arrayIndex, forKey: "Fav")
        UIView.animate(withDuration: 0.5, animations: {
            self.self.savedLAbel.alpha = 1.0
        }) { (true) in
            UIView.animate(withDuration: 1.0, animations: {
                self.savedLAbel.alpha = 0
            }, completion: nil)
        }
    }
    
}

