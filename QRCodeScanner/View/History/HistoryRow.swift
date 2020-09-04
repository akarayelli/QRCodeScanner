//  HistoryRow.swift
//  QRCodeScanner 
//
//  User: Alican.Karayelli
//  Date: 1.09.2020
//  Time: 10:45

import Foundation
import SwiftUI


struct HistoryRow: View {
    
    var scannedObject: ScannedObject?
    var historyViewModel: HistoryViewModel?
    
    @State private var showingAlert = false
    @State private var alertMsg = ""
    
    
    var body: some View{
        
        let stack = HStack{
            
            Image((scannedObject?.type == .url) ? "url" : "text")
                .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
            
            Text(scannedObject!.data)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color.white)
                .font(Font.custom("Nunito-Regular", size: 14))
            
            
            
            Image("copy")
                .frame(width: 40, height: 40, alignment: .center)
                .onTapGesture {
                    print("Copy button was tapped")
                    
                    let pasteboard = UIPasteboard.general
                    pasteboard.string = self.scannedObject?.data
                    
                    self.alertMsg = "Text copied to clipboard!"
                    self.showingAlert = true
                    
            }
            Image("trash")
                .frame(width: 40, height: 40, alignment: .center)
                .onTapGesture {
                    print("Delete button was tapped")
                    self.historyViewModel!.deleteRecentItem(scannedObject: self.scannedObject!)
            }
            
            
        }.frame(height: 60)
            .background(Color("Color2"))
            .cornerRadius(15)
            .alert(isPresented: $showingAlert){
                Alert(title: Text("Success"), message: Text(self.alertMsg), dismissButton: .default(Text("OK")))
        }
        
        return stack
    }
}

struct HistoryRow_Previews: PreviewProvider {
    static var previews: some View {
        HistoryRow(scannedObject: ScannedObject(data: "https://www.hackingwithswift.com/books/ios-swiftui/pushing-new-views-onto-the-stack-using-navigationlink", scanDate: "10.10.2020 11:22", type: .url))
    }
}
