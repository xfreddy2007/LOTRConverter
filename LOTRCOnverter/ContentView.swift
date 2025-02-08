import SwiftUI

struct ContentView: View {
  @State var showExcahngeInfo = false
  @State var showSelectCurrency: Bool = false
  
  @State var leftAmount = ""
  @State var rightAmount = ""
  
  @State var leftCurrency: Currency = .silverPiece
  @State var rightCurrency: Currency = .goldPiece
  
  
  var body: some View {
    ZStack {
      // Background image
      Image(.background)
        .resizable()
        .ignoresSafeArea()
      
      VStack {
        // Prancing pony image
        Image(.prancingpony)
          .resizable()
          .scaledToFit()
          .frame(height: 200)
        
        // Currency Exchange text
        Text("Currency Exchange")
          .font(.largeTitle)
          .foregroundStyle(.white)
        
        // Conversion section
        HStack {
          // Left convertion section
          VStack {
            // Currency
            HStack {
              // Currency image
              Image(leftCurrency.image)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
              
              // Currency text
              Text(leftCurrency.name)
                .font(.headline)
                .foregroundStyle(.white)
            }
            .padding(.bottom, -5)
            .onTapGesture {
              showSelectCurrency.toggle()
            }
            
            // Text field
            TextField("Amount", text: $leftAmount)
              .textFieldStyle(.roundedBorder)
          }
          
          // Equal sign
          Image(systemName: "equal")
            .font(.largeTitle)
            .foregroundStyle(.white)
            .symbolEffect(.pulse)
          
          // Right conversion section
          VStack {
            // Currency
            HStack {
              // Currency text
              Text(rightCurrency.name)
                .font(.headline)
                .foregroundStyle(.white)
              
              // Currency image
              Image(rightCurrency.image)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            }
            .padding(.bottom, -5)
            .onTapGesture {
              showSelectCurrency.toggle()
            }
            
            // Text field
            TextField("Amount", text: $rightAmount)
              .textFieldStyle(.roundedBorder)
              .multilineTextAlignment(.trailing)
            
          }
        }
        .padding()
        .background(.black.opacity(0.5))
        .clipShape(.capsule)
        
        Spacer()
        
        // info button
        HStack {
          Spacer()
          Button {
            showExcahngeInfo.toggle()
          } label: {
            Image(systemName: "info.circle.fill")
              .font(.largeTitle)
              .foregroundStyle(.white)
          }
          .padding(.trailing)
          .sheet(isPresented: $showExcahngeInfo) {
            ExchangeInfo()
          }
        }
      }
    }
    .sheet(isPresented: $showExcahngeInfo) {
      ExchangeInfo()
    }
    .sheet(isPresented: $showSelectCurrency) {
      SelectCurrency(topCurrency: $leftCurrency, bottomCurrency: $rightCurrency)
    }
  }
}

#Preview {
    ContentView()
}
