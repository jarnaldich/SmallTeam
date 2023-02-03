"
I represent the transition from a Task State to the next, for a reason at a given time. I am a member of the list in TaskStateLog.
"
Class {
	#name : #STTaskStateTransition,
	#superclass : #Object,
	#instVars : [
		'fromState',
		'toState',
		'when',
		'reason'
	],
	#category : #'SmallTeam-Model'
}
