//
//  AppState.swift
//  ccSchwabManager
//
//  Created by Harold Tomlinson on 2024-12-31.
//

import Foundation

public enum AppState: String, Codable, CaseIterable
{
    // when the app is starting up until it finds the secrets
    case Initial
    // secrets found and getting authorized
    case Authorizing
    // authorized, getting access token and account numbers
    case RequestingAccessToken
    // access token stored, getting accounts
    case FetchData
    case Working
    case Refreshing
    case Disconnecting
    case Closing
    
}

