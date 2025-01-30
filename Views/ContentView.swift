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

    @State private var appState : AppState = .Initial

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
            switch appState 
            {
            case AppState.Initial:
                SecretsView( schwabClient: self.schwabClient, appState: $appState )

            case AppState.Authorizing:
                AuthorizeView( schwabClient: self.schwabClient, appState: $appState )

            case AppState.Working:
                WorkflowButtonsView()
                AccountsView( schwabClient: self.schwabClient )
                SecurityListView()

//            case AppState.FetchData:
//                self.schwabClient.fetchData()


            default:
               Text( " 123")    
            }
            // put a reset button at the bottom - will likely remova later
            Button( "reset" )
            {
                appState = .Initial
            }
        }
    }

}

#Preview
{
    let schwabClient : SchwabClient = SchwabClient( secrets: loadSecrets() )

    // fake accounts information for preview
    schwabClient.secrets.accountNumbers = ["*7890", "*6789"]

    // fake account list
    let config = ModelConfiguration(isStoredInMemoryOnly: true)
    let container = try! ModelContainer(for: SapiPosition.self, configurations: config)
    let sampleHoldings : [String] = [ "AAPL", "GOLD", "ACHR", "AVGO", "NVDA", "SOUN", "RKLB", "NNE" ]
    for i in 1..<8 {
        let position = SapiPosition(symbol: sampleHoldings[i], averagePrice: Double(i) )
        container.mainContext.insert( position )
    }

    return ContentView( schwabClient : schwabClient )
        .modelContainer( container )

}
