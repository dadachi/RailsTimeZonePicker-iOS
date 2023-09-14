//
//  TimeZoneUtility.swift
//  RailsTimeZonePicker-iOS
//
//  Created by Daisuke Adachi on 2023/09/14.
//

import Foundation

class TimeZoneUtility {
  static func currentTimeZone() -> String {
    let defaultTimeZone = String.defaultTimeZone
    let timeZoneHourFormatted = currentTimeZoneHourFormatted()
    
    let timeZoneArray = TimeZone.current.identifier.components(separatedBy: "/")

    if timeZoneArray.isEmpty || timeZoneArray.count != 2 {
      if let timeZone = timeZones.first(where: { $0.value.contains(timeZoneHourFormatted) }) {
        return timeZone.key
      }
    }
    
    if timeZoneArray.isEmpty {
      return defaultTimeZone
    }
    
    let timeZoneKey: String = timeZoneArray[1]

    if let timeZone = timeZones.first(where: { $0.key.contains(timeZoneKey) && $0.value.contains(timeZoneHourFormatted) }) {
      return timeZone.key
    }

    if let timeZone = timeZones.first(where: { $0.value.contains(timeZoneHourFormatted) }) {
      return timeZone.key
    }

    return defaultTimeZone
  }

  private static func currentTimeZoneHour() -> (Int, Int) {
    let secondsFromGmt: Int = TimeZone.current.secondsFromGMT()
    let hoursFromGmt = (secondsFromGmt / 3600)
    let minutesFromGmt = (abs(secondsFromGmt/60) % 60)
    return (hoursFromGmt, minutesFromGmt)
  }

  private static func currentTimeZoneHourFormatted() -> String {
    let (timeZoneHour, timeZoneMinute) = currentTimeZoneHour()
    let timeZoneHourStringZeroPadding = String(format: "%+.2d:%.2d", timeZoneHour, timeZoneMinute)
    return "(GMT\(timeZoneHourStringZeroPadding))"
  }
}
