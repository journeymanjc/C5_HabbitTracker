//
//  ShowActivityView.swift
//  C5_HabbitTracker
//
//  Created by Jae Cho on 5/27/22.
//

import SwiftUI

struct ShowActivityView: View {
	var selectedActivity : Activity
	@ObservedObject var activities : Activities
    var body: some View {
		 VStack{
			 Text(selectedActivity.title)
			 Text(selectedActivity.description)
			 Text("Current Completion : \(selectedActivity.completionCounter)" )
			 Button("Completed"){
				 if let index = activities.items.firstIndex(of: selectedActivity){
					 activities.items[index].completionCounter += 1
				 }
			 }
		 }
    }
}

struct ShowActivityView_Previews: PreviewProvider {
    static var previews: some View {
		 ShowActivityView(selectedActivity: Activity(title: "TEST", description: "TEST"), activities: Activities())
    }
}
