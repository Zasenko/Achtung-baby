//
//  PickerRoundView.swift
//  Achtung baby
//
//  Created by Dmitry Zasenko on 16.09.22.
//

import SwiftUI

struct PickerRoundView: View {
    let colors: [Color]
    
    var body: some View {
        ZStack {
            Circle()
                .fill(colors[1])
            Circle()
                .trim(from: 0.5, to: 1.5)
                .fill(colors[0])
        }
        .frame(width: 60, height: 60)
    }
}

struct PickerRoundView_Previews: PreviewProvider {
    static var previews: some View {
        PickerRoundView(colors: [.red, .blue])
    }
}
