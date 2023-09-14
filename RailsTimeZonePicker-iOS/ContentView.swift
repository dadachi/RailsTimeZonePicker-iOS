//
//  ContentView.swift
//  RailsTimeZonePicker-iOS
//
//  Created by Daisuke Adachi on 2023/09/14.
//

import SwiftUI

struct ContentView: View {
  @State private var selectedTimeZone: String = TimeZoneUtility.currentTimeZone()

  var body: some View {
    VStack {
      Image(systemName: "globe")
        .imageScale(.large)
        .foregroundColor(.accentColor)
      Text("Hello, world!")
      
      Picker(String.timeZone, selection: $selectedTimeZone) {
        ForEach(timeZones.keys, id: \.self) { key in
          Text(timeZones[key]!).tag(key)
        }
      }
    }
    .padding()
  }
}

struct ContentView_Previews: PreviewProvider {
  static var previews: some View {
    ContentView()
  }
}
