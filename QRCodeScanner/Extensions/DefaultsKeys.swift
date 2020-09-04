//  DefaultsKeys.swift
//  QRCodeScanner 
//
//  User: Alican.Karayelli
//  Date: 1.09.2020
//  Time: 10:52

import Foundation
import SwiftyUserDefaults

extension DefaultsKeys{
    var historyList: DefaultsKey<[ScannedObject]?> {.init("scannedObjects")}
    
    var vibrate: DefaultsKey<Bool> { .init("vibrate", defaultValue: true) }
    var beepSound: DefaultsKey<Bool> { .init("beepSound", defaultValue: false) }
    var copyResultToClipboard: DefaultsKey<Bool> { .init("copyResultToClipboard", defaultValue: false) }
    var scanAndBrowser: DefaultsKey<Bool> { .init("scanAndBrowser", defaultValue: false) }
    var saveToHistory: DefaultsKey<Bool> { .init("saveToHistory", defaultValue: true) }
    var disableDuplicates: DefaultsKey<Bool> { .init("disableDuplicates", defaultValue: true) }


}
