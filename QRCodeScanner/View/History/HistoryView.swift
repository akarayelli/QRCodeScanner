//  HistoryView.swift
//  QRCodeScanner 
//
//  User: Alican.Karayelli
//  Date: 1.09.2020
//  Time: 10:45

import Foundation
import SwiftUI

struct HistoryView: View{
    
    
    init() {
        if #available(iOS 14.0, *) {
            // iOS 14 doesn't have extra separators below the list by default.
        } else {
            // To remove only extra separators below the list:
            UITableView.appearance().tableFooterView = UIView()
        }

        // To remove all separators including the actual ones:
        UITableView.appearance().separatorStyle = .none
    }
    
    
    @ObservedObject var historyViewModel = HistoryViewModel()

    
    var body: some View{
        
        /*
        let rowData: [ScannedObject] = [ScannedObject(data: "Alican", scanDate: Date().toString(format: Constants.DateFormat.dd_mm_yyyy_hh_ss), type: .url),
                                        ScannedObject(data: "Velican", scanDate: Date().toString(format: Constants.DateFormat.dd_mm_yyyy_hh_ss), type: .url),
                                        ScannedObject(data: "Delican", scanDate: Date().toString(format: Constants.DateFormat.dd_mm_yyyy_hh_ss), type: .url)
        ]
        */
        
        let view = VStack{
            
            Text("Recent Scanned Codes")
                .frame(maxWidth: .infinity)
                .frame(height: 80)
                .foregroundColor(Color("Color3"))
                .font(Font.custom("Nunito-ExtraBold", size: 20))
                    

            List(historyViewModel.recentList) { data in
                HistoryRow(scannedObject: data, historyViewModel: self.historyViewModel)
            }
            
        }.onAppear{
            self.historyViewModel.fetchRecentList()
        }
        
        return view
        
    }
}
