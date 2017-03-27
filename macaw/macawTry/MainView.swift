//
//  MainView.swift
//  macawTry
//
//  Created by Eugeniu Cernei on 3/24/17.
//  Copyright © 2017 Eugeniu Cernei. All rights reserved.
//

import Macaw

class MainView: MacawView {
    
    var viewSize: Size!
    
    var top: Group
    
    required init?(coder aDecoder: NSCoder) {
        
        viewSize = Size(
            w: Double(UIScreen.main.bounds.width),
            h: Double(UIScreen.main.bounds.height)
        )
        
        let el1 = Switch()
        el1.state = false
        let t1 = Text(text: "Mobile data",
                      font: Font(name: "SanFranciscoDisplay-Regular", size: 9),
                      fill: Color.white, align: .mid, baseline: .mid,
                      place: .move(dx: el1.center.x, dy: -12))
        let group1 = Group(contents: [el1, t1], place: .move(dx: -viewSize.w/3-el1.center.x, dy: 0))
        
        let el2 = Switch()
        el2.state = true
        let t2 = Text(text: "Bluetooth",
                      font: Font(name: "SanFranciscoDisplay-Regular", size: 9),
                      fill: Color.white, align: .mid, baseline: .mid,
                      place: .move(dx: el2.center.x, dy: -12))
        let group2 = Group(contents: [el2, t2], place: .move(dx: -el2.center.x, dy: 0))
        
        let el3 = Switch()
        el3.state = true
        let t3 = Text(text: "Wi-Fi",
                      font: Font(name: "SanFranciscoDisplay-Regular", size: 9),
                      fill: Color.white, align: .mid, baseline: .mid,
                      place: .move(dx: el3.center.x, dy: -12))
        let group3 = Group(contents: [el3, t3], place: .move(dx: viewSize.w/3-el3.center.x, dy: 0))
        
        [el1, el2, el3].forEach { (elem) in elem.onTap { (event) in elem.state = !elem.state } }
        
        let line = Shape(form: Rect(x: -viewSize.w/2+20, y: 0, w: viewSize.w-40, h: 1),
                         fill: Color.white,
                         place: .move(dx: 0, dy: 50))
        
        top = Group( contents: [group1, group2, group3, line], place: .move(dx: viewSize.w/2, dy: 50))
        
        super.init(node: top, coder: aDecoder)
        
        self.backgroundColor = Style.bgColor.uiColor()
    }
    
}
