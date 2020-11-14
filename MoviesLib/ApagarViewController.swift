//
//  ApagarViewController.swift
//  MoviesLib
//
//  Created by Eric Alves Brito on 14/11/20.
//  Copyright © 2020 Afrodev. All rights reserved.
//

import UIKit

class ApagarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }
}


extension ApagarViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return UITableViewCell()
    }
    
    
}

extension ApagarViewController: UITableViewDelegate {
    
}
