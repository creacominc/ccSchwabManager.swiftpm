//
//  ContentView.swift
//  ccSchwabManager
//
//  Created by Harold Tomlinson on 2024-12-21.
//

import SwiftUI
import SwiftData
//import Foundation
//import AuthenticationServices

struct ContentView: View
{
    private var schwabClient : SchwabClient

    @Environment(\.modelContext) private var context

    @State private var appState : AppState = AppState.allCases.first!
//    @State private var workflowEnum : WorkflowEnum = WorkflowEnum.allCases.first!
//    @State private var testButtonTitle : String = "Test"
//    @State private var testButtonEnabled : Bool = false
//    @State private var authenticateButtonEnabled : Bool = false
//    @State private var authenticateButtonTitle : String = "Authenticate on Web"
//    @State private var authenticateButtonUrl : URL = URL(string: "https://127.0.0.1")!

    init( schwabClient: SchwabClient )
    {
        self.schwabClient = schwabClient
    }

    var body: some View
    {

        VStack
        {
            WorkflowButtonsView()
            AccountsView(schwabClient: self.schwabClient)
            SecurityListView()
        }


    }

}

#Preview
{
    let schwabClient : SchwabClient = SchwabClient( secrets: getSecretsFromFile() )

    // fake accounts information for preview
    schwabClient.secrets.accountNumbers = ["*7890", "*6789"]

//    let positionConfig = ModelConfiguration(isStoredInMemoryOnly: true)
//    let accountConfig = ModelConfiguration(isStoredInMemoryOnly: true)
//    var container : ModelContainer
//
//    do
//    {
//        container = try ModelContainer(
//            for: SapiPosition.self,
//                    SapiAccount.self
//            , configurations: positionConfig,
//                                accountConfig
//        )
//    }
//    catch
//    {
//        fatalError("Failed to configure SwiftData container.")
//    }
//
//    for i in 1..<10
//    {
//        let position = SapiPosition(symbol: "Sym\(i)", averagePrice: Double(i) )
//        container.mainContext.insert( position )
//        let account = SapiAccount(accountNumber: "100\(i)")
//        container.mainContext.insert( account )
//    }

    return ContentView( schwabClient : schwabClient )
//        .modelContainer( container )

}
