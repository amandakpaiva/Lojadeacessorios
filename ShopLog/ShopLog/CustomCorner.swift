//
//  CustomCorner.swift
//  ShopLog
//
//  Created by Amanda Karolina Santos da Fonseca Paiva on 02/05/22.
//

import SwiftUI

struct CustomCorner: Shape {
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft, .topRight], cornerRadii: CGSize(width: 35, height: 35))
        
        return Path(path.cgPath)
    }
}
