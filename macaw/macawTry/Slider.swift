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
    
    var firstLine, secondLine: Shape
    
    init() {
        center = Point(x: size.w/2, y: size.h/2)
        let smallR = size.h/2 - 6
        let bigR = size.h/2
        let leftX = -size.w/2
        let totalLineLength = size.w - 2*4*smallR - 2*bigR - 6
        
        
        var x = leftX + smallR
        
        let leftCircle = Shape(form: Circle(cx: 0, cy: 0, r: smallR),
                               stroke: Stroke(fill: Style.lightGrayColor, width: 3),
                               place: .move(dx: x, dy: 0) )
        x += 3*smallR
        
        firstLine = Shape(form: Rect(x: 0, y: -1, w: totalLineLength/2, h: 2),
                              fill: Style.secondaryColor,
                              place: .move(dx: x, dy: 0))
        x += totalLineLength/2 + bigR
        
        let bigCircle = Shape(form: Circle(cx: 0, cy: 0, r: bigR),
                              fill: Style.bgColor,
                              stroke: Stroke(fill: Style.lightGrayColor, width: 5),
                              place: .move(dx: x, dy: 0) )
        x += bigR
        
        secondLine = Shape(form: Rect(x: 0, y: -1, w: totalLineLength/2, h: 2),
                               fill: Style.primaryColor,
                               place: .move(dx: x, dy: 0))
        x += totalLineLength/2 + 3*smallR
        
        let rightCircle = Shape(form: Circle(cx: 0, cy: 0, r: smallR),
                                fill: Style.lightGrayColor,
                                stroke: Stroke(fill: Style.lightGrayColor, width: 3),
                                place: .move(dx: x, dy: 0) )
        
        super.init(contents: [leftCircle, firstLine, secondLine, bigCircle, rightCircle])
        
        bigCircle.onPan( { (pan) in
            let newX = bigCircle.place.dx + pan.dx
            if newX > leftX + 5*smallR && newX < self.size.w/2 - 5*smallR {
                bigCircle.place = .move(dx: newX, dy: 0)
                self.value = newX/(self.size.w - 10*smallR) + 0.5
                self.changeLines(newX: newX)
            }
        })
    }
    
    private func changeLines(newX: Double) {
//        firstLine.form = Rect()
//        secondLine.form = Rect()
    }
    
    public var value: Double = 0.5
    
}
