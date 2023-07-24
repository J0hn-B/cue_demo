package gitops

import (
	"tool/cli"
	"tool/exec"
)

multiLineString: """

	    The argocd.yml is a YAML file that contains the installation of ArgoCD in a Kubernetes cluster.

		The check.cue file contains basic CUE code to validate the argocd.yml file.

		The validate_tool.cue file executes all the steps required to validate the argocd.yml file.


	"""

//  Verify that the values in the YAML files are valid according to the CUE rules defined in the cue file
command: validate: {

	intro: cli.Print & {
		text: multiLineString
	}

	// 01: Create a cue file
	create_cue_file: exec.Run & {
		$dep: intro.$done //  explicit dependency to order the execution of the tasks
		cmd: ["bash", "-c", "touch check.cue"]

		// Remember $success: bool is not working, it part of the TODO list
	}

	// 02: Update the CUE code
	print: cli.Print & {
		$dep: create_cue_file.$done
		text: "01. Run 'cue cmd validate'\n\n" +
			"	==> You must see some errors: \n\n" +
			"02. Go to the check.cue file,\n\n" +
			"	-- Uncomment #Role in line 7 \n\n" +
			"	-- Uncomment #Role block in line 28 \n\n" +

			"		==> Run 'cue cmd validate' again\n\n"
	}

	// 03: Run the validation to find patterns in data
	validate: exec.Run & {
		$dep: print.$done
		cmd: ["bash", "-c", "cue vet argocd.yml check.cue -d '#Schema'"]
	}

}
