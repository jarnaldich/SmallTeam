"
I am the Spec App for the SmallTeam App.
"
Class {
	#name : #STApp,
	#superclass : #SpApplication,
	#category : #'SmallTeam-Spec'
}

{ #category : #adding }
STApp class >> addToWorldMenu: aBuilder [
	"Add the application to the world menu."	
	<worldMenu>
	(aBuilder item: #Tasques)
		order: 100;
		action: [ self new run ].
]

{ #category : #running }
STApp >> run [

	"Run the app"

	(self new: STAppMainFrame ) open
]
