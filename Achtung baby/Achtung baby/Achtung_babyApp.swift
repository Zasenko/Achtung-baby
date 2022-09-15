//
//  Achtung_babyApp.swift
//  Achtung baby
//
//  Created by Dmitry Zasenko on 15.09.22.
//

import SwiftUI

@main
struct Achtung_babyApp: App {
    var body: some Scene {
        WindowGroup {
            ColorPickerView(myColors: MyColors())
        }
    }
}
