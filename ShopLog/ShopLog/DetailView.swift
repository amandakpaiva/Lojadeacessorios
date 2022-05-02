import SwiftUI

struct DetailView: View {
    @Binding var bagData: BagModel!
    @Binding var show: Bool
    var animation: Namespace.ID
    
    // Initialization
    @State var selectedColor = Color.red
    @State var count = 0
    @State var isSmallDevice = UIScreen.main.bounds.height < 750
    
    var body: some View {
        VStack {
            HStack {
                VStack(alignment: .leading, spacing: 5) {
                    Button(action: {
                        withAnimation(.easeOut) {
                            show.toggle()
                        }
                    }) {
                        Image(systemName: "chevron.left")
                            .font(.title)
                            .foregroundColor(.black)
                    }
                    
                    Text("Aristocratic Hand Bag")
                        .fontWeight(.bold)
                        .foregroundColor(.white)
                        .padding(.top)
                    
                    Text(bagData.title)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                }
                
                Spacer(minLength: 0)
                
                Button(action: {}) {
                    Image(systemName: "cart")
                        .font(.title)
                        .foregroundColor(.white)
                }
            }
            .padding()
            .padding(.top, UIApplication
                                .shared
                                .connectedScenes
                                .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                                .first { $0.isKeyWindow }?.safeAreaInsets.top)
            
            HStack(spacing: 10) {
                VStack(alignment: .leading, spacing: 6) {
                    Text("Preço")
                        .fontWeight(.bold)
                        .foregroundColor(.orange)
                    
                    Text(bagData.price)
                        .font(.largeTitle)
                        .fontWeight(.heavy)
                        .foregroundColor(.blue)
                }
                
                Image(bagData.image)
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .matchedGeometryEffect(id: bagData.image, in: animation)
            }
            .padding()
            .padding(.top, 10)
            .zIndex(1)
            
            VStack {
                ScrollView(isSmallDevice ? .vertical : .init(), showsIndicators: false) {
                    HStack {
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Cor")
                                .fontWeight(.bold)
                                .foregroundColor(.gray)
                            
                            HStack(spacing: 15) {
                                ColorButton(color: Color.gray, selectedColor: $selectedColor)
                                
                                ColorButton(color: Color.red, selectedColor: $selectedColor)
                                
                                ColorButton(color: Color.black, selectedColor: $selectedColor)
                            }
                        }
                        
                        Spacer(minLength: 0)
                        
                        VStack(alignment: .leading, spacing: 8) {
                            Text("Tamanho")
                                .fontWeight(.semibold)
                                .foregroundColor(.black)
                            
                            Text("30 cm")
                                .fontWeight(.heavy)
                                .foregroundColor(.black)
                        }
                    }
                    .padding(.horizontal)
                    
                    Text("Bolsa ou mala é um acessório de moda feito de couro, tecido, plástico, palha, ráfia, jeans ou outros materiais, geralmente com alça (curta ou a tiracolo) que serve para carregar diversos pequenos objetos, como dinheiro, chaves, maquiagem, cigarro, isqueiro, documentos, pente, celular, carteira e outros.)
                        .foregroundColor(.gray)
                        .multilineTextAlignment(.leading)
                        .padding()
                    
                    HStack(spacing: 20) {
                        Button(action: {
                            if count > 0 {
                                count -= 1
                            }
                        }) {
                            Image(systemName: "minus")
                                .font(.title2)
                                .foregroundColor(.gray)
                                .frame(width: 35, height: 35)
                                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                        }
                        
                        Text("\(count)")
                            .font(.title2)
                        
                        Button(action: {
                            count += 1
                        }) {
                            Image(systemName: "plus")
                                .font(.title2)
                                .foregroundColor(.gray)
                                .frame(width: 35, height: 35)
                                .background(RoundedRectangle(cornerRadius: 10).stroke(Color.gray, lineWidth: 1))
                        }
                        
                        Spacer()
                        
                        Button(action: {}) {
                            Image(systemName: "suit.heart.fill")
                                .font(.title2)
                                .foregroundColor(.white)
                                .padding(10)
                                .background(Color.red)
                                .clipShape(Circle())
                        }
                    }
                    .padding(.horizontal)
                    
                    Spacer(minLength: 5)
                    
                    Button(action: {}) {
                        Text("COMPRAR")
                            .font(.title2)
                            .fontWeight(.bold)
                            .foregroundColor(.black)
                            .padding(.vertical)
                            .frame(width: UIScreen.main.bounds.width - 30)
                            .background(.green)
                            .clipShape(Capsule())
                    }
                    .padding(.top)
                    .padding(.top, UIApplication
                                        .shared
                                        .connectedScenes
                                        .flatMap { ($0 as? UIWindowScene)?.windows ?? [] }
                                        .first { $0.isKeyWindow }?.safeAreaInsets.top)
                }
                .padding(.top, isSmallDevice ? 0 : -20)
            }
            .background(Color.white
                            .clipShape(CustomCorner())
                            .padding(.top, isSmallDevice ? -60 : -100))
            .zIndex(0)
        }
        .background(Color(bagData.image).ignoresSafeArea(.all, edges: .top))
        .background(Color.white.ignoresSafeArea(.all, edges: .bottom))
        .onAppear {
            // First Color is Image or Bag Color
            selectedColor = Color(bagData.image)
        }
    }
}
