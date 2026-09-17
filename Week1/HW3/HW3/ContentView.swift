import SwiftUI

// MARK: - 1. Model (Data to Use)
struct TaskItem: Identifiable {
    let id = UUID()
    var title: String
    var category: String
    var isCompleted: Bool
    var time: String
    var iconName: String
    var badgeColor: Color
}

// MARK: - 2. Main View
struct ContentView: View {
    // State lưu trữ danh sách tasks
    @State private var tasks: [TaskItem] = [
        TaskItem(title: "Read chapter 2", category: "Study", isCompleted: false, time: "09:00", iconName: "book.fill", badgeColor: .blue.opacity(0.15)),
        TaskItem(title: "Workout", category: "Health", isCompleted: true, time: "17:00", iconName: "figure.run", badgeColor: .pink.opacity(0.15)),
        TaskItem(title: "Finish lab report", category: "Work", isCompleted: false, time: "20:00", iconName: "laptopcomputer", badgeColor: .orange.opacity(0.15)),
        TaskItem(title: "Call family", category: "Personal", isCompleted: false, time: "21:00", iconName: "person.2.fill", badgeColor: .green.opacity(0.15))
    ]
    
    // State quản lý việc hiển thị modal thêm Task
    @State private var showingAddTaskSheet = false
    @State private var selectedTab = 0

    var body: some View {
        VStack(spacing: 0) {
            // Main Scrollable Content (VStack)
            ScrollView(showsIndicators: false) {
                VStack(spacing: 18) {
                    // Header với ZStack chứa ảnh nền "pica"
                    headerSection
                    
                    // Date & Daily Note Card
                    dateAndQuoteBanner
                    
                    // Action Header (My Tasks + Add Task Button)
                    taskHeaderBar
                    
                    // List of Tasks
                    taskListSection
                }
                .padding(.bottom, 24)
            }
            
            // Bottom Tab Navigation Bar
            bottomTabBar
        }
        .background(Color(UIColor.systemGroupedBackground).ignoresSafeArea())
        .sheet(isPresented: $showingAddTaskSheet) {
            AddTaskSheet { newTask in
                tasks.append(newTask)
            }
        }
    }
}

// MARK: - Subviews & Components
private extension ContentView {
    
    // 1. ZStack Header: Đã bỏ "Good Morning,", thêm ảnh nền "pica"
    var headerSection: some View {
        ZStack(alignment: .leading) {
            // Background Image "pica" kèm lớp phủ mờ để tôn chữ
            Image("pica")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity)
                .frame(height: 140)
                .overlay(Color.black.opacity(0.25))
                .clipShape(RoundedRectangle(cornerRadius: 24))
            
            HStack {
                VStack(alignment: .leading, spacing: 6) {
                    HStack(spacing: 6) {
                        Text("Nguyen Van A")
                            .font(.system(size: 24, weight: .bold))
                            .foregroundColor(.white)
                    }
                    
                    Text("\"Discipline today creates a brighter tomorrow.\"")
                        .font(.footnote)
                        .italic()
                        .foregroundColor(.white.opacity(0.9))
                        .padding(.top, 2)
                }
                
                Spacer()
                
                Image(systemName: "sun.max.fill")
                    .font(.system(size: 34))
                    .foregroundColor(.yellow)
            }
            .padding(.horizontal, 20)
        }
        .padding(.horizontal, 16)
        .padding(.top, 8)
    }
    
    // 2. HStack Banner: Lịch ngày & Motivational card
    var dateAndQuoteBanner: some View {
        HStack(spacing: 12) {
            // Khung hiển thị Ngày tháng
            HStack(spacing: 12) {
                Image(systemName: "calendar")
                    .font(.title2)
                    .foregroundColor(.blue)
                
                VStack(alignment: .leading, spacing: 2) {
                    Text("Mon")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                    Text("8")
                        .font(.headline)
                        .bold()
                    Text("Sep 2026")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: .black.opacity(0.04), radius: 6, x: 0, y: 3)
            
            // Khung New Day
            HStack(spacing: 10) {
                Image(systemName: "sparkles")
                    .foregroundColor(.orange)
                VStack(alignment: .leading, spacing: 2) {
                    Text("New day")
                        .font(.subheadline)
                        .fontWeight(.semibold)
                    Text("New opportunities!")
                        .font(.caption2)
                        .foregroundColor(.secondary)
                }
                Spacer()
            }
            .padding(.vertical, 12)
            .padding(.horizontal, 16)
            .background(Color.white)
            .cornerRadius(16)
            .shadow(color: .black.opacity(0.04), radius: 6, x: 0, y: 3)
        }
        .padding(.horizontal, 16)
    }
    
    // 3. HStack Tiêu đề danh sách & Nút Add Task
    var taskHeaderBar: some View {
        HStack {
            HStack(spacing: 8) {
                Image(systemName: "list.bullet.clipboard.fill")
                    .foregroundColor(.blue)
                Text("My Tasks")
                    .font(.title3)
                    .fontWeight(.bold)
            }
            
            Spacer()
            
            Button {
                showingAddTaskSheet = true
            } label: {
                Label("Add Task", systemImage: "plus")
                    .font(.subheadline)
                    .fontWeight(.semibold)
                    .foregroundColor(.white)
                    .padding(.horizontal, 14)
                    .padding(.vertical, 8)
                    .background(Color.green)
                    .cornerRadius(20)
            }
        }
        .padding(.horizontal, 16)
    }
    
    // 4. Danh sách các hàng Task (Task Row)
    var taskListSection: some View {
        VStack(spacing: 10) {
            ForEach($tasks) { $task in
                TaskRowView(task: $task)
            }
        }
        .padding(.horizontal, 16)
    }
    
    // 5. Bottom Navigation Bar giả lập theo thiết kế mẫu
    var bottomTabBar: some View {
        HStack {
            Spacer()
            tabItem(title: "Today", icon: "house.fill", isSelected: selectedTab == 0) {
                selectedTab = 0
            }
            Spacer()
            tabItem(title: "Stats", icon: "chart.bar.fill", isSelected: selectedTab == 1) {
                selectedTab = 1
            }
            Spacer()
            tabItem(title: "Settings", icon: "gearshape.fill", isSelected: selectedTab == 2) {
                selectedTab = 2
            }
            Spacer()
        }
        .padding(.vertical, 10)
        .background(Color.white)
        .overlay(Divider(), alignment: .top)
    }
    
    func tabItem(title: String, icon: String, isSelected: Bool, action: @escaping () -> Void) -> some View {
        Button(action: action) {
            VStack(spacing: 4) {
                Image(systemName: icon)
                    .font(.system(size: 20))
                Text(title)
                    .font(.caption2)
            }
            .foregroundColor(isSelected ? .green : .secondary)
        }
    }
}

// MARK: - Task Row Component (HStack)
struct TaskRowView: View {
    @Binding var task: TaskItem
    
    var body: some View {
        HStack(spacing: 14) {
            // Checkbox hoàn thành
            Button {
                withAnimation(.spring()) {
                    task.isCompleted.toggle()
                }
            } label: {
                Image(systemName: task.isCompleted ? "checkmark.square.fill" : "square")
                    .font(.system(size: 22))
                    .foregroundColor(task.isCompleted ? .green : .gray.opacity(0.5))
            }
            
            // Icon danh mục
            Image(systemName: task.iconName)
                .font(.system(size: 18))
                .foregroundColor(.blue)
                .frame(width: 32, height: 32)
                .background(Color.blue.opacity(0.08))
                .clipShape(RoundedRectangle(cornerRadius: 8))
            
            // Tên Task + Phân loại (VStack)
            VStack(alignment: .leading, spacing: 4) {
                Text(task.title)
                    .font(.subheadline)
                    .fontWeight(.medium)
                    .strikethrough(task.isCompleted, color: .secondary)
                    .foregroundColor(task.isCompleted ? .secondary : .primary)
                
                Text(task.category)
                    .font(.system(size: 11, weight: .semibold))
                    .padding(.horizontal, 8)
                    .padding(.vertical, 2)
                    .background(task.badgeColor)
                    .cornerRadius(6)
            }
            
            Spacer()
            
            // Giờ thực hiện
            Text(task.time)
                .font(.caption)
                .foregroundColor(.secondary)
        }
        .padding(.horizontal, 16)
        .padding(.vertical, 12)
        .background(Color.white)
        .cornerRadius(14)
        .shadow(color: .black.opacity(0.03), radius: 4, x: 0, y: 2)
    }
}

// MARK: - Modal Thêm Task Mới (Add Task Sheet)
struct AddTaskSheet: View {
    @Environment(\.dismiss) private var dismiss
    
    @State private var title: String = ""
    @State private var category: String = "Study"
    @State private var time: Date = Date()
    
    var onSave: (TaskItem) -> Void
    
    let categories = ["Study", "Health", "Work", "Personal"]
    
    var body: some View {
        NavigationView {
            Form {
                Section(header: Text("Task Details")) {
                    TextField("Title (e.g. Do physics homework)", text: $title)
                    
                    Picker("Category", selection: $category) {
                        ForEach(categories, id: \.self) { cat in
                            Text(cat)
                        }
                    }
                    
                    DatePicker("Time", selection: $time, displayedComponents: .hourAndMinute)
                }
            }
            .navigationTitle("New Task")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .cancellationAction) {
                    Button("Cancel") { dismiss() }
                }
                ToolbarItem(placement: .confirmationAction) {
                    Button("Save") {
                        let formatter = DateFormatter()
                        formatter.dateFormat = "HH:mm"
                        
                        let newTask = TaskItem(
                            title: title.isEmpty ? "New Task" : title,
                            category: category,
                            isCompleted: false,
                            time: formatter.string(from: time),
                            iconName: iconForCategory(category),
                            badgeColor: colorForCategory(category)
                        )
                        onSave(newTask)
                        dismiss()
                    }
                }
            }
        }
    }
    
    func iconForCategory(_ category: String) -> String {
        switch category {
        case "Study": return "book.fill"
        case "Health": return "figure.run"
        case "Work": return "laptopcomputer"
        default: return "person.2.fill"
        }
    }
    
    func colorForCategory(_ category: String) -> Color {
        switch category {
        case "Study": return .blue.opacity(0.15)
        case "Health": return .pink.opacity(0.15)
        case "Work": return .orange.opacity(0.15)
        default: return .green.opacity(0.15)
        }
    }
}

#Preview {
    ContentView()
}
