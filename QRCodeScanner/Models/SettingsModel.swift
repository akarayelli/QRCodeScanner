//  SettingsModel.swift
//  QRCodeScanner 
//
//  User: Alican.Karayelli
//  Date: 2.09.2020
//  Time: 15:04

import Foundation

struct SettingsModel: Identifiable{
    
    var id = UUID()
    var type: SettingsType
    var icon: String
    var text: String
    
}
