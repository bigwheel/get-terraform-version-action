# get terraform version action

Get terraform version from .terraform-version ([tfenv](https://github.com/tfutils/tfenv#terraform-version)) for [`terraform_version` input of setup-terraform action](https://github.com/hashicorp/setup-terraform#inputs).

## Usage

```yaml
steps:
- run: echo '0.11.*' > .terraform-version
- id: gtva
  uses: bigwheel/get-terraform-version-action@v1.1.0
- uses: hashicorp/setup-terraform@v1
  with:
    terraform_version: ${{ steps.gtva.outputs.terraform-version }}
```

Full working examples are [here](https://github.com/bigwheel/get-terraform-version-action/blob/main/.github/workflows/test-action.yml).
