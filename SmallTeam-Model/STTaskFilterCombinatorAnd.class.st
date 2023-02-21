"
I am a task filter combinator. I return true if all my children return true.
"
Class {
	#name : #STTaskFilterCombinatorAnd,
	#superclass : #STTaskFilterCombinator,
	#category : #'SmallTeam-Model'
}

{ #category : #accessing }
STTaskFilterCombinatorAnd >> boolBlock [

	^ boolBlock ifNil: [ boolBlock := [ :t | 
			self children allSatisfy: [ :f | f value: t ] ] ]
]
