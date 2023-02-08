"
The SmallTeam Application Main Frame
"
Class {
	#name : #ManifestSmallTeamSpec,
	#superclass : #PackageManifest,
	#category : #'SmallTeam-Spec-Manifest'
}

{ #category : #'code-critics' }
ManifestSmallTeamSpec class >> ruleBadMessageRule2V1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#STTaskStatePresenter #initializePresenters #false)) #'2023-02-06T14:58:43.319+01:00') )
]

{ #category : #'code-critics' }
ManifestSmallTeamSpec class >> ruleUnoptimizedAndOrRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#STTaskDualPresenter #initializeStateFilter #false)) #'2023-02-08T17:53:03.003+01:00') )
]
