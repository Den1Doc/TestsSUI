import SwiftUI

struct VariableValuesWIthSFSymbols: View {
    @State private var value: Double = 0.0
    var body: some View {
        VStack {
            HStack {
                Image(systemName: "aqi.low", variableValue: value)
                Image(systemName: "wifi", variableValue: value)
                Image(systemName: "chart.bar.fill", variableValue: value)
                Image(systemName: "waveform", variableValue: value)
            }
            
            Slider(value: $value)
        }
        .font(.system(size: 64))
        .foregroundColor(.blue)
        .padding()
    }
}

struct VariableValuesWIthSFSymbols_Previews: PreviewProvider {
    static var previews: some View {
        VariableValuesWIthSFSymbols()
    }
}
