package main

deny[msg] {
	not input.permissions
	msg = "Workflow permissions are missing"
}
deny[msg] {
	input.permittions != {}
	msg = sprintf("Workflow permissions are not empty: %v", [input.permissions])
}
