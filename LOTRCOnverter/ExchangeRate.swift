import SwiftUI

struct ExchangeRate: View {
  let leftImgae: ImageResource
  let text: String
  let rightImage: ImageResource
  
  var body: some View {
    HStack {
      // Left currency image
      Image(leftImgae)
        .resizable()
        .scaledToFit()
        .frame(height: 33)
      
      // Excahnge rate text
      Text(text)
      
      // Right currency image
      Image(rightImage)
        .resizable()
        .scaledToFit()
        .frame(height: 33)
    }
  }
}

#Preview {
  ExchangeRate(leftImgae: .silverpiece, text: "1 Silver Piece = 4 Silver Pennies", rightImage: .silverpenny)
}
