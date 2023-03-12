### To do:

---
- Add instance name, IP, and ssh key file to terraform outputs
- Parse ansible facts from terraform outputs and template into configs
  - https://stackoverflow.com/questions/40353666/how-to-pass-terraform-outputs-variables-into-ansible-as-vars-files
- Add a destroy option to tear everything down
- Update README to match current state
---
- Add AWS Spot toggle and target
---
- Add donation links
- Add sponsor links
---
- Add CI with acceptance tests
- cycle create, validate available, and destroy from docker container or ci runner
Add flags and conditional logic to create key, subnet, vpc to AWS terraform
- add test to create everything first, then overlay test that uses existing, then destroy both
- add ci state badges to README
---
- Add support for other cloud providers
---
- Replace just with a rust CLI
