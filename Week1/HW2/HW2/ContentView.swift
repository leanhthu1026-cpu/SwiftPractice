import SwiftUI

struct ContentView: View {
    var body: some View {
        ZStack(alignment: .top) {
            
            // 1. Background full tràn viền lên tận cùng màn hình
            Image("pica")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: 300)
                .clipped()
                .ignoresSafeArea()

            VStack(spacing: 0) {

                // MARK: - Main Content
                ScrollView(.vertical, showsIndicators: false) {
                    VStack(spacing: 0) {

                        HeaderView()

                        // Student information (Đã bỏ khung 30%)
                        StudentInfoView()
                            .padding(.top, 50)

                        // Quote Card
                        QuoteCardView()

                        // Edit Profile Button
                        Button(action: {
                            print("Edit Profile tapped")
                        }) {
                            HStack(spacing: 8) {
                                Image(systemName: "paperplane")
                                    .font(.system(size: 15))

                                Text("Edit Profile")
                                    .font(.system(size: 16, weight: .semibold))
                            }
                            .foregroundColor(.white)
                            .frame(maxWidth: .infinity)
                            .frame(height: 50)
                            .background(
                                LinearGradient(
                                    colors: [
                                        Color(red: 0.35, green: 0.70, blue: 0.61),
                                        Color(red: 0.27, green: 0.65, blue: 0.57)
                                    ],
                                    startPoint: .leading,
                                    endPoint: .trailing
                                )
                            )
                            .clipShape(
                                RoundedRectangle(cornerRadius: 18)
                            )
                        }
                        .buttonStyle(.plain)
                        .padding(.horizontal, 20)
                        .padding(.top, 24)
                        .padding(.bottom, 30)
                    }
                }

                // MARK: - Bottom tabs
                BottomTabBar()
            }
        }
    }
}


// MARK: - Header

struct HeaderView: View {

    var body: some View {
        ZStack(alignment: .top) {

            // Khoảng trống giữ chỗ tương ứng để nội dung bên trong không bị che khuất quá sâu vào ảnh nền
            Color.clear
                .frame(height: 240)

            // Nút Setting ở góc trên phải
            VStack {
                HStack {
                    Spacer()

                    Image(systemName: "gearshape.fill")
                        .font(.system(size: 17))
                        .foregroundColor(.gray)
                        .frame(width: 40, height: 40)
                        .background(
                            Color.white.opacity(0.80)
                        )
                        .clipShape(Circle())
                }
                .padding(.horizontal, 22)
                .padding(.top, 18)

                Spacer()
            }

            // Avatar + Name + Quote (Không còn khung bao ngoài 30%)
            VStack(spacing: 0) {

                // Avatar
                ZStack {
                    Circle()
                        .fill(Color.white)
                        .frame(width: 112, height: 112)

                    Image("ava")
                        .resizable()
                        .scaledToFill()
                        .frame(width: 100, height: 100)
                        .clipShape(Circle())
                }
                .shadow(
                    color: Color.black.opacity(0.15),
                    radius: 6,
                    x: 0,
                    y: 3
                )

                // Name + Quote
                VStack(spacing: 4) {
                    Text("Nguyen Van A")
                        .font(.system(size: 20, weight: .bold))
                        .foregroundColor(.primary)

                    Text("Always learning, always growing ♡")
                        .font(.system(size: 12))
                        .foregroundColor(.gray)
                }
                .padding(.top, 8)
            }
            .padding(.top, 170)
        }
        .zIndex(10)
    }
}


// MARK: - Student Info

struct StudentInfoView: View {

    var body: some View {

        VStack(spacing: 12) {

            // Row 1
            HStack(spacing: 12) {

                InfoCard(
                    icon: "person.fill",
                    iconColor: .blue,
                    title: "Student ID",
                    value: "SESEIU24024",
                    background: Color.blue.opacity(0.10)
                )

                InfoCard(
                    icon: "birthday.cake.fill",
                    iconColor: .pink,
                    title: "Age",
                    value: "18",
                    background: Color.pink.opacity(0.10)
                )
            }

            // Row 2
            HStack(spacing: 12) {

                InfoCard(
                    icon: "chart.bar.fill",
                    iconColor: .green,
                    title: "GPA",
                    value: "8.5",
                    background: Color.green.opacity(0.10)
                )

                InfoCard(
                    icon: "graduationcap.fill",
                    iconColor: .purple,
                    title: "Student",
                    value: "true",
                    background: Color.purple.opacity(0.10)
                )
            }
        }
        .padding(.horizontal, 20)
    }
}


// MARK: - Info Card

struct InfoCard: View {

    let icon: String
    let iconColor: Color
    let title: String
    let value: String
    let background: Color

    var body: some View {

        HStack(spacing: 11) {

            Image(systemName: icon)
                .font(.system(size: 22, weight: .medium))
                .foregroundColor(iconColor)
                .frame(width: 30, height: 30)

            VStack(alignment: .leading, spacing: 3) {
                Text(title)
                    .font(.system(size: 11))
                    .foregroundColor(.gray)

                Text(value)
                    .font(.system(size: 14, weight: .semibold))
                    .foregroundColor(.primary)
            }

            Spacer(minLength: 0)
        }
        .padding(.horizontal, 13)
        .padding(.vertical, 10)
        .frame(maxWidth: .infinity, minHeight: 70, maxHeight: 70)
        .background(background)
        .clipShape(
            RoundedRectangle(
                cornerRadius: 16,
                style: .continuous
            )
        )
    }
}


// MARK: - Quote Card

struct QuoteCardView: View {
    var body: some View {
        HStack(alignment: .center, spacing: 12) {
            Text("❝")
                .font(.system(size: 28, weight: .bold))
                .foregroundColor(Color.orange.opacity(0.8))
            
            Text("      \"Better me, a brighter tomorrow!\"")
                .font(.system(size: 13, weight: .medium))
                .foregroundColor(Color.primary.opacity(0.8))
            
            Spacer(minLength: 0)
            
            Image(systemName: "leaf.fill")
                .foregroundColor(.green.opacity(0.7))
                .font(.system(size: 14))
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 14)
        .background(Color.orange.opacity(0.08))
        .clipShape(RoundedRectangle(cornerRadius: 16, style: .continuous))
        .padding(.horizontal, 20)
        .padding(.top, 12)
    }
}


// MARK: - Bottom Tab Bar

struct BottomTabBar: View {

    @State private var selectedTab = 0

    let tabs = [
        ("house.fill", "Profile"),
        ("book.closed.fill", "Subjects"),
        ("gearshape.fill", "Settings")
    ]

    var body: some View {

        HStack(spacing: 0) {
            ForEach(0..<tabs.count, id: \.self) { index in
                Button {
                    selectedTab = index
                } label: {
                    VStack(spacing: 5) {
                        Image(systemName: tabs[index].0)
                            .font(.system(size: 18, weight: .medium))

                        Text(tabs[index].1)
                            .font(.system(size: 10))
                    }
                    .foregroundColor(
                        selectedTab == index
                        ? Color(red: 0.20, green: 0.58, blue: 0.51)
                        : Color.gray.opacity(0.65)
                    )
                    .frame(maxWidth: .infinity)
                }
                .buttonStyle(.plain)
            }
        }
        .padding(.top, 10)
        .padding(.bottom, 8)
        .background(Color.white)
        .shadow(
            color: Color.black.opacity(0.08),
            radius: 8,
            x: 0,
            y: -3
        )
    }
}


// MARK: - Preview

#Preview {
    ContentView()
}
