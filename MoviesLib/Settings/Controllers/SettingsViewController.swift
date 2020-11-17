//
//  SettingsViewController.swift
//  MoviesLib
//
//  Created by Eric Alves Brito on 16/11/20.
//  Copyright © 2020 Afrodev. All rights reserved.
//

import UIKit

final class SettingsViewController: UIViewController {
    
    // MARK: - IBOutlets
    @IBOutlet weak var switchAutoplay: UISwitch!
    @IBOutlet weak var segmentedControlColors: UISegmentedControl!
    @IBOutlet weak var textFieldCategory: UITextField!
    
    // MARK: - Properties
    private let ud = UserDefaults.standard
    
    // MARK: - Super Methods
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
 
        switchAutoplay.isOn = ud.bool(forKey: Key.autoplay.rawValue)
        segmentedControlColors.selectedSegmentIndex = ud.integer(forKey: Key.color.rawValue)
        textFieldCategory.text = ud.string(forKey: Key.category.rawValue)
        
    }
    
    // MARK: - Methods
    
    // MARK: - IBActions
    @IBAction func changeAutoPlay(_ sender: UISwitch) {
        ud.set(sender.isOn, forKey: Key.autoplay.rawValue)
        ud.synchronize()
    }
    
    @IBAction func changeColor(_ sender: UISegmentedControl) {
        ud.set(sender.selectedSegmentIndex, forKey: Key.color.rawValue)
    }
    
    @IBAction func changeCategory(_ sender: UITextField) {
        ud.set(sender.text, forKey: Key.category.rawValue)
        sender.resignFirstResponder()
    }
    
}
