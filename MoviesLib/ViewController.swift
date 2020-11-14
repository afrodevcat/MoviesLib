//
//  ViewController.swift
//  MoviesLib
//
//  Created by Eric Alves Brito on 11/11/20.
//  Copyright © 2020 Afrodev. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func gotToURL(_ sender: UIButton) {
        UIApplication.shared.open(URL(string: "https://www.toystory3.com.br")!, options: [:], completionHandler: nil)
    }
    
}

