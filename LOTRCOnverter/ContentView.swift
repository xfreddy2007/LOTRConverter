import SwiftUI

struct ContentView: View {
  @State var showExcahngeInfo = false
  @State var leftAmount = ""
  @State var rightAmount = ""
  
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
              Image(.silverpiece)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
              
              // Currency text
              Text("Siver Piece")
                .font(.headline)
                .foregroundStyle(.white)
            }
            .padding(.bottom, -5)
            
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
              Text("Gold Piece")
                .font(.headline)
                .foregroundStyle(.white)
              
              // Currency image
              Image(.goldpiece)
                .resizable()
                .scaledToFit()
                .frame(height: 33)
            }
            .padding(.bottom, -5)
            
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
            print("showExcahngeInfo value: \(showExcahngeInfo)")
          } label: {
            Image(systemName: "info.circle.fill")
              .font(.largeTitle)
              .foregroundStyle(.white)
          }
          .padding(.trailing)
        }
      }
    }
  }
}

#Preview {
    ContentView()
}
