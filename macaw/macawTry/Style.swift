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
    static let switchPrimaryColor = Color(val: 0x2E9B95)
    static let switchSecondaryColor = Color(val: 0xEC7F5A)
    
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

