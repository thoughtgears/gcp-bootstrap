package test

import (
	"github.com/gruntwork-io/terratest/modules/terraform"
	"testing"
)

type Project struct {
	OrgId  string
	ID     string
	Number string
}

func TestTemplate(t *testing.T) {
	t.Parallel()

	input := Project{
		OrgId:  "1234567890",
		ID:     "template-project-1234",
		Number: "1234",
	}

	examplesDir := "../example"

	terraformOptions := terraform.WithDefaultRetryableErrors(t, &terraform.Options{
		// Set the path to the Terraform code that will be tested.
		TerraformDir: examplesDir,
		Vars: map[string]interface{}{
			"id":              input.ID,
			"number":          input.Number,
			"organization_id": input.OrgId,
		},
	})
	defer terraform.Destroy(t, terraformOptions)

	t.Logf("Running in %s", examplesDir)
	terraform.InitAndApply(t, terraformOptions)

	// Do assertions below
}
