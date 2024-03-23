//
//  ContentView.swift
//  AppConfigSample
//
//  Created by Murilo Ribeiro de Oliveira on 23/03/24.
//

import SwiftUI

struct ContentView: View {

    var managedObject: String? {
        fetchManagedObject()
    }

    var body: some View {
        VStack(spacing: 10) {
            Text("Objeto Gerenciado")
                .font(.largeTitle)

            if let object = managedObject {
                Text(object)
                    .font(.title)
            } else {
                Text("Sem objeto gerenciado")
                    .font(.title)
            }
        }
    }

    private func fetchAppConfig() -> [String: AnyObject] {
        return UserDefaults.standard.dictionary(forKey: "com.apple.configuration.managed") as? [String: AnyObject] ?? [:]
    }

    private func fetchManagedObject() -> String? {
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
