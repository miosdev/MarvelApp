//
//  KeysManager.swift
//  Marvel
//
//  Created by apple on 12/11/2024.
//

import Foundation
import CryptoKit

class KeysManager {
    static let shared = KeysManager()
    private let publicKey = "2e283065c04fff8f4463e9269dd410ac"
    private let privateKey = "b4e6824372740bdca2861a053f0bd192bf28cac5"
    
    private init() {}
    
    var apikey: String {
        publicKey
    }
    
    func getMd5Hash(using timestamp: Double) -> String? {
        let unhashedString = "\(timestamp)\(privateKey)\(publicKey)"
        guard !unhashedString.isEmpty, let data = unhashedString.data(using: .utf8) else { return nil }
        return Insecure.MD5.hash(data: data).map { String(format: "%02hhx", $0) }.joined()
    }
}
