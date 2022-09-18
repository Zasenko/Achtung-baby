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
        
        LazyVGrid(columns: [GridItem(.adaptive(minimum: 80))], spacing: 20) {
            
            ForEach(PickerColors.allCases, id: \.self) { pickerColors in
                
                PickerRoundView(colors: pickerColors.getColors(pickerColors: pickerColors))
                    .onTapGesture {
                        selectedColors = pickerColors
                    }
                
            }
        }
    }
}


struct ColorPickerView_Previews: PreviewProvider {
    static var previews: some View {
        ColorPickerView(selectedColors: .constant(PickerColors.blackWhite))
    }
}
