//
//  ColorPickerView.swift
//  Achtung baby
//
//  Created by Dmitry Zasenko on 15.09.22.
//

import SwiftUI

struct ColorPickerView: View {
    
    @Binding var selectedColors: PickerColors
    
    var body: some View {
        ScrollView(.vertical, showsIndicators: false) {
            LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 20) {
                ForEach(PickerColors.allCases, id: \.self) { pickerColors in
                    ZStack{
                        PickerRoundView(colors: pickerColors.getColors(pickerColors: pickerColors))
                            .background {
                                let a = pickerColors
                                MonthBorder(show: selectedColors == a)
                            }
                            .onTapGesture {
                                selectedColors = pickerColors
                            }
                        
                        
                        
//                        if selectedColors == pickerColors {
//                            Circle()
//                                .stroke(Color.black, lineWidth: 4)
//                            .frame(width: 80, height: 80)
//                        }
                    }
                }
            }
        }
    }
}

struct ColorPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerView(selectedColors: .constant(PickerColors.blackRed))
    }
}

struct MonthBorder: View {
    let show: Bool
    
    var body: some View {
        RoundedRectangle(cornerRadius: 15)
            .stroke(lineWidth: 3.0)
            .foregroundColor(show ? Color.red : Color.clear)
            .animation(.easeInOut(duration: 0.6), value: show)
    }
}
