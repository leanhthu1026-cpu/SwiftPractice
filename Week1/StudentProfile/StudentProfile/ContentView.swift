import SwiftUI

struct ContentView: View {
    var studentName = "Le Vo Anh Thu"
    var studentID = "SESEIU24000"
    var age = 19
    var gpa = 100.0
    var isStudent = true

    var body: some View {
        ZStack {
            // Background
            Image("pic")
                .resizable()
                .scaledToFill()
                .frame(maxWidth: .infinity, maxHeight: .infinity)
                .ignoresSafeArea()

            // Student information
            VStack(spacing: 12) {
                Image("athu")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 120, height: 120)
                    .clipShape(Circle())

                Text("Student Profile")
                    .font(.largeTitle)
                    .bold()
                
                               // Name
                               HStack {
                                   HStack {
                                       Image(systemName: "person.fill")
                                           .foregroundColor(.blue)
                                       
                                       Text("Name")
                                           .bold()
                                   }
                                   .frame(width: 200, alignment: .leading)
                                   
                                   Text(studentName)
                                   
                                   Spacer()
                               }
                               
                               // Student ID
                               HStack {
                                   HStack {
                                       Image(systemName: "person.text.rectangle.fill")
                                           .foregroundColor(.purple)
                                       
                                       Text("Student ID")
                                           .bold()
                                   }
                                   .frame(width: 200, alignment: .leading)
                                   
                                   Text(studentID)
                                   
                                   Spacer()
                               }
                               
                               // Age
                               HStack {
                                   HStack {
                                       Image(systemName: "calendar")
                                           .foregroundColor(.orange)
                                       
                                       Text("Age")
                                           .bold()
                                   }
                                   .frame(width: 200, alignment: .leading)
                                   
                                   Text("\(age)")
                                   
                                   Spacer()
                               }
                               
                               // GPA
                               HStack {
                                   HStack {
                                       Image(systemName: "graduationcap.fill")
                                           .foregroundColor(.green)
                                       
                                       Text("GPA")
                                           .bold()
                                   }
                                   .frame(width: 200, alignment: .leading)
                                   
                                   Text("\(gpa)")
                                   
                                   Spacer()
                               }
                               
                               // Student
                               HStack {
                                   HStack {
                                       Image(systemName: "checkmark.circle.fill")
                                           .foregroundColor(.green)
                                       
                                       Text("Student")
                                           .bold()
                                   }
                                   .frame(width: 200, alignment: .leading)
                                   
                                   Text(isStudent ? "Yes" : "No")
                                   
                                   Spacer()
                               }
            }
            .padding(30)
            .background(.white.opacity(0.85))
            .cornerRadius(20)
            .padding(20)
        }
    }
}
