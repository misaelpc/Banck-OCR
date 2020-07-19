//
//  BankOcr.swift
//  BankOCR
//
//  Created by Misael Pérez Chamorro on 18/07/20.
//  Copyright © 2020 Misael Pérez Chamorro. All rights reserved.
//

import Foundation
import Cocoa

struct BankOcr {
  
  static func validateAccounts() {
    let fileText = readFile()
    let numbersLines = parseFile(text: fileText)
    let accounts = readAccounts(numbersLines: numbersLines)
    generateReport(lineDigits: accounts)
  }
  
  static func generateReport(lineDigits: [[Int]]) {
    for lineDigit in lineDigits {
      var reportLine = ""
      var illegible: [Bool] = []
      var lineSum = 0
      for (n, digit) in lineDigit.enumerated() {
        if digit == -1 {
          reportLine.append("?")
          illegible.append(false)
        } else {
          reportLine.append("\(digit)")
          illegible.append(true)
          let value = ((n + 1) * lineDigit[(lineDigit.count - 1) - n])
          lineSum += value
        }
      }
      if illegible.contains(false) {
        print(reportLine + " " + "ILL")
      } else {
        if lineSum % 11 == 0 {
          print(reportLine + " " + "OK")
        } else {
          print(reportLine + " " + "ERR")
        }
      }
    }
  }
  
  static func validateCheckSum(lineDigits: [[Int]]) {
    
  }

  static func readAccounts(numbersLines: [[String.SubSequence]]) -> [[Int]] {
    var lineDigits: [[Int]] = []
    for numberLine in numbersLines {
      var digits: [Int] = []
      let line0 = Array(numberLine[0])
      let line1 = Array(numberLine[1])
      let line2 = Array(numberLine[2])
      for n in 0..<27 {
        if n % 3 == 0 {
          let digit = DigitParser.digit(line0: line0, line1: line1, line2: line2, offset: n)
          digits.append(digit.transform())
        }
      }
      lineDigits.append(digits)
    }
    return lineDigits
  }
  
  static func parseFile(text: String) -> [[String.SubSequence]]  {
    let ocrRawArray = text.split(separator: "\n") as Array
    let numbersLines = ocrRawArray.chunked(into: 4)
    return numbersLines
  }
  
  static func readFile() -> String {
    let currentDirectoryURL = URL(fileURLWithPath: FileManager.default.currentDirectoryPath)
    let bundleURL = URL(fileURLWithPath: "resources.bundle", relativeTo: currentDirectoryURL)
    let bundle = Bundle(url: bundleURL)
    let txtFileURL = bundle!.url(forResource: "accounts", withExtension: "txt")!
    let ocrText = try! String(contentsOf: txtFileURL, encoding: .utf8)
    return ocrText
  }
}

extension Array {
    func chunked(into size: Int) -> [[Element]] {
        return stride(from: 0, to: count, by: size).map {
            Array(self[$0 ..< Swift.min($0 + size, count)])
        }
    }
}
