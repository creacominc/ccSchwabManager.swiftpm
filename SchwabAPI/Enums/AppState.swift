//
//  AppState.swift
//  ccSchwabManager
//
//  Created by Harold Tomlinson on 2024-12-31.
//

import Foundation

public enum AppState: String, Codable, CaseIterable
{
    
    case Initial
    case Authorizing
    case RequestingAccessToken
    case Working
    case Refreshing
    case Disconnecting
    case Closing
    
}

