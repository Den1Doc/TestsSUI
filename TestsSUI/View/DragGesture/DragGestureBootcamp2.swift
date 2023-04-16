import SwiftUI

struct DragGestureBootcamp2: View {
    
    @State var startOffsetY: CGFloat = UIScreen.main.bounds.height * 0.85
    @State var currentOffsetY: CGFloat = 0
    @State var endOffsetY: CGFloat = 0
    
    var body: some View {
        
        ZStack {
            Color.green.ignoresSafeArea()
            
            
            MySingUpView()
                .offset(y: startOffsetY)
                .offset(y: currentOffsetY)
                .offset(y: endOffsetY)
                .gesture(
                    DragGesture()
                        .onChanged{ value in
                            withAnimation(.spring()) {
                                currentOffsetY = value.translation.height
                            }
                        }
                        .onEnded({ value in
                            withAnimation(.spring()) {
                                if currentOffsetY < -150 {
                                    endOffsetY = -startOffsetY
                                } else if endOffsetY != 0  && currentOffsetY > 150 {
                                 endOffsetY = 30
                                }
                                currentOffsetY = 0
                                
                            }
                            
                        })
                )
            
        }
        .ignoresSafeArea(edges: .bottom)
        
    }
}

struct DragGestureBootcamp2_Previews: PreviewProvider {
    static var previews: some View {
        DragGestureBootcamp2()
    }
}



struct MySingUpView: View {
    var body: some View {
        VStack(spacing: 20) {
            Image(systemName: "chevron.up")
                .padding(.top)
            Text("Sing up")
                .font(.headline)
                .fontWeight(.semibold)
            
            Image(systemName: "flame.fill")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
            
            Text("Hello world!")
            
            Text("Greate an account")
                .foregroundColor(.white)
                .font(.headline)
                .padding()
                .padding(.horizontal)
                .background(Color.black.cornerRadius(10))
            Spacer()
        }
        .frame(maxWidth: .infinity)
        .background(.white)
        .cornerRadius(30)
    }
}
