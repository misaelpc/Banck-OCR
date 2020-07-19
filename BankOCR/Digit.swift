//
//  Digit.swift
//  BankOCR
//
//  Created by Misael Pérez Chamorro on 18/07/20.
//  Copyright © 2020 Misael Pérez Chamorro. All rights reserved.
//

import Foundation

struct Digit: Equatable {
  var segmentA: Bool = false
  var segmentB: Bool = false
  var segmentC: Bool = false
  var segmentD: Bool = false
  var segmentE: Bool = false
  var segmentF: Bool = false
  var segmentG: Bool = false
  
  init(charA: Character, charB: Character,
       charC: Character, charD: Character,
       charE: Character, charF: Character, charG: Character) {
    if charA != " " {
      segmentA = true
    }
    if charB != " " {
      segmentB = true
    }
    if charC != " " {
      segmentC = true
    }
    if charD != " " {
      segmentD = true
    }
    if charE != " " {
      segmentE = true
    }
    if charF != " " {
      segmentF = true
    }
    if charG != " " {
      segmentG = true
    }
  }
  
  static func cero() -> Digit {
    Digit(charA: "_",
          charB: "|",
          charC: "|",
          charD: "_",
          charE: "|",
          charF: "|",
          charG: " ")
  }
  
  static func one() -> Digit {
    Digit(charA: " ",
          charB: "|",
          charC: "|",
          charD: " ",
          charE: " ",
          charF: " ",
          charG: " ")
  }
  
  static func two() -> Digit {
    Digit(charA: "_",
          charB: "|",
          charC: " ",
          charD: "_",
          charE: "|",
          charF: " ",
          charG: "_")
  }
  
  static func three() -> Digit {
    Digit(charA: "_",
          charB: "|",
          charC: "|",
          charD: "_",
          charE: " ",
          charF: " ",
          charG: "_")
  }
  
  static func four() -> Digit {
    Digit(charA: " ",
          charB: "|",
          charC: "|",
          charD: " ",
          charE: " ",
          charF: "|",
          charG: "_")
  }
  
  static func five() -> Digit {
    Digit(charA: "_",
          charB: " ",
          charC: "|",
          charD: "_",
          charE: " ",
          charF: "|",
          charG: "_")
  }
  
  static func six() -> Digit {
    Digit(charA: "_",
          charB: " ",
          charC: "|",
          charD: "_",
          charE: "|",
          charF: "|",
          charG: "_")
  }
  
  static func seven() -> Digit {
    Digit(charA: "_",
          charB: "|",
          charC: "|",
          charD: " ",
          charE: " ",
          charF: " ",
          charG: " ")
  }
  
  static func eight() -> Digit {
    Digit(charA: "_",
          charB: "|",
          charC: "|",
          charD: "_",
          charE: "|",
          charF: "|",
          charG: "_")
  }
  
  static func nine() -> Digit {
    Digit(charA: "_",
          charB: "|",
          charC: "|",
          charD: "_",
          charE: " ",
          charF: "|",
          charG: "_")
  }
  
  func transform() -> Int {
    let template = DigitTemplate.sharedInstance
    switch self {
    case template.cero:
      return 0
    case template.one:
      return 1
    case template.two:
      return 2
    case template.three:
      return 3
    case template.four:
      return 4
    case template.five:
      return 5
    case template.six:
      return 6
    case template.seven:
      return 7
    case template.eight:
      return 8
    case template.nine:
      return 9
    default:
      return -1
    }
  }
}
