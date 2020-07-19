//
//  DigitParser.swift
//  BankOCR
//
//  Created by Misael Pérez Chamorro on 18/07/20.
//  Copyright © 2020 Misael Pérez Chamorro. All rights reserved.
//

import Foundation

struct DigitParser {
  
  static func digit (line0: [Character],
                      line1: [Character],
                      line2: [Character],
                      offset: Int) -> Digit {
    return Digit(charA: line0[1 + offset],
                charB: line1[2 + offset],
                charC: line2[2 + offset],
                charD: line2[1 + offset],
                charE: line2[0 + offset],
                charF: line1[0 + offset],
                charG: line1[1 + offset])
  }
}
