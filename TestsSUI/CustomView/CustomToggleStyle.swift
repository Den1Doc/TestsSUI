import SwiftUI

struct CustomToggleStyle: ToggleStyle {
    var onImage: String
    var offImage: String
    var onColor: Color
    var offColor: Color
    
    init(onImage: String = "checkmark", offImage: String = "xmark", onColor: Color = .green, offColor: Color = .black) {
        self.onImage = onImage
        self.offImage = offImage
        self.onColor = onColor
        self.offColor = offColor
    }
    
    func makeBody(configuration: Configuration) -> some View {
        LabeledContent {
            Capsule()
                .foregroundStyle(configuration.isOn ? onColor : offColor)
                .frame(width: 54, height: 30, alignment: .center)
                .overlay {
                    Circle()
                        .foregroundStyle(.white)
                        .padding(.all, 2)
                        .overlay {
                            Image(systemName: configuration.isOn ?  onImage : offImage)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .font(.title)
                                .fontWeight(.black)
                                .frame(width: 15, height: 15, alignment: .center)
                                .foregroundStyle(configuration.isOn ? onColor : .black)
                                .drawingGroup()
                        }
                        .offset(x: configuration.isOn ? 12 : -12, y: 0)
                        .animation(.bouncy, value: configuration.isOn)
                }
                .onTapGesture {
                    configuration.isOn.toggle()
                }
                .accessibilityAddTraits(.isButton)
        } label: {
            configuration.label
        }
    }
}

