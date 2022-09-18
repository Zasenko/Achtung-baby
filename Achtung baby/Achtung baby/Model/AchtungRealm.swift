//
//  RealmAchtungViewModel.swift
//  Achtung baby
//
//  Created by Dmitry Zasenko on 15.09.22.
//

import Foundation
import RealmSwift

class AchtungRealm: Object, Identifiable {
    @Persisted(primaryKey: true) var id = UUID()
    @Persisted var colors = PickerColors.blackWhite.rawValue
    @Persisted var text: String = ""
    @Persisted var date = Date()
}
