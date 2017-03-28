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
    
    var firstLine, secondLine, bigCircle: Shape
    
    var smallR, bigR: Double
    
    var listener: ((_ value: Double) -> Void)?
    
    init() {
        center = Point(x: size.w/2, y: size.h/2)
        smallR = size.h/2 - 6
        bigR = size.h/2
        
        var x = -size.w/2 + smallR
        
        let leftCircle = Shape(form: Circle(cx: 0, cy: 0, r: smallR),
                               stroke: Stroke(fill: Style.lightGrayColor, width: 3),
                               place: .move(dx: x, dy: 0) )
        x += 3*smallR
        
        firstLine = Shape(form: Rect(x: 0, y: -1, w: size.w/2 - 4*smallR, h: 2),
                          fill: Style.secondaryColor,
                          place: .move(dx: x, dy: 0))
        x = 0
        
        bigCircle = Shape(form: Circle(cx: 0, cy: 0, r: bigR),
                              fill: Style.bgColor,
                              stroke: Stroke(fill: Style.lightGrayColor, width: 5),
                              place: .move(dx: x, dy: 0) )
        x = size.w/2 - 4*smallR
        
        secondLine = Shape(form: Rect(x: 0, y: -1, w: -size.w/2 + 4*smallR, h: 2),
                           fill: Style.primaryColor,
                           place: .move(dx: x, dy: 0))
        x += 3*smallR
        
        let rightCircle = Shape(form: Circle(cx: 0, cy: 0, r: smallR),
                                fill: Style.lightGrayColor,
                                stroke: Stroke(fill: Style.lightGrayColor, width: 3),
                                place: .move(dx: x, dy: 0) )
        
        super.init(contents: [leftCircle, firstLine, secondLine, bigCircle, rightCircle])
        
        bigCircle.onPan( { (pan) in
            let newX = self.bigCircle.place.dx + pan.dx
            if newX > -self.size.w/2 + 4*self.smallR && newX < self.size.w/2 - 4*self.smallR {
                self.bigCircle.place = .move(dx: newX, dy: 0)
                self.value = round(newX/(self.size.w - 8*self.smallR)*100)/100 + 0.5
                self.changeLines(newX: newX)
            }
        })
    }
    
    private func changeLines(newX: Double) {
        firstLine.form = Rect(x: 0, y: -1, w: newX+size.w/2 - 4*smallR , h: 2)
        secondLine.form = Rect(x: 0, y: -1, w: -size.w/2+newX+4*smallR, h: 2)
    }
    
    public var value: Double = 0.5 {
        didSet {
            self.listener?(value)
        }
    }
    
    func onValueChange(listener: @escaping ((_ value: Double) -> Void)){
        self.listener = listener
    }
    
}
