//
//  ProgressHUD.swift
//  ProgressHUD
//
//  Created by Eugeniu Cernei on 5/5/17.
//  Copyright © 2017 Eugeniu Cernei. All rights reserved.
//
import UIKit

//MARK: HUDState

enum HUDState {
    
    case hidden
    case show
}

//MARK: ProgressHUD

class ProgressHUD {
    
    //MARK: - Public Properties
    
    public static let shared = ProgressHUD()
    
    private(set) public var state: HUDState = .hidden
    
    //MARK: - Public Methods
    
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
    
    //MARK: - Private Properties
    
    private var view: UIView?
    private var frontView: UIView?
    private var indicator: UIActivityIndicatorView?
    
    //MARK: - Private Methods
    
    private init() {
        setupBGView()
        setupFrontView()
        setupIndicator()
    }
    
    private func setupBGView() {
        guard let window = UIApplication.shared.keyWindow else {  return  }
        view = UIView(frame: window.frame)
        view?.backgroundColor = UIColor.clear
    }
    
    private func setupFrontView() {
        guard let window = UIApplication.shared.keyWindow,
            let view = view else {  return  }
        frontView = UIView(frame: CGRect(origin: CGPoint.zero, size: CGSize(width: 100, height: 100)))
        frontView?.center = window.center
        
        frontView?.backgroundColor = UIColor(white: 0.8, alpha: 0.6)
        frontView?.layer.cornerRadius = 5
        view.addSubview(frontView!)
    }
    
    private func setupIndicator() {
        guard let frontView = frontView else {  return  }
        indicator = UIActivityIndicatorView (frame: frontView.frame)
        indicator?.center = CGPoint.init(x: frontView.frame.width/2, y: frontView.frame.width/2)
        frontView.addSubview(indicator!)
        indicator?.activityIndicatorViewStyle = .whiteLarge
    }
    
}
