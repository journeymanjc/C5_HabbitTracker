//
//  AddActivityView.swift
//  C5_HabbitTracker
//
//  Created by Jae Cho on 5/27/22.
//

import SwiftUI

struct AddActivityView: View {
	@State private var title = ""
	@State private var description = ""
	@ObservedObject var activities: Activities
	
	@Environment(\.dismiss) var dismiss
	
    var body: some View {
		 NavigationView{
			 Form{
				 TextField("Title", text: $title)
				 TextEditor(text: $description)
					 .padding(.horizontal)
					 .lineSpacing(3)
					 .frame(height: 200)
			 }
			 .textFieldStyle(.roundedBorder)
			 .navigationTitle("Add New Activity")
			 .toolbar {
				 Button("Save"){
					 let item = Activity(title: title, description: description)
					 activities.items.append(item)
					 dismiss()
				 }
			 }
		 }
		 
        
    }
}

struct AddActivityView_Previews: PreviewProvider {
    static var previews: some View {
		 AddActivityView(activities: Activities())
    }
}
