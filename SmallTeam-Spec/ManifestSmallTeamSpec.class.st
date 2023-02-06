"
Please describe the package using the class comment of the included manifest class. The manifest class also includes other additional metadata for the package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
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
