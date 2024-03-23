//
//  ContentView.swift
//  AppConfigSample
//
//  Created by Murilo Ribeiro de Oliveira on 23/03/24.
//

import SwiftUI

struct ContentView: View {

    var body: some View {

        VStack(spacing: 10) {
            Text("Objeto Gerenciado").font(.largeTitle)
            Text(getObject() ?? "Sem objeto gerenciado").font(.title)

        }
    }

     func fetchAppConfig() -> [String: AnyObject] {

           return UserDefaults.standard.dictionary(forKey: "com.apple.configuration.managed") as? [String: AnyObject] ?? [:]
       }

     func getObject() -> (String)? {

        let appConfig = fetchAppConfig()

        guard let managedEndpoint = appConfig["endpoint"] as? String else {
            return nil
        }

        return managedEndpoint
    }
}

#Preview {
    ContentView()
}
