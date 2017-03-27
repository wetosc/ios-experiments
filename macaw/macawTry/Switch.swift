//
//  Switch.swift
//  macawTry
//
//  Created by Eugeniu Cernei on 3/24/17.
//  Copyright © 2017 Eugeniu Cernei. All rights reserved.
//

import Macaw

class Switch: Group {
    
    private let bgOval: Shape
    private let circle: Shape
    private let text: Text
    
    let size = Size(w: 60, h: 25)
    let center: Point
    
    init() {
        center = Point(x: size.w/2, y: size.h/2)
        
        let soap = RoundRect(rect: Rect(x: 0, y: 0, w: size.w, h: size.h),
                             rx: size.w/2, ry: size.h/2)
        let circle1 = Circle(cx: size.h/2, cy: center.y, r: size.h/2 + 1)
        
        bgOval = Shape(form: soap,
                       fill: Style.switchBGColor)
        
        circle = Shape(form: circle1,
                       fill: Style.switchPrimaryColor)
        circle.opaque = false
        
        text = Text(text: "ON",
                        font: Font(name: "Avenir", size: 10),
                        fill: Color.white)
        text.place = .move(dx: size.w/2 + 2, dy: size.h/2)
        text.baseline = .mid
        text.align = .min
        text.opaque = false
        
        super.init(contents: [bgOval, circle, text])
    }
    
    public var state: Bool = false {
        didSet {
            if state { toON() } else { toOFF() }
        }
    }
    
    private func toOFF() {
        circle.placeVar.animate(from: circle.place,
                                to: Transform.move(dx: 0, dy: 0),
                                during: 0.5, delay: 0)
        text.text = "ON"
        text.place = .move(dx: size.w/2 + 2, dy: center.y)
        circle.fill = Style.switchPrimaryColor
    }
    
    private func toON() {
        circle.placeVar.animate(from: circle.place,
                                to: Transform.move(dx: size.w-size.h, dy: 0),
                                during: 0.5, delay: 0)
        text.text = "OFF"
        text.place = .move(dx: size.h/2-3, dy: size.h/2)
        circle.fill = Style.switchSecondaryColor
    }
    
}
