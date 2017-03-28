//
//  Style.swift
//  macawTry
//
//  Created by Eugeniu Cernei on 3/24/17.
//  Copyright © 2017 Eugeniu Cernei. All rights reserved.
//

import Macaw

class Style {
    
    static let bgColor = Color(val: 0x32373E)
    static let switchBGColor = Color(val: 0x1E2126)
    static let primaryColor = Color(val: 0xEC7F5A)
    static let secondaryColor = Color(val: 0x2E9B95)
    static let lightGrayColor = Color(val: 0x657282)
}

extension Color {
    
    func uiColor() -> UIColor {
        return UIColor(colorLiteralRed: Float(r())/255,
                       green: Float(g())/255,
                       blue: Float(b())/255,
                       alpha: Float(a()/255)
        )
    }
}
