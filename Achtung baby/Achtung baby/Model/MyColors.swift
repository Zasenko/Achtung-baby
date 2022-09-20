//
//  MyColors.swift
//  Achtung baby
//
//  Created by Dmitry Zasenko on 15.09.22.
//

import SwiftUI

//красный/ оранжевый / желтый / зеленый / голубой / синий / фиолетовый / розовый / черный / белый

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
    case orangeAqua,
         orangeBlue

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
            return [Color(hex: "#FFFD00"), Color(hex: "#6F0AAA")]
        case .greenBlue:
            return [Color(hex: "#00FF00"), Color(hex: "#0000FF")]
        case .greenPink:
            return [Color(hex: "#00FF00"), Color(hex: "#FF1493")]
        case .redYellow:
            return [Color(hex: "#FF0000"), Color(hex: "#00FF00")]
        case .redGreen:
            return [Color(hex: "#FF0000"), Color(hex: "#00CC00")]
        case .orangeAqua:
            return [Color(hex: "#DB5C12"), Color(hex: "#00FFFF")]
        case .orangeBlue:
            return [Color(hex: "#FFC600"), Color(hex: "#1424C7")]
        }
    }
    
    func find(color: PickerColors, selectedColor: PickerColors) -> Bool {
        if color == selectedColor {
            return true
        } else {
            return false
        }
    }
}
