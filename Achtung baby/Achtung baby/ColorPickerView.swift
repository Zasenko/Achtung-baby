//
//  ColorPickerView.swift
//  Achtung baby
//
//  Created by Dmitry Zasenko on 15.09.22.
//

import SwiftUI

struct ColorPickerView: View {
    @ObservedObject var myColors: MyColors
    private var gridItemLayout = [GridItem(.adaptive(minimum: 80))]
    
    init(myColors: MyColors) {
        self.myColors = myColors
    }
    var body: some View {
        
        LazyVGrid(columns: gridItemLayout, spacing: 20) {
            
            ForEach(myColors.basicColors, id: \.self) { pickerColors in
                
                pickerColors.test(pickerColors: pickerColors)
                
                
            }//-ForEach
        }//-LazyVGrid
    }
    
}


struct ColorPickerView_Previews: PreviewProvider {

    
    static var previews: some View {
        ColorPickerView(myColors: MyColors())
    }
}
