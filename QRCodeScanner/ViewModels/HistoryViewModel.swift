//  HistoryViewModel.swift
//  QRCodeScanner 
//
//  User: Alican.Karayelli
//  Date: 2.09.2020
//  Time: 17:32

import Foundation
import SwiftUI
import SwiftyUserDefaults
import AVFoundation


class HistoryViewModel: ObservableObject {
    
    @Published var recentList: [ScannedObject] = []
    @Published var flashOn: Bool = false

    
    /**
       Returns users recent items
       
       - Returns: List
       */
    func fetchRecentList() {
        
        self.recentList.removeAll()
        
        if let historyList = Defaults.historyList {
             self.recentList = historyList
        }else{
            self.recentList = []
        }
    }
    

    
    /**
     Deletes recent item
     
     - Returns: void
     */
    func deleteRecentItem(scannedObject: ScannedObject){
        
        let remainingList = self.recentList.filter { $0.id != scannedObject.id}
        self.recentList = remainingList
        Defaults.historyList = remainingList
    }
    

}
