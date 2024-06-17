# gha-kubectl

A GitHub Action to setup a specific kubectl version using Kubernetes apt repo.

## Usage

```yaml
jobs:
  deploy:
    runs-on: ubuntu-latest

    steps:
      - name: Setup kubectl
        uses: ShoraiConsulting/gha-kubectl@v1
        with:
          version: 1.29
```