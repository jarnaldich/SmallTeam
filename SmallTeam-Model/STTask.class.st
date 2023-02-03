"
I am a STTask. I represent the minimun unit of work that can be assigned to a developer.

I gather information for

- Title and description
- Reference to external info (mail...)
- Who am I assigned to.
- The log of states I have been in.
- The estimated duration.


"
Class {
	#name : #STTask,
	#superclass : #Object,
	#instVars : [
		'assignedTo',
		'creationDate',
		'taskStateLog',
		'estimatedTimeSpan',
		'title',
		'description',
		'refDoc'
	],
	#category : #'SmallTeam-Model'
}
