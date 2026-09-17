import SwiftUI

struct ContentView: View {
    var studentName = "Nguyen Van A"
    var studentID = "SESEIU24000"
    var gpa = 9.9

    var body: some View {
        GeometryReader { geometry in
            ZStack {
                
                // MARK: - Background
                Image("pica")
                    .resizable()
                    .scaledToFill()
                    .frame(
                        width: geometry.size.width,
                        height: geometry.size.height
                    )
                    .clipped()
                    .ignoresSafeArea()

                
                // MARK: - Student Card
                HStack(spacing: 10) {
                    
                    // MARK: Avatar
                    Image("ava")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 90, height: 90)
                        .clipShape(Circle())
                    
                    
                    // MARK: Information
                    VStack(alignment: .leading, spacing: 5) {
                        
                        Text(studentName)
                            .font(.system(size: 22, weight: .bold))
                            .lineLimit(1)
                        
                        HStack(spacing: 6) {
                            Text("Student ID:")
                            
                            Text(studentID)
                        }
                        .font(.system(size: 15))
                        
                        HStack(spacing: 6) {
                            Image(systemName: "chart.bar.fill")
                                .foregroundColor(.blue)
                            
                            Text("GPA:")
                                .bold()
                            
                            Text("\(gpa)")
                        }
                        .font(.system(size: 15))
                    }
                    
                    Spacer(minLength: 0)
                }
                .padding(.horizontal, 20)
                .padding(.vertical, 18)
                
                // MARK: Card Background
                .background(
                    Color.white.opacity(0.4)
                )
                
                .clipShape(
                    RoundedRectangle(cornerRadius: 25)
                )
                
                // MARK: Card Border
                .overlay(
                    RoundedRectangle(cornerRadius: 25)
                        .stroke(
                            Color.white.opacity(0.25),
                            lineWidth: 1
                        )
                )
                
                // MARK: Active
                .overlay(
                    Text("Active")
                        .font(
                            .system(
                                size: 13,
                                weight: .medium
                            )
                        )
                        .foregroundColor(.green)
                        .padding(.horizontal, 10)
                        .padding(.vertical, 5)
                        .background(
                            Color.green.opacity(0.15)
                        )
                        .clipShape(
                            RoundedRectangle(
                                cornerRadius: 10
                            )
                        )
                        // Đẩy Active lên trên
                        .padding(.top, 5)
                        .padding(.trailing, 15),
                    alignment: .topTrailing
                )
                
                // MARK: Card Position
                .frame(
                    width: geometry.size.width - 40
                )
                .position(
                    x: geometry.size.width / 2,
                    y: geometry.size.height * 0.40
                )
            }
        }
        .ignoresSafeArea()
    }
}


#Preview {
    ContentView()
}
