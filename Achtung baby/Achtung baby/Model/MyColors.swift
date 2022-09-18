//
//  MyColors.swift
//  Achtung baby
//
//  Created by Dmitry Zasenko on 15.09.22.
//

import SwiftUI

enum PickerColors: String, CaseIterable {
    case blackWhite,
         blackRed,
         blackPink,
         blackYellow,
         blackGreen
    case yellowBlue,
         yellowRed,
         yellowViolet
    case greenBlue,
         greenPink
    case redYellow,
         redGreen

    static func enumValueFromString(string value: String) -> PickerColors? {
            return self.allCases.first{ "\($0)" == value }
        }
}

extension PickerColors {
    func getColors(pickerColors: PickerColors) -> [Color] {
        switch pickerColors {
        case .blackWhite:
            return [Color(hex: "#000000"), Color(hex: "#FFFFFF")]
        case .blackRed:
            return [Color(hex: "#000000"), Color(hex: "#FF0000")]
        case .blackPink:
            return [Color(hex: "#000000"), Color(hex: "#FF00FF")]
        case .blackYellow:
            return [Color(hex: "#000000"), Color(hex: "#FFFF00")]
        case .blackGreen:
            return [Color(hex: "#000000"), Color(hex: "#00FF00")]
        case .yellowBlue:
            return [Color(hex: "#FFFF00"), Color(hex: "#0000FF")]
        case .yellowRed:
            return [Color(hex: "#FFFF00"), Color(hex: "#FF0000")]
        case .yellowViolet:
            return [Color(hex: "#FFFF00"), Color(hex: "#8A2BE2")]
        case .greenBlue:
            return [Color(hex: "#00FF00"), Color(hex: "#0000FF")]
        case .greenPink:
            return [Color(hex: "#00FF00"), Color(hex: "#FF1493")]
        case .redYellow:
            return [Color(hex: "#FF0000"), Color(hex: "#00FF00")]
        case .redGreen:
            return [Color(hex: "#FF0000"), Color(hex: "#00FF00")]
        }
    }
}
