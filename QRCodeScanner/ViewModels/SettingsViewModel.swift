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


    //Toggles Vibrate Settings
    func toggleVibrate(){
        Defaults.vibrate = !vibrate
        self.vibrate = !vibrate
    }
    
    
    //Toggles Beep Sound Settings
    func toggleBeepSound(){
        Defaults.beepSound = !beepSound
        self.beepSound = !beepSound
    }
    
    //Toggles Copy Result by Default Settings
    func toggleCopyResultToClipboard(){
        Defaults.copyResultToClipboard = !copyResultToClipboard
        self.copyResultToClipboard = !copyResultToClipboard
    }

    
    //Toggles Scan&Browse Settings
    func toggleScanAndBrowser(){
        Defaults.scanAndBrowser = !scanAndBrowser
        self.scanAndBrowser = !scanAndBrowser
    }

    
    //Toggles Save to History Settings
    func toggleSaveToHistory(){
        Defaults.saveToHistory = !saveToHistory
        self.saveToHistory = !saveToHistory
    }

    
    //Toggles Disable Duplicates Settings
    func toggleDisableDuplicates(){
         Defaults.disableDuplicates = !disableDuplicates
         self.disableDuplicates = !disableDuplicates
     }
    
}
