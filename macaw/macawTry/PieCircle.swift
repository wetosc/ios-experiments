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
    
    var circleR: Double
    
    var value: Double = 0.5 {
        didSet {
            var shift = -Double.pi/2
            var extent = value*2*Double.pi
            firstArc.form = Circle(cx: 0, cy: 0, r: circleR).arc(shift: shift, extent: extent)
            
            shift = shift + extent
            extent = (1-value)*2*Double.pi
            secondArc.form = Circle(cx: 0, cy: 0, r: circleR).arc(shift: shift, extent: extent)
        }
    }
    var text = "123" {
        didSet {
            textNode.text = self.text
        }
    }
    
    private let firstArc, secondArc: Shape
    private let textNode: Text
    
    init() {
        circleR = size.h / 2
        var shift = -Double.pi/2
        var extent = value*2*Double.pi
        
        firstArc = Shape(form: Circle(cx: 0, cy: 0, r: circleR).arc(shift: shift, extent: extent),
                                stroke: Stroke(fill: Style.primaryColor, width: 5))
        
        shift = shift + extent
        extent = (1-value)*2*Double.pi
        secondArc = Shape(form: Circle(cx: 0, cy: 0, r: circleR).arc(shift: shift, extent: extent),
                             stroke: Stroke(fill: Style.secondaryColor, width: 5))
        
        textNode = Text(text: text,
                            fill: Color.white,
                            align: .mid,
                            baseline: .mid,
                            place: .move(dx: 0, dy: 0))
        
        super.init(contents: [firstArc, secondArc, textNode])
    }
    
}
