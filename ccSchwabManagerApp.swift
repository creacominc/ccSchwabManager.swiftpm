//
//  ccSchwabManagerApp.swift
//  ccSchwabManager
//
//  Created by Harold Tomlinson on 2024-12-21.
//

import SwiftUI
//import SwiftData

@main
struct ccSchwabManagerApp: App
{
    @State private var appState : AppState = .Initial
    private var schwabClient : SchwabClient = SchwabClient( secrets: loadSecrets() )


    //    var sharedModelContainer: ModelContainer =
    //    {
    //        let schema = Schema([
    //            Account.self,
    //        ])
    //        let modelConfiguration = ModelConfiguration( schema: schema, isStoredInMemoryOnly: false )
    //
    //        do
    //        {
    //            return try ModelContainer( for: schema, configurations: [modelConfiguration] )
    //        }
    //        catch
    //        {
    //            fatalError("Could not create ModelContainer: \(error)")
    //        }
    //    }()
    //
    //    var body: some Scene
    //    {
    //        WindowGroup
    //        {
    //            ContentView()
    //        }
    //        .modelContainer(sharedModelContainer)
    //    }
    
    var body: some Scene
    {
        WindowGroup
        {
            SecretsView(schwabClient: schwabClient, appState: $appState)
            //ContentView( schwabClient: schwabClient )
        }
        .modelContainer( for: SapiPosition.self )
    }
}


