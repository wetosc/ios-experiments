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
    
    public let inputUsername : UITextField = UITextField()
    public let inputPassword : UITextField = UITextField()
    public let buttonRegister : UIButton = UIButton()
    public let buttonLogin : UIButton = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let layoutData = NSData(contentsOfFile: Bundle.main.path(forResource: "ViewController", ofType: "json")!)
        
        self.layout = EverLayout(layoutData: layoutData as! Data)
        self.layout?.buildLayout(onView: self.view, viewEnvironment: self)
        layout?.delegate = self
    }
    
}

extension ViewController: EverLayoutDelegate {
    
    func layout (_ layout : EverLayout , didLoadOnView view : UIView) {
        
    }
}

