//
//  ContentView.swift
//  C5_HabbitTracker
//
//  Created by Jae Cho on 5/27/22.
//

/**
 Should have the following
 1. list of all activities.
 2. a form to add new activities.  (a title and description)
 3. tapping on a activity should show details of the activity.
 
 Extra use UserDefaults to store the data using Codable
 
 */


import SwiftUI

struct Activity: Codable {
	var title : String
	var description : String
}


class Activities: ObservableObject{
	@Published var activites = [Activity](){
		//Save each entry to UserDefaults
		didSet{
			if let encoded = try? JSONEncoder().encode(activites){
				UserDefaults.standard.set(encoded, forKey: "Activities")
			}
		}
	}
	init(){
		//On init we want to restore from UserDefaults and load it into activities.
		if let savedItems = UserDefaults.standard.data(forKey: "Activities"){
			if let decodedItems = try? JSONDecoder().decode([Activity].self, from: savedItems){
				activites = decodedItems
			}
		}
	}
	
}




struct ContentView: View {

	@StateObject var activities = Activities()
	@State private var showAddActivity = false
	
	let columns = [GridItem(.adaptive(minimum: 200))]
	
	var body: some View {
		 NavigationView{
			 ScrollView{
				 LazyVGrid(columns: columns){
					 NavigationLink{
						 //the new View for each should go here.
						 ShowActivityView()
					 } label: {
						 Text("Title")
					 }
				 }
			 }
			 .navigationTitle("Habbit Tracker")
			 .toolbar {
				 Button{
					 showAddActivity = true
				 } label : {
					 Image(systemName: "plus.circle")
				 }
			 }
		 }
		 .sheet(isPresented: $showAddActivity) {
			 AddActivityView()
		 }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
