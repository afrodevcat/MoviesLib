//
//  AppDelegate.swift
//  MoviesLib
//
//  Created by Eric Alves Brito on 11/11/20.
//  Copyright © 2020 Afrodev. All rights reserved.
//

import UIKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        
        let alreadyOpen = UserDefaults.standard.bool(forKey: "alreadyOpen")
        if alreadyOpen != true {
            print("Seja bem-vindo!!!!")
            UserDefaults.standard.set(true, forKey: "alreadyOpen")
        }
        
        return true
    }

}

