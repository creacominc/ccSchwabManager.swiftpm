//
//  Secrets.swift
//  ccSchwabManager
//
//  Created by Harold Tomlinson on 2025-01-10.
//

import Foundation
import CryptoKit

//let key = SymmetricKey( size:  .bits256 )
let keystr : String = """
theKey
0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789
0123456789012345678901234567890123456789012345678901234567890123456789012345678901234567890123456789
01234567890123456789012345678901234567890123456
"""
let key = SymmetricKey( data: keystr.data(using: .utf8)! )
let useEncodeing : Bool = false

struct Secrets: Codable
{

    init()
    {
        appId               = ""
        appSecret           = ""
        redirectUrl         = ""
        code                = ""
        session             = ""
        accessToken         = ""
        refreshToken        = ""
        accountNumbers      = []
        accountHashes       = []
    }
    
    var appId               : String
    var appSecret           : String
    var redirectUrl         : String
    var code                : String
    var session             : String
    var accessToken         : String
    var refreshToken        : String
    var accountNumbers      : [String]
    var accountHashes       : [String]
    
    
}

func loadSecrets() -> Secrets
{
    print( "loadSecrets" )
    var secrets: Secrets = Secrets()
    let fileName : String = "ccSchwabManager.secrets.json"
    do
    {
        if let documentDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first
        {
            let fileURL = documentDirectory.appendingPathComponent( fileName )
            print( "fileURL: \(fileURL)" )
            let encryptedData = try? Data( contentsOf: fileURL )
            if( encryptedData == nil )
            {
                print( "data loaded from the file is nil" )
            }
            else
            {
                if( useEncodeing )
                {
                    let sealedBox: AES.GCM.SealedBox = try! AES.GCM.SealedBox( combined: encryptedData! )
                    let decryptedData = try? AES.GCM.open( sealedBox, using: key )
                    if( decryptedData == nil )
                    {
                        print( "decryptedData is nill " )
                    }
                    else
                    {
                        print( "decryptedData is not nill " )
                        secrets =  try! JSONDecoder().decode( Secrets.self, from: decryptedData ?? Data() )
                        print( "loaded secrets: \(secrets)" )
                    }
                }
                else
                {
                    secrets =  try JSONDecoder().decode( Secrets.self, from: encryptedData! )
                    print( "loaded unencrypted secrets: \(secrets)" )
                }
            }
        }
    }
    catch
    {
        print("getSecretsFromFile: Error decoding JSON: \(error)")
    }
    return secrets
}


func storeSecrets( secrets: Secrets )
{
    print( "storeSecrets \(secrets.appId),  \(secrets.accessToken)" )
    let fileName : String = "ccSchwabManager.secrets.json"
    do
    {
        let documentsDirectory = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask).first!
        let fileURL = documentsDirectory.appendingPathComponent( fileName )
        // convert secrets to a json data
        let data = try JSONEncoder().encode( secrets )
        if( useEncodeing )
        {
            // encode the data
            let sealedBox = try! AES.GCM.seal(data, using: key)
            // save the encrypted data
            try? sealedBox.combined?.write(to: fileURL)
        }
        else
        {
            try? data.write(to: fileURL)
        }
        print( "saved \(secrets) to \(fileName) at \(fileURL.absoluteString)" )
    } catch {
        print("Error saving JSON: \(error)")
    }
}


