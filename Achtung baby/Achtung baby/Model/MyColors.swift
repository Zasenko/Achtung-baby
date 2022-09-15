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
    
    case yellowBlue
}

extension PickerColors {
    func test(pickerColors: PickerColors) -> some View {
        switch pickerColors {
        case .blackWhite:
            return RoundView(colors: [Color(hex: "#FFFFFF"), Color(hex: "#000000")])
        case .blackRed:
            return RoundView(colors: [Color(hex: "#FF0000"), Color(hex: "#000000")])
        case .blackPink:
            return RoundView(colors: [Color(hex: "#FF00FF"), Color(hex: "#000000")])
        case .blackYellow:
            return RoundView(colors: [Color(hex: "#FFFF00"), Color(hex: "#000000")])
        case .blackGreen:
            return RoundView(colors: [Color(hex: "#00FF00"), Color(hex: "#000000")])
        case .yellowBlue:
            return RoundView(colors: [Color(hex: "#0000FF"), Color(hex: "#FFFF00")])
        }
    }
}

struct RoundView: View {
    let colors: [Color]
    
    var body: some View {
        ZStack() {
            Circle()
               
                .frame(width: 80, height: 80)
                .foregroundColor(colors[0])
                
            
            Semicircle()                .foregroundColor(colors[1])
                .mask(
                    Circle().frame(width: 73, height: 73)
                )
                
        }
        .frame(width: 80)
    }
}



class MyColors: ObservableObject {
    
    @Published var myTwoColors: PickerColors = .blackWhite
   
    var basicColors: [PickerColors] = PickerColors.allCases
    
    
    func find(colors: PickerColors) -> Bool {
        if (colors == myTwoColors) {
            return true
        } else {
            return false
        }
    }
    
//    func onTap(color: HecColor) {
//        let a = find(color: color)
//        if !a {
//            myTwoColors.append(color)
//            myTwoColors.remove(at: 0)
//        }
//    }
}
