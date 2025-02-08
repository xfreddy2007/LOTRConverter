import SwiftUI
import TipKit

struct ContentView: View {
  @State var showExcahngeInfo = false
  @State var showSelectCurrency: Bool = false
  
  @State var leftAmount = ""
  @State var rightAmount = ""
  
  @FocusState var leftTyping
  @FocusState var rightTyping
  
  @State var leftCurrency: Currency = .silverPiece
  @State var rightCurrency: Currency = .goldPiece
  
  let currencyTip = CurrencyTip()
  
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
              CurrencyTip().invalidate(reason: .actionPerformed)
            }
            .popoverTip(currencyTip, arrowEdge: .bottom)
            
            // Text field
            TextField("Amount", text: $leftAmount)
              .textFieldStyle(.roundedBorder)
              .focused($leftTyping)
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
              CurrencyTip().invalidate(reason: .actionPerformed)
            }
            
            // Text field
            TextField("Amount", text: $rightAmount)
              .textFieldStyle(.roundedBorder)
              .multilineTextAlignment(.trailing)
              .focused($rightTyping)
              
          }
        }
        .padding()
        .background(.black.opacity(0.5))
        .clipShape(.capsule)
        .keyboardType(.decimalPad)
        
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
    .task {
      try? Tips.configure()
    }
    .onChange(of: leftAmount) {
      if leftTyping {
        rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
      }
    }
    .onChange(of: rightAmount) {
      if rightTyping {
        leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
      }
    }
    .onChange(of: leftCurrency) {
      leftAmount = rightCurrency.convert(rightAmount, to: leftCurrency)
    }
    .onChange(of: rightCurrency) {
      rightAmount = leftCurrency.convert(leftAmount, to: rightCurrency)
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
