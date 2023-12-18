//
//  ViewController.swift
//  Localized description of an error type
//
//  Created by Macbook Air 2017 on 18. 12. 2023..
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Task {
            do {
                let users = try await getUsers()
                print("Data fetching was sucessful. \nHere are all the users: \n")
                users.forEach({
                    print($0.name)
                })
            }
            catch {
                print(error.localizedDescription)
            }
        }
    }
}

