//  SettingsViewModel.swift
//  QRCodeScanner 
//
//  User: Alican.Karayelli
//  Date: 4.09.2020
//  Time: 13:54

import Foundation
import SwiftUI
import SwiftyUserDefaults
import AVFoundation


class SettingsViewModel: ObservableObject {
    
    @Published var vibrate: Bool = Defaults.vibrate
    @Published var beepSound: Bool = Defaults.beepSound
    @Published var copyResultToClipboard: Bool = Defaults.copyResultToClipboard
    @Published var scanAndBrowser: Bool = Defaults.scanAndBrowser
    @Published var saveToHistory: Bool = Defaults.saveToHistory
    @Published var disableDuplicates: Bool = Defaults.disableDuplicates


    func toggleVibrate(){
        Defaults.vibrate = !vibrate
        self.vibrate = !vibrate
    }
    
    func toggleBeepSound(){
        Defaults.beepSound = !beepSound
        self.beepSound = !beepSound
    }
    
    func toggleCopyResultToClipboard(){
        Defaults.copyResultToClipboard = !copyResultToClipboard
        self.copyResultToClipboard = !copyResultToClipboard
    }
    
    func toggleScanAndBrowser(){
        Defaults.scanAndBrowser = !scanAndBrowser
        self.scanAndBrowser = !scanAndBrowser
    }
    
    func toggleSaveToHistory(){
        Defaults.saveToHistory = !saveToHistory
        self.saveToHistory = !saveToHistory
    }
    
    func toggleDisableDuplicates(){
         Defaults.disableDuplicates = !disableDuplicates
         self.disableDuplicates = !disableDuplicates
     }
    
}
