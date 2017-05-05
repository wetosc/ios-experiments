//
//  ViewController.swift
//  ProgressHUD
//
//  Created by Eugeniu Cernei on 5/5/17.
//  Copyright © 2017 Eugeniu Cernei. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var button: UIButton!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        button.addTarget(self, action: #selector(clickButton), for: .touchUpInside)
    }
    
    func clickButton() {
        ProgressHUD.shared.show()
        DispatchQueue.main.asyncAfter(deadline: .now() + .seconds(3), execute:  {
            ProgressHUD.shared.hide()
        })
    }
}

