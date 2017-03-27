//
//  Slider.swift
//  macawTry
//
//  Created by Eugeniu Cernei on 3/27/17.
//  Copyright © 2017 Eugeniu Cernei. All rights reserved.
//

//
//  Switch.swift
//  macawTry
//
//  Created by Eugeniu Cernei on 3/24/17.
//  Copyright © 2017 Eugeniu Cernei. All rights reserved.
//

import Macaw

class Slider: Group {
    
    let size = Size(w: 200, h: 30)
    let center: Point
    
    init() {
        center = Point(x: size.w/2, y: size.h/2)
        let smallR = size.h/2 - 6
        let bigR = size.h/2
        let leftX = -size.w/2
        let leftCircle = Shape(form: Circle(cx: 0, cy: 0, r: smallR),
                               stroke: Stroke(fill: Style.lightGrayColor, width: 3),
                               place: .move(dx: leftX + smallR, dy: 0) )
        
        let firstLine = Shape(form: Rect(x: 0, y: -1, w: size.w/3, h: 2),
                              fill: Style.secondaryColor,
                              place: .move(dx: leftX + 4*smallR, dy: 0))
    
        let secondLine = Shape(form: Rect(x: 0, y: -1, w: size.w/3, h: 2),
                                              fill: Style.primaryColor,
                                              place: .move(dx: leftX + smallR*4 + 2*bigR + size.w/3, dy: 0))
        
        super.init(contents: [leftCircle, firstLine, secondLine])
    }
}
