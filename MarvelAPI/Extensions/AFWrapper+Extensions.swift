//
//  AFWrapper+Extensions.swift
//  MarvelAPI
//
//  Created by AlexR on 3/10/21.
//

import Foundation
import UIKit
import var CommonCrypto.CC_MD5_DIGEST_LENGTH
import func CommonCrypto.CC_MD5
import typealias CommonCrypto.CC_LONG


extension AFWrapper{
    
    func MD5(string: String) -> Data {
        let length = Int(CC_MD5_DIGEST_LENGTH)
        let messageData = string.data(using:.utf8)!
        var digestData = Data(count: length)
        
        _ = digestData.withUnsafeMutableBytes { digestBytes -> UInt8 in
            messageData.withUnsafeBytes { messageBytes -> UInt8 in
                if let messageBytesBaseAddress = messageBytes.baseAddress, let digestBytesBlindMemory = digestBytes.bindMemory(to: UInt8.self).baseAddress {
                    let messageLength = CC_LONG(messageData.count)
                    CC_MD5(messageBytesBaseAddress, messageLength, digestBytesBlindMemory)
                }
                return 0
            }
        }
        return digestData
    }
    
    // Returns ts, hashHex
    func generateTimeAndHash() -> (Int64, String) {
        let ts =  Int64(NSDate().timeIntervalSince1970)
        let md5 = String.init(format: "\(ts)%@%@", Constants.apiKeyPri, Constants.apiKeyPub)
        let hashData = MD5(string: md5)
        let hashHex =  hashData.map { String(format: "%02hhx", $0) }.joined()
        return (ts, hashHex)
    }
    
    func getEndAuthentication() -> String{
        let (ts, hashHex) = generateTimeAndHash()
        return "?ts=\(ts)&apikey=\(Constants.apiKeyPub)&hash=\(hashHex)"
    }
}
