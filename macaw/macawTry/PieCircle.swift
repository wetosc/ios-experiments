//
//  PieCircle.swift
//  macawTry
//
//  Created by Eugeniu Cernei on 3/28/17.
//  Copyright © 2017 Eugeniu Cernei. All rights reserved.
//

import Macaw

class PieCircle: Group {
    
    let size = Size(w: 60, h: 60)
    var circleR: Double = 30.0
    
    var value: Double = 0.6
    
    init() {
        circleR = size.h / 2
        var shift = -Double.pi/2
        var extent = value*2*Double.pi
        
        let firstArc = Shape(form: Circle(cx: 0, cy: 0, r: circleR).arc(shift: shift, extent: extent),
                                stroke: Stroke(fill: Style.secondaryColor, width: 5))
        
        shift = shift+extent
        extent = (1-value)*2*Double.pi
        let secondArc = Shape(form: Circle(cx: 0, cy: 0, r: circleR).arc(shift: shift, extent: 1),
                             stroke: Stroke(fill: Style.primaryColor, width: 5))
        
        super.init(contents: [firstArc, secondArc])
    }
    
}
