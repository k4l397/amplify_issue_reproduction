# Amplify issue reproduction

1. Fork this repo
2. `cp infra/sample.tfvars infra/.tfvars`
3. Update `.tfvars` with the fork repos URL
4. Set the repo access token to one with appropriate permissions for amplify
5. Set AWS credentials in environment
6. `cd infra` then `make apply`

## Result

The amplify app should be deployed. At the build/frontend stage it fails with the error:

```

```
