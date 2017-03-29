//
//  MainView.swift
//  macawTry
//
//  Created by Eugeniu Cernei on 3/24/17.
//  Copyright © 2017 Eugeniu Cernei. All rights reserved.
//

import Macaw

class MainView: MacawView {
    
    static let viewSize = Size(
        w: Double(UIScreen.main.bounds.width),
        h: Double(UIScreen.main.bounds.height)
    )
    
    required init?(coder aDecoder: NSCoder) {
        
        let top = MainView.topGroup()
        let midSlider = MainView.sliderGroup()
        let pies = MainView.pieCirclesGroup()
        
        super.init(node: Group(contents: [top, midSlider, pies]), coder: aDecoder)
        
        self.backgroundColor = Style.bgColor.uiColor()
    }
    
    private static func topGroup() -> Group {
        
        let texts = ["Mobile Data", "Bluetooth","Wi-FI"]
        let states = [false, true, true]
        
        var elements: [Node] = (0...2).map( { (index) in
            return MainView.topElement(index: index, states[index], texts[index]) as Node
        })
        
        let line = Shape(form: Rect(x: -MainView.viewSize.w/2+20, y: 0,
                                    w: MainView.viewSize.w-40, h: 1),
                         fill: Style.lightGrayColor,
                         place: .move(dx: 0, dy: 50))
        elements.append(line)
        return Group( contents: elements, place: .move(dx: MainView.viewSize.w/2, dy: 50))
    }
    
    private static func topElement(index: Int,_ state: Bool,_ str: String) -> Group {
        
        let elem = Switch()
        elem.state = state
        elem.onTap { (event) in elem.state = !elem.state }
        
        let text = Text(text: str,
                        font: Font(name: "SanFranciscoDisplay-Regular", size: 9),
                        fill: Color.white, align: .mid, baseline: .mid,
                        place: .move(dx: elem.center.x, dy: -12))
        
        let xPosition = Double(index-1)*MainView.viewSize.w/3-elem.center.x
        return Group(contents: [elem, text],
                     place: .move(dx: xPosition, dy: 0))
    }
    
    private static func sliderGroup() -> Group {
        let elem = Slider()
        
        elem.onValueChange { (value) in
            print("Brightness: ",value)
        }
        
        return Group(contents: [ elem ],
                     place: .move(dx: MainView.viewSize.w/2, dy: 130))
    }
    
    private static func pieCirclesGroup() -> Group {
        let elem1 = PieCircle()
        elem1.text = "650"
        elem1.value = 0.65
        let text1 = Text(text: "Memory used (MB)",
                        font: Font(name: "SanFranciscoDisplay-Regular", size: 9),
                        fill: Color.white, align: .mid, baseline: .mid,
                        place: .move(dx: 0, dy: -elem1.size.h/2 - 15))
        let pie1 = Group(contents:[elem1, text1], place: .move(dx: -MainView.viewSize.w/4, dy: 0))
        
        let elem2 = PieCircle()
        elem2.text = "85%"
        elem2.value = 0.85
        let text2 = Text(text: "Data used 890MB",
                         font: Font(name: "SanFranciscoDisplay-Regular", size: 9),
                         fill: Color.white, align: .mid, baseline: .mid,
                         place: .move(dx: 0, dy: -elem2.size.h/2 - 15))
        let pie2 = Group(contents:[elem2, text2], place: .move(dx: MainView.viewSize.w/4, dy: 0))
        
        return Group(contents: [pie1, pie2], place: .move(dx:MainView.viewSize.w/2, dy: 250))
    }
}
