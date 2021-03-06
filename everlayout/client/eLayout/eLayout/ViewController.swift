//
//  ViewController.swift
//  eLayout
//
//  Created by Eugeniu Cernei on 3/16/17.
//  Copyright © 2017 Eugeniu Cernei. All rights reserved.
//

import UIKit
import EverLayout

class ViewController: UIViewController {
    
    private var layout : EverLayout?
    
    @IBOutlet weak var textField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layoutData = NSData(contentsOfFile: Bundle.main.path(forResource: "ViewController", ofType: "json")!)
        
        self.layout = EverLayout(layoutData: layoutData as! Data)
        self.layout?.buildLayout(onView: self.view, viewEnvironment: self)
        
        textField.delegate = self
    }
    
}

extension ViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        return true
    }
}
