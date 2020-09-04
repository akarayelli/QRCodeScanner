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
            
            VStack{
                Image((scannedObject?.type == .url) ? "url" : "text")
                    .padding(EdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 10))
                
                Text(scannedObject!.scanDate!)
                    .foregroundColor(Color.white)
                    .font(Font.custom(Constants.Fonts.Light, size: 7))
                    .padding(EdgeInsets(top: 0, leading: 10, bottom: 0, trailing: 0))
                
            }
            
            
            Text(scannedObject!.data)
                .frame(maxWidth: .infinity, alignment: .leading)
                .foregroundColor(Color.white)
                .font(Font.custom(Constants.Fonts.Regular, size: 14))
                .lineLimit(2)
                .minimumScaleFactor(0.5)
            
            
            
            Image("copy")
                .frame(width: 30, height: 30, alignment: .center)
                .onTapGesture {
                    print("Copy button was tapped")
                    
                    let pasteboard = UIPasteboard.general
                    pasteboard.string = self.scannedObject?.data
                    
                    self.alertMsg = "view.alert.msg.copy.success".localized
                    self.showingAlert = true
            }
            
            
            Image("trash")
                .frame(width: 30, height: 30, alignment: .center)
                .padding(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 10))
                .onTapGesture {
                    print("Delete button was tapped")
                    self.historyViewModel!.deleteRecentItem(scannedObject: self.scannedObject!)
            }
            
            
        }.frame(height: 60)
            .background(Constants.Colors.Main)
            .cornerRadius(15)
            .alert(isPresented: $showingAlert){
                Alert(title: Text("view.alert.title.success"), message: Text(self.alertMsg), dismissButton: .default(Text("ok")))
        }
        
        return stack
    }
}

struct HistoryRow_Previews: PreviewProvider {
    static var previews: some View {
        HistoryRow(scannedObject: ScannedObject(data: "https://www.hackingwithswift.com/books/ios-swiftui/pushing-new-views-onto-the-stack-using-navigationlink", scanDate: "10.10.2020 11:22", type: .url))
    }
}
