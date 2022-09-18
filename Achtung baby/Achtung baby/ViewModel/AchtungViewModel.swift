//
//  AchtungViewModel.swift
//  Achtung baby
//
//  Created by Dmitry Zasenko on 16.09.22.
//

import Foundation
import RealmSwift

final class AchtungViewModel: ObservableObject {
    @ObservedResults(AchtungRealm.self) var myAchtungs
}
