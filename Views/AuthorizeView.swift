//
//  AuthorizeView.swift
//  ccSchwabManager
//
//  Created by Harold Tomlinson on 2025-01-10.
//

import SwiftUI

struct AuthorizeView: View
{
    @Environment(\.dismiss) var dismiss

    @State private var schwabClient : SchwabClient
    @Binding var appState: AppState

    @State var foo: String = ""

    @State private var resultantUrl: String = ""
    @State private var authenticateButtonUrl: URL = URL( string: "https://localhost" )!
    @State private var authenticateButtonEnabled: Bool = false
    @State private var authenticateButtonTitle: String = "Click to Authorize"
    @State private var nextButtonEnabled: Bool = false

    init( schwabClient: SchwabClient, appState: Binding<AppState> )
    {
        self.schwabClient = schwabClient
        self._appState = appState
    }

    var body: some View
    {

        VStack
        {
            Link( authenticateButtonTitle
                  , destination: authenticateButtonUrl )
            .disabled( !authenticateButtonEnabled )
            .opacity( !authenticateButtonEnabled ? 0 : 1 )
            .onAppear
            {
                self.schwabClient.getAuthenticationUrl
                { (result : Result< URL, ErrorCodes>) in

                    switch result
                    {
                    case .success( let url ):
                        print( "Authentication URL: \(url.absoluteString)" )
                        authenticateButtonEnabled = true
                        authenticateButtonUrl = url
                    case .failure(let error):
                        print("Authentication failed: \(error)")
                    }

                }
            }

            TextField( "After authorization, paste URL here.", text: $resultantUrl )
                .autocorrectionDisabled()
                .autocapitalization(.none)
                .onChange( of: resultantUrl )
                {
                    print( "OnChange URL: \( resultantUrl )" )
                    nextButtonEnabled = true
                }

            Button( "Next" )
            {
                self.schwabClient.getAccessToken( from: resultantUrl )
                { (result : Result< Void, ErrorCodes>) in
                    switch result
                    {
                    case .success( ):
                        appState = AppState.Working
                    case .failure(let error):
                        print("getAccessToken error: \(error)")
                        print("getAccessToken localized error: \(error.localizedDescription)")
                        appState = AppState.Working  /** @TODO:  REMOVE - authorization failed. */
                        print( "!!!! REMOVE - authorization failed but marking app as working to enable further development." )
                    }
                }
            }
            .disabled( !nextButtonEnabled )
        }

    }
}

#Preview
{
    @Previewable  
    @State  var appState : AppState = .Initial
    let schwabClient = SchwabClient( secrets: loadSecrets() )
    return AuthorizeView( schwabClient : schwabClient, appState : $appState )
}
