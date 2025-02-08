import SwiftUI

enum Currency: Double, CaseIterable, Identifiable {
  case copperPenny = 6400
  case sivlerPenny = 64
  case silverPiece = 16
  case goldPenny = 4
  case goldPiece = 1
  
  var id: Currency { self }
  
  var image: ImageResource {
    switch self {
      case .copperPenny:
          .copperpenny
      case .sivlerPenny:
          .silverpenny
      case .silverPiece:
          .silverpiece
      case .goldPenny:
          .goldpenny
      case .goldPiece:
          .goldpiece
    }
  }
  
  var name : String {
    switch self {
      case .copperPenny:
        "Copper Penny"
      case .sivlerPenny:
        "Silver Penny"
      case .silverPiece:
        "Silver Piece"
      case .goldPenny:
        "Gold Penny"
      case .goldPiece:
        "Gold Piece"
    }
  }
  
  func convert(_ amountString: String, to currency: Currency) -> String {
    guard let doubleAmount = Double(amountString) else {
      return ""
    }
    
    let convertedAmount = (doubleAmount / self.rawValue) * currency.rawValue
    
    return String(format:  "%.2f", convertedAmount)
  }
}
