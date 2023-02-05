"
I am the Spec App for the SmallTeam App.
"
Class {
	#name : #STApp,
	#superclass : #SpApplication,
	#category : #'SmallTeam-Spec'
}

{ #category : #running }
STApp >> run [
	"Run the app"
	(self new: STTaskListPresenter) openWithSpec.
]
