//  ScannerViewModel.swift
//  QRCodeScanner 
//
//  User: Alican.Karayelli
//  Date: 4.09.2020
//  Time: 14:31

import Foundation
import SwiftUI
import SwiftyUserDefaults
import AVFoundation


class ScannerViewModel: ObservableObject {
    
    @Published var recentList: [ScannedObject] = []
    @Published var flashOn: Bool = false

    
    /**
     Appends recent item to UserDefaults
     
     - Returns: void
     */
    func addToRecentList(scannedObject: ScannedObject, removeDuplicate: Bool){
            
        
        if let historyList = Defaults.historyList {
            
            if removeDuplicate && (historyList.filter{$0.data == scannedObject.data}.count > 0){
                return
            }
            
            self.recentList = historyList
            self.recentList.append(scannedObject)
            Defaults.historyList?.append(scannedObject)
            
        }else{
            self.recentList = [scannedObject]
            Defaults.historyList = [scannedObject]
        }
    }
    
    
    func checkIfVibrate() -> Bool{
        return Defaults.vibrate
    }
    
    func checkIfBeepSound() -> Bool{
        return Defaults.beepSound
    }
    
    func checkIfCopyByDefault() -> Bool{
        return Defaults.copyResultToClipboard
    }
    
    func checkIfBrowseByDefault() -> Bool{
        return Defaults.scanAndBrowser
    }
    
    func checkIfSaveToRecentList() -> Bool{
        return Defaults.saveToHistory
    }
    
    func checkIfRemoveDuplicate() -> Bool{
        return Defaults.disableDuplicates
    }
    
    
    /**
    Toggles torch
     
    - Returns: void
    */
    func toggleTorch(on: Bool) {
        guard
            let device = AVCaptureDevice.default(for: AVMediaType.video),
            device.hasTorch
        else { return }

        do {
            try device.lockForConfiguration()
            device.torchMode = on ? .on : .off
            device.unlockForConfiguration()
            self.flashOn = on
        } catch {
            print("Torch could not be used")
        }
    }

}
