//
//  DigitTemplate.swift
//  BankOCR
//
//  Created by Misael Pérez Chamorro on 18/07/20.
//  Copyright © 2020 Misael Pérez Chamorro. All rights reserved.
//

import Foundation

class DigitTemplate {
  static let sharedInstance = DigitTemplate()
  var cero: Digit
  var one: Digit
  var two: Digit
  var three: Digit
  var four: Digit
  var five: Digit
  var six: Digit
  var seven: Digit
  var eight: Digit
  var nine: Digit

  private init() {
    cero = Digit.cero()
    one = Digit.one()
    two = Digit.two()
    three = Digit.three()
    four = Digit.four()
    five = Digit.five()
    six = Digit.six()
    seven = Digit.seven()
    eight = Digit.eight()
    nine = Digit.nine()
  }
}
