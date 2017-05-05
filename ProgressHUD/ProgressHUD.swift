//
//  ProgressHUD.swift
//  ProgressHUD
//
//  Created by Eugeniu Cernei on 5/5/17.
//  Copyright © 2017 Eugeniu Cernei. All rights reserved.
//

import UIKit

enum HUDState {
    case hidden
    case show
}

class ProgressHUD {
    public static let shared = ProgressHUD()
    
    private init() {
        setupBGView()
        setupFrontView()
        setupIndicator()
    }
    
    private func setupBGView() {
        guard let window = UIApplication.shared.keyWindow else {  return  }
        view = UIView(frame: window.frame)
        view?.backgroundColor = UIColor.init(white: 0.5, alpha: 0.5)
    }
    
    private func setupFrontView() {
        guard let window = UIApplication.shared.keyWindow,
            let view = view else {  return  }
        frontView = UIView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 100, height: 100)))
        frontView?.center = window.center
        
        frontView?.backgroundColor = UIColor(colorLiteralRed: 242/255,
                                             green: 133/255,
                                             blue: 105/255, alpha: 1)
        frontView?.layer.cornerRadius = 15
        view.addSubview(frontView!)
    }
    
    private func setupIndicator() {
        guard let frontView = frontView else {  return  }
        indicator = UIActivityIndicatorView (frame: frontView.frame)
        indicator?.center = CGPoint.init(x: frontView.frame.width/2, y: frontView.frame.width/2)
        frontView.addSubview(indicator!)
        indicator?.activityIndicatorViewStyle = .whiteLarge
    }
    
    
    private var view: UIView?
    private var frontView: UIView?
    private var indicator: UIActivityIndicatorView?
    
    private(set) public var state: HUDState = .hidden
    
    public func show() {
        guard state == .hidden,
            let window = UIApplication.shared.keyWindow,
            let view = view else {  return  }
        
        window.addSubview(view)
        indicator?.startAnimating()
        state = .show
    }
    
    public func hide() {
        view?.removeFromSuperview()
        indicator?.stopAnimating()
        state = .hidden
    }
    
}
