//
//  NoticeModel.swift
//  Achtung baby
//
//  Created by Dmitry Zasenko on 15.09.22.
//

import Foundation
import RealmSwift


class AchtungRealmModel: Object, Identifiable {
    @Persisted(primaryKey: true) var id = UUID()
    @Persisted var colors = PickerColors.blackWhite.rawValue
    @Persisted var text: String = ""
    @Persisted var date = Date()
    @Persisted var ownerId = ""

    init(id: UUID, colors: PickerColors, text: String, date: Date) {
        self.id = id
        self.colors = colors.rawValue
        self.text = text
        self.date = date
    }
}

class ColorsRealmModel: Object {
    var name: String = PickerColors.blackWhite.rawValue
    @Persisted(originProperty: "colors") var group: LinkingObjects<AchtungRealmModel>
    @Persisted var ownerId = ""
}
