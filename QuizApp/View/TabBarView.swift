import SwiftUI

struct CustomTabBarView: View {
    @EnvironmentObject var quizData: QuizData
    @State private var selectedIndex: Int = 1
    
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                // Main Content
                Group {
                    switch selectedIndex {
                    case 0:
                        NavigationStack {
                            Text("Profile view")
                                .navigationTitle("Profile")
                        }
                    case 1:
                        NavigationStack {
                            HomeView().environmentObject(quizData)
                        }
                    case 2:
                        NavigationStack {
                            Text("About view")
                                .navigationTitle("About")
                        }
                    default:
                        Text("Home")
                    }
                }
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                
                // Custom Tab Bar
                CustomTabBar(selectedIndex: $selectedIndex)
            }
        }
        .edgesIgnoringSafeArea(.bottom)
    }
}

struct CustomTabBar: View {
    @Binding var selectedIndex: Int
    var firstColor : Color = Color(hex: "#E8A2A2")
    var secoundColor : Color = Color(hex: "#D5A8CA")
    
    var body: some View {
        ZStack {
            // Background for the TabBar
            HStack {
                Spacer()
                tabBarButton(icon: "person.fill", text: "Profile", index: 0)
                Spacer()
                Spacer() // Space for the middle button
                Spacer()
                tabBarButton(icon: "info.circle", text: "About", index: 2)
                Spacer()
            }
            .frame(height: 70)
            .background(
                Color(.systemGray6)
                    .shadow(color: .black.opacity(0.1), radius: 10, x: 0, y: -5)
            )
            
            // Floating Center Button
            VStack {
                Button(action: {
                    withAnimation(.spring()) {
                        selectedIndex = 1
                    }
                }) {
                    ZStack {
                        Circle()
                            .fill(
                                LinearGradient(
                                    gradient: Gradient(colors: [firstColor, secoundColor]),
                                    startPoint: .top,
                                    endPoint: .bottom
                                )
                            )
                            .frame(width: 70, height: 70)
                            .shadow(color: .black.opacity(0.25), radius: 10, x: 0, y: 5)
                        
                        Image("MiddelIconTab", bundle: nil)
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 70)
                    }
                }
                .offset(y: -35) // Floating effect
            }
        }
    }
    
    private func tabBarButton(icon: String, text: String, index: Int) -> some View {
        Button(action: {
            withAnimation(.spring()) {
                selectedIndex = index
            }
        }) {
            VStack {
                Image(systemName: icon)
                    .font(.system(size: 24))
                Text(text)
                    .font(.caption)
            }
            .foregroundColor(selectedIndex == index ? .pink : .gray)
        }
        .navigationBarBackButtonHidden()
    }
}

#Preview {
    CustomTabBarView()
}
