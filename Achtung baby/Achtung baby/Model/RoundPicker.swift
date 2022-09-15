//
//  RoundPicker.swift
//  Achtung baby
//
//  Created by Dmitry Zasenko on 15.09.22.
//

import SwiftUI

struct Semicircle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: 0, y: rect.size.height / 2))
            path.addQuadCurve(to: CGPoint(x: rect.size.width / 2, y: rect.size.height), control: CGPoint(x: 0, y: rect.size.height))
            path.addLine(to: CGPoint(x: rect.size.width / 2, y: 0))
            path.addQuadCurve(to: CGPoint(x: 0, y: rect.size.height / 2), control: CGPoint(x: 0, y: 0))
            path.closeSubpath()
        }
    }
}
