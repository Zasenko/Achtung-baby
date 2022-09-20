//
//  PickerRoundView.swift
//  Achtung baby
//
//  Created by Dmitry Zasenko on 16.09.22.
//

import SwiftUI

struct PickerRoundView: View {
    
    let colors: [Color]
    @State private var isTapped: Bool = false
    private let anumationDuratilon: Double = 0.2
    
    var body: some View {
        ZStack {
            Circle()
                .fill(colors[1])
            Circle()
                .trim(from: 0.5, to: 1.5)
                .fill(colors[0])
                
        }
        .frame(width: 60, height: 60)
        .scaleEffect(isTapped ? 1.6 : 1)
        .animation(.easeIn(duration: anumationDuratilon), value: isTapped)
        .onTapGesture {
            isTapped.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + anumationDuratilon) {
                isTapped.toggle()
            }
        }
    }
}

struct PickerRoundView_Previews: PreviewProvider {
    static var previews: some View {
        PickerRoundView(colors: [.red, .blue])
    }
}
